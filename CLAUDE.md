# homebrew-mendix

Homebrew tap for installing Mendix Studio Pro versions side-by-side on macOS.

## Project structure

```
Casks/                          Homebrew cask files (one per version)
scripts/generate.sh             Generate a cask from a version number
```

## Key commands

### Generate a cask

```bash
./scripts/generate.sh 11.9.1              # downloads installer, computes SHA256
./scripts/generate.sh 11.9.1 --skip-sha   # fast, skips download (testing only)
```

### Lint and audit

```bash
brew audit --cask --strict Casks/mendix-studio-pro@11.9.1.rb
brew audit --cask --strict --online Casks/mendix-studio-pro@11.9.1.rb   # also checks URLs
brew style Casks/
brew readall --os=all --arch=all densmoe/mendix
```

### Local install testing

```bash
brew install --cask ./Casks/mendix-studio-pro@11.9.1.rb

brew uninstall --cask mendix-studio-pro@11.9.1
```

## Version patterns

- **Mx11+**: clean semver — `11.9.1`
- **Mx10 and below**: includes build number — `10.24.13.86719`

Download URL: `https://artifacts.rnd.mendix.com/modelers/Mendix-{VERSION}-Mac-Setup.pkg`. No auth required.

## App naming (Mac)

- Mx11+: `Mendix Studio Pro {VERSION} Beta.app`
- Mx10: `Studio Pro {VERSION}-Beta.app`

The "Beta" suffix exists because Studio Pro for Mac is still in beta. Casks and the generate script will need updating when it exits beta.

## Design decisions

- **One cask per version** (`mendix-studio-pro@11.9.1`) for true side-by-side installs — standard casks replace on upgrade.
- **Homebrew Cask** (not Formula) because Studio Pro is a GUI app distributed as .pkg.
- **Generate script** to avoid manual copy-paste errors across versions.

## Git workflow

- Default branch: `main`
- GitHub: `densmoe/homebrew-mendix`
- Never push directly to `main` — use branches and PRs
