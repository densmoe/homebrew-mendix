# homebrew-mendix

Homebrew tap for installing [Mendix Studio Pro](https://www.mendix.com/) versions side-by-side on macOS.

## Install

```bash
brew tap densmoe/mendix
brew install --cask mendix-studio-pro@11.9.1
```

Each version installs as a separate app (e.g., `Mendix Studio Pro 11.9.1 Beta.app`), so you can have multiple versions installed simultaneously.

## Available versions

Check the [`Casks/`](Casks/) directory for available versions. Casks are generated automatically for all Mendix Studio Pro releases that have a macOS installer (Mx10.7+).

## How it works

Installers are downloaded directly from Mendix's public artifact server (`artifacts.rnd.mendix.com`). No authentication required.

A daily [GitHub Actions workflow](.github/workflows/update-casks.yml) checks the Mendix Marketplace for new releases and opens a PR with any new casks.

## Adding a version manually

```bash
cd tools/cask-generator
go run . -cask-dir ../../Casks -skip-sha
```

Flags:
- `-skip-sha` — use placeholder SHA256 (for testing)
- `-dry-run` — print what would be generated without writing files
- `-version-types` — comma-separated types to include (default: `LTS,MTS,Stable`)
- `-min-major` — minimum major version (default: `10`)

## Notes

- Studio Pro for Mac is currently in beta — app names include a "Beta" suffix
- Mac installers are available from Mx10.7 onwards
- Mx10 uses 4-part versioning (`10.x.y.build`), Mx11+ uses semver (`11.x.y`)
