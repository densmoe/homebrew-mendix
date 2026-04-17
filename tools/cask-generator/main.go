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
	"text/template"
	"time"
)

const caskTemplate = `cask "{{.Token}}" do
  version "{{.Version}}"
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
	Token   string
	Version string
	SHA256  string
	AppName string
}

func main() {
	var (
		caskDir      string
		skipSHA      bool
		dryRun       bool
		versionTypes string
		minMajor     int
	)

	flag.StringVar(&caskDir, "cask-dir", "", "path to Casks/ directory (default: auto-detect from repo root)")
	flag.BoolVar(&skipSHA, "skip-sha", false, "use placeholder SHA256 (for testing)")
	flag.BoolVar(&dryRun, "dry-run", false, "print what would be generated without writing files")
	flag.StringVar(&versionTypes, "version-types", "LTS,MTS,Stable", "comma-separated version types to include")
	flag.IntVar(&minMajor, "min-major", 10, "minimum major version to generate casks for")
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

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Minute)
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

	tmpl, err := template.New("cask").Parse(caskTemplate)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error parsing template: %v\n", err)
		os.Exit(1)
	}

	var generated int
	for _, r := range releases {
		if r.Major < minMajor {
			continue
		}

		downloadVersion := downloadVersion(r)
		token := "mendix-studio-pro@" + downloadVersion

		if existing[token] {
			continue
		}

		appName := appName(r)
		macURL := fmt.Sprintf("https://artifacts.rnd.mendix.com/modelers/Mendix-%s-Mac-Setup.pkg", downloadVersion)

		if !urlExists(macURL) {
			fmt.Printf("  SKIP %s (installer not found at CDN)\n", downloadVersion)
			continue
		}

		sha := "REPLACE_WITH_SHA256"
		if !skipSHA {
			fmt.Printf("  Downloading %s for SHA256...\n", downloadVersion)
			var err error
			sha, err = computeSHA256(macURL)
			if err != nil {
				fmt.Fprintf(os.Stderr, "  ERROR computing SHA256 for %s: %v\n", downloadVersion, err)
				continue
			}
			fmt.Printf("  SHA256: %s\n", sha)
		}

		data := CaskData{
			Token:   token,
			Version: downloadVersion,
			SHA256:  sha,
			AppName: appName,
		}

		if dryRun {
			fmt.Printf("  Would generate %s.rb\n", token)
			generated++
			continue
		}

		caskPath := filepath.Join(caskDir, token+".rb")
		f, err := os.Create(caskPath)
		if err != nil {
			fmt.Fprintf(os.Stderr, "  ERROR writing %s: %v\n", caskPath, err)
			continue
		}

		if err := tmpl.Execute(f, data); err != nil {
			f.Close()
			fmt.Fprintf(os.Stderr, "  ERROR generating %s: %v\n", caskPath, err)
			continue
		}
		f.Close()

		fmt.Printf("  Generated %s\n", caskPath)
		generated++
	}

	if generated == 0 {
		fmt.Println("All casks are up to date.")
	} else if dryRun {
		fmt.Printf("\nDry run: %d cask(s) would be generated.\n", generated)
	} else {
		fmt.Printf("\nGenerated %d new cask(s).\n", generated)
	}
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
