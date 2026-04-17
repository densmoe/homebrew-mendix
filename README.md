# homebrew-mendix

Homebrew tap and Scoop bucket for installing [Mendix Studio Pro](https://www.mendix.com/) versions side-by-side.

## macOS (Homebrew)

```bash
brew tap densmoe/mendix
brew install --cask mendix-studio-pro@11.9.1
```

Each version installs as a separate app, so you can have multiple versions installed simultaneously.

## Windows (Scoop)

```powershell
scoop bucket add mendix https://github.com/densmoe/homebrew-mendix
scoop install mendix-studio-pro-11.9.1
```

## Available versions

Check the [`Casks/`](Casks/) directory for available Homebrew casks and [`bucket/`](bucket/) for Scoop manifests.

## Adding a new version

```bash
./scripts/generate.sh 11.9.1
```

This downloads the installer, computes the SHA256 hash, and generates both a Homebrew cask and a Scoop manifest.

### Version format

- **Mx11+**: `11.9.1` (clean semver)
- **Mx10 and below**: `10.24.13.86719` (includes build number)

Mx10 download URLs require the build number. You can find it in the Studio Pro "About" dialog or on the [Mendix release notes](https://docs.mendix.com/releasenotes/studio-pro/).

## How it works

Installers are downloaded directly from Mendix's public artifact server (`artifacts.rnd.mendix.com`). No authentication required.

- **macOS**: `.pkg` installer via Homebrew Cask
- **Windows**: `.exe` installer via Scoop

## Notes

- Studio Pro for Mac is currently in beta — app names include a "Beta" suffix
- Mx10 uses 4-part versioning (`10.x.y.build`), Mx11+ uses semver (`11.x.y`)
