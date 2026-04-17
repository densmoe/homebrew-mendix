package main

import (
	"context"
	"crypto/sha256"
	"flag"
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"sync"
	"sync/atomic"
	"text/template"
	"time"
)

const caskTemplate = `cask "{{.Token}}" do
  version "{{.DownloadVersion}}"
  sha256 "{{.SHA256}}"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  uninstall delete: "/Applications/{{.AppName}}"
end
`

type CaskData struct {
	Token           string
	DownloadVersion string
	SHA256          string
	AppName         string
}

type caskJob struct {
	release         Release
	downloadVersion string
	token           string
	appName         string
	macURL          string
}

func main() {
	var (
		caskDir      string
		skipSHA      bool
		dryRun       bool
		versionTypes string
		minMajor     int
		workers      int
	)

	flag.StringVar(&caskDir, "cask-dir", "", "path to Casks/ directory (default: auto-detect from repo root)")
	flag.BoolVar(&skipSHA, "skip-sha", false, "use placeholder SHA256 (for testing)")
	flag.BoolVar(&dryRun, "dry-run", false, "print what would be generated without writing files")
	flag.StringVar(&versionTypes, "version-types", "LTS,MTS,Stable", "comma-separated version types to include")
	flag.IntVar(&minMajor, "min-major", 10, "minimum major version to generate casks for")
	flag.IntVar(&workers, "workers", 5, "number of parallel downloads for SHA256 computation")
	flag.Parse()

	if caskDir == "" {
		exe, err := os.Executable()
		if err == nil {
			repoRoot := filepath.Dir(filepath.Dir(filepath.Dir(exe)))
			caskDir = filepath.Join(repoRoot, "Casks")
		}
		if caskDir == "" || !dirExists(caskDir) {
			caskDir = filepath.Join(".", "Casks")
		}
	}

	types := strings.Split(versionTypes, ",")
	for i := range types {
		types[i] = strings.TrimSpace(types[i])
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Hour)
	defer cancel()

	fmt.Println("Fetching versions from Mendix Marketplace...")
	client, err := NewMarketplaceClient()
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}

	releases, err := client.FetchVersions(ctx, types)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error fetching versions: %v\n", err)
		os.Exit(1)
	}
	fmt.Printf("Found %d releases matching types %v\n", len(releases), types)

	existing := existingCasks(caskDir)
	fmt.Printf("Found %d existing casks in %s\n", len(existing), caskDir)

	var jobs []caskJob
	for _, r := range releases {
		if r.Major < minMajor {
			continue
		}

		dv := downloadVersion(r)
		token := "mendix-studio-pro@" + r.Version

		if existing[token] {
			continue
		}

		macURL := fmt.Sprintf("https://artifacts.rnd.mendix.com/modelers/Mendix-%s-Mac-Setup.pkg", dv)

		if !urlExists(macURL) {
			fmt.Printf("  SKIP %s (installer not found at CDN)\n", dv)
			continue
		}

		jobs = append(jobs, caskJob{
			release:         r,
			downloadVersion: dv,
			token:           token,
			appName:         appName(r),
			macURL:          macURL,
		})
	}

	if len(jobs) == 0 {
		fmt.Println("All casks are up to date.")
		return
	}

	if dryRun {
		for _, j := range jobs {
			fmt.Printf("  Would generate %s.rb\n", j.token)
		}
		fmt.Printf("\nDry run: %d cask(s) would be generated.\n", len(jobs))
		return
	}

	tmpl, err := template.New("cask").Parse(caskTemplate)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error parsing template: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("Generating %d cask(s) with %d parallel workers...\n", len(jobs), workers)

	type result struct {
		job  caskJob
		sha  string
		err  error
	}

	jobCh := make(chan caskJob, len(jobs))
	resultCh := make(chan result, len(jobs))

	var wg sync.WaitGroup
	var completed atomic.Int32
	total := len(jobs)

	for range workers {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := range jobCh {
				sha := "REPLACE_WITH_SHA256"
				var dlErr error
				if !skipSHA {
					sha, dlErr = computeSHA256(j.macURL)
				}
				n := completed.Add(1)
				if dlErr != nil {
					fmt.Printf("  [%d/%d] ERROR %s: %v\n", n, total, j.downloadVersion, dlErr)
				} else {
					fmt.Printf("  [%d/%d] %s SHA256: %s\n", n, total, j.downloadVersion, sha)
				}
				resultCh <- result{job: j, sha: sha, err: dlErr}
			}
		}()
	}

	for _, j := range jobs {
		jobCh <- j
	}
	close(jobCh)

	go func() {
		wg.Wait()
		close(resultCh)
	}()

	var generated int
	for r := range resultCh {
		if r.err != nil {
			continue
		}

		data := CaskData{
			Token:           r.job.token,
			DownloadVersion: r.job.downloadVersion,
			SHA256:          r.sha,
			AppName:         r.job.appName,
		}

		if err := writeCask(tmpl, caskDir, data); err != nil {
			fmt.Fprintf(os.Stderr, "  ERROR: %v\n", err)
			continue
		}
		generated++
	}

	fmt.Printf("\nGenerated %d new cask(s).\n", generated)

	fmt.Println("\nUpdating alias casks...")
	aliasCount := generateAliases(tmpl, caskDir)
	fmt.Printf("Updated %d alias cask(s).\n", aliasCount)
}

func writeCask(tmpl *template.Template, caskDir string, data CaskData) error {
	caskPath := filepath.Join(caskDir, data.Token+".rb")
	f, err := os.Create(caskPath)
	if err != nil {
		return fmt.Errorf("writing %s: %w", caskPath, err)
	}
	defer f.Close()

	if err := tmpl.Execute(f, data); err != nil {
		return fmt.Errorf("generating %s: %w", caskPath, err)
	}
	return nil
}

