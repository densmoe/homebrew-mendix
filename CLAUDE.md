# homebrew-mendix

Homebrew tap for installing Mendix Studio Pro versions side-by-side on macOS.

## Project structure

```
Casks/                              Homebrew cask files (one per version)
tools/cask-generator/               Go CLI that fetches versions from Mendix Marketplace and generates casks
.github/workflows/ci.yml            Lint and audit on push/PR
.github/workflows/update-casks.yml  Daily cask generation (opens PRs)
```

## Key commands

### Generate casks

```bash
cd tools/cask-generator
go run . -cask-dir ../../Casks                # full run with SHA256 (slow — downloads each installer)
go run . -cask-dir ../../Casks -skip-sha      # fast, placeholder SHA256
go run . -cask-dir ../../Casks -dry-run       # preview only
```

### Lint and audit

```bash
brew audit --cask --strict Casks/mendix-studio-pro@11.9.1.rb
brew style Casks/
```

### Local install testing

```bash
brew install --cask ./Casks/mendix-studio-pro@11.9.1.rb
brew uninstall --cask mendix-studio-pro@11.9.1
```

## How the CLI works

1. Queries `https://marketplace.mendix.com/xas/` (anonymous, no auth) to list all Studio Pro releases
2. Filters by version type (LTS, MTS, Stable) and minimum major version (10+)
3. Checks which casks already exist in Casks/
4. For each new version, verifies the Mac installer exists on the CDN
5. Downloads the installer to compute SHA256 (unless -skip-sha)
6. Writes the cask .rb file

## Version patterns

- **Mx11+**: clean semver — `11.9.1`
- **Mx10**: includes build number — `10.24.13.86719`
- **Mx10.6 and below**: no Mac installer available (skipped)

Download URL: `https://artifacts.rnd.mendix.com/modelers/Mendix-{VERSION}-Mac-Setup.pkg`

## App naming (Mac)

- Mx11+: `Mendix Studio Pro {VERSION} Beta.app`
- Mx10: `Studio Pro {VERSION}-Beta.app`

The "Beta" suffix exists because Studio Pro for Mac is still in beta.

## Git workflow

- Default branch: `main`
- GitHub: `densmoe/homebrew-mendix`
- Never push directly to `main` — use branches and PRs
- Daily workflow opens PRs for new casks automatically
