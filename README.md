# homebrew-mendix

Homebrew tap for installing [Mendix Studio Pro](https://www.mendix.com/) versions side-by-side on macOS.

## Install

```bash
brew tap densmoe/mendix
```

### Specific version

```bash
brew install --cask mendix-studio-pro@11.9.1
brew install --cask mendix-studio-pro@10.24.6
```

### Latest version

```bash
brew install --cask mendix-studio-pro@latest
```

### Latest patch for a major or minor version

```bash
brew install --cask mendix-studio-pro@11       # latest Mx11
brew install --cask mendix-studio-pro@10       # latest Mx10
brew install --cask mendix-studio-pro@10.24    # latest 10.24.x
```

Each version installs as a separate app, so you can have multiple versions installed simultaneously.

## Available versions

Check the [`Casks/`](Casks/) directory for all available versions. Casks are generated automatically for every Mendix Studio Pro release that has a macOS installer (Mx10.7+).

A daily [GitHub Actions workflow](.github/workflows/update-casks.yml) checks the Mendix Marketplace for new releases and opens a PR with any new casks.

## How it works

A [Go CLI](tools/cask-generator/) queries the Mendix Marketplace API for all available versions, checks which casks already exist, and generates new ones with verified SHA256 hashes. It also generates alias casks (`@latest`, `@11`, `@10.24`, etc.) that always point to the latest matching version.

## Notes

- Studio Pro for Mac is currently in beta — app names include a "Beta" suffix
- Mac installers are available from Mx10.7 onwards
- Mx10 uses 4-part versioning (`10.x.y.build`) but cask names use the short form (`10.24.6`)