func generateAliases(tmpl *template.Template, caskDir string) int {
	type caskInfo struct {
		version         [4]int // major, minor, patch, build
		downloadVersion string
		sha256          string
		appName         string
	}

	entries, err := os.ReadDir(caskDir)
	if err != nil {
		return 0
	}

	var casks []caskInfo
	for _, e := range entries {
		name := strings.TrimSuffix(e.Name(), ".rb")
		if name == e.Name() || !strings.HasPrefix(name, "mendix-studio-pro@") {
			continue
		}
		ver := strings.TrimPrefix(name, "mendix-studio-pro@")
		// Skip existing aliases
		parts := parseVersionParts(ver)
		if len(parts) < 3 {
			continue
		}

		dv, sha, app := readCaskFields(filepath.Join(caskDir, e.Name()))
		if sha == "" {
			continue
		}

		var v [4]int
		for i := 0; i < len(parts) && i < 4; i++ {
			v[i] = parts[i]
		}
		casks = append(casks, caskInfo{version: v, downloadVersion: dv, sha256: sha, appName: app})
	}

	// Find latest for each alias: "latest", "N", "N.M"
	type alias struct {
		token string
		best  caskInfo
	}

	aliases := map[string]*alias{}

	// "latest" alias
	aliases["latest"] = &alias{token: "mendix-studio-pro@latest"}

	for _, c := range casks {
		// Update "latest"
		a := aliases["latest"]
		if versionGreater(c.version, a.best.version) {
			a.best = c
		}

		// "N" alias (e.g., "10", "11")
		majorKey := fmt.Sprintf("%d", c.version[0])
		majorToken := "mendix-studio-pro@" + majorKey
		if _, ok := aliases[majorKey]; !ok {
			aliases[majorKey] = &alias{token: majorToken}
		}
		if versionGreater(c.version, aliases[majorKey].best.version) {
			aliases[majorKey].best = c
		}

		// "N.M" alias (e.g., "10.24", "11.9")
		minorKey := fmt.Sprintf("%d.%d", c.version[0], c.version[1])
		minorToken := "mendix-studio-pro@" + minorKey
		if _, ok := aliases[minorKey]; !ok {
			aliases[minorKey] = &alias{token: minorToken}
		}
		if versionGreater(c.version, aliases[minorKey].best.version) {
			aliases[minorKey].best = c
		}
	}

	count := 0
	for _, a := range aliases {
		if a.best.sha256 == "" {
			continue
		}
		data := CaskData{
			Token:           a.token,
			DownloadVersion: a.best.downloadVersion,
			SHA256:          a.best.sha256,
			AppName:         a.best.appName,
		}
		if err := writeCask(tmpl, caskDir, data); err != nil {
			fmt.Fprintf(os.Stderr, "  ERROR alias %s: %v\n", a.token, err)
			continue
		}
		fmt.Printf("  %s -> %s\n", a.token, a.best.downloadVersion)
		count++
	}
	return count
}

func versionGreater(a, b [4]int) bool {
	for i := 0; i < 4; i++ {
		if a[i] != b[i] {
			return a[i] > b[i]
		}
	}
	return false
}

func readCaskFields(path string) (downloadVersion, sha256, appName string) {
	data, err := os.ReadFile(path)
	if err != nil {
		return "", "", ""
	}
	for _, line := range strings.Split(string(data), "\n") {
		line = strings.TrimSpace(line)
		if strings.HasPrefix(line, "version ") {
			downloadVersion = strings.Trim(strings.TrimPrefix(line, "version "), `"`)
		} else if strings.HasPrefix(line, "sha256 ") {
			sha256 = strings.Trim(strings.TrimPrefix(line, "sha256 "), `"`)
		} else if strings.HasPrefix(line, "uninstall delete:") {
			// extract app name from: uninstall delete: "/Applications/Foo.app"
			if i := strings.Index(line, "/Applications/"); i != -1 {
				appName = strings.Trim(line[i+len("/Applications/"):], `"`)
			}
		}
	}
	return
}

func downloadVersion(r Release) string {
	if r.Major >= 11 {
		return r.Version
	}
	if r.VersionFull != "" && r.VersionFull != r.Version {
		return r.VersionFull
	}
	return r.Version
}

func appName(r Release) string {
	v := downloadVersion(r)
	if r.Major >= 11 {
		return fmt.Sprintf("Mendix Studio Pro %s Beta.app", v)
	}
	return fmt.Sprintf("Studio Pro %s-Beta.app", v)
}

func existingCasks(dir string) map[string]bool {
	casks := make(map[string]bool)
	entries, err := os.ReadDir(dir)
	if err != nil {
		return casks
	}
	for _, e := range entries {
		if e.IsDir() {
			continue
		}
		name := strings.TrimSuffix(e.Name(), ".rb")
		if name != e.Name() {
			casks[name] = true
		}
	}
	return casks
}

func urlExists(url string) bool {
	client := &http.Client{Timeout: 10 * time.Second}
	resp, err := client.Head(url)
	if err != nil {
		return false
	}
	resp.Body.Close()
	return resp.StatusCode == http.StatusOK
}

func computeSHA256(url string) (string, error) {
	client := &http.Client{Timeout: 10 * time.Minute}
	resp, err := client.Get(url)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return "", fmt.Errorf("HTTP %d", resp.StatusCode)
	}

	h := sha256.New()
	if _, err := io.Copy(h, resp.Body); err != nil {
		return "", err
	}

	return fmt.Sprintf("%x", h.Sum(nil)), nil
}

func dirExists(path string) bool {
	info, err := os.Stat(path)
	return err == nil && info.IsDir()
}
