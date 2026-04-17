#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<EOF
Usage: $(basename "$0") <version> [--skip-sha]

Generate a Homebrew cask for a Mendix Studio Pro version.

Arguments:
  version      Mendix Studio Pro version (e.g., 11.9.1 or 10.24.13.86719)
  --skip-sha   Skip SHA256 computation (generates placeholder, useful for testing)

Examples:
  $(basename "$0") 11.9.1              # Mx11 — clean semver
  $(basename "$0") 10.24.13.86719      # Mx10 — includes build number
  $(basename "$0") 11.9.1 --skip-sha   # Quick generation without downloading
EOF
    exit 1
}

[[ $# -lt 1 ]] && usage
VERSION="$1"
SKIP_SHA=false
[[ "${2:-}" == "--skip-sha" ]] && SKIP_SHA=true

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

MAJOR="${VERSION%%.*}"

BASE_URL="https://artifacts.rnd.mendix.com/modelers"
MAC_URL="${BASE_URL}/Mendix-${VERSION}-Mac-Setup.pkg"

echo "Checking download URL..."
MAC_STATUS=$(curl -sI -o /dev/null -w "%{http_code}" "$MAC_URL")

if [[ "$MAC_STATUS" != "200" ]]; then
    echo "ERROR: Mac installer not found at $MAC_URL (HTTP $MAC_STATUS)"
    if [[ "$MAJOR" -le 10 ]]; then
        echo "Mx10 and below require the build number (e.g., 10.24.13.86719, not 10.24.13)"
    fi
    exit 1
fi

MAC_SIZE=$(curl -sI "$MAC_URL" | grep -i content-length | awk '{print $2}' | tr -d '\r')
echo "  $MAC_URL ($(( MAC_SIZE / 1048576 )) MB)"

if [[ "$SKIP_SHA" == "true" ]]; then
    MAC_SHA="REPLACE_WITH_SHA256"
    echo "Skipping SHA256 (rerun without --skip-sha before publishing)"
else
    echo "Computing SHA256 (~$(( MAC_SIZE / 1048576 )) MB download)..."
    MAC_SHA=$(curl -#L "$MAC_URL" | shasum -a 256 | awk '{print $1}')
    echo "  SHA256: $MAC_SHA"
fi

if [[ "$MAJOR" -ge 11 ]]; then
    APP_NAME="Mendix Studio Pro ${VERSION} Beta.app"
else
    APP_NAME="Studio Pro ${VERSION}-Beta.app"
fi

CASK_TOKEN="mendix-studio-pro@${VERSION}"
CASK_FILE="${REPO_DIR}/Casks/${CASK_TOKEN}.rb"

mkdir -p "${REPO_DIR}/Casks"

cat > "$CASK_FILE" << CASK
cask "${CASK_TOKEN}" do
  version "${VERSION}"
  sha256 "${MAC_SHA}"

  url "https://artifacts.rnd.mendix.com/modelers/Mendix-#{version}-Mac-Setup.pkg"
  name "Mendix Studio Pro"
  desc "Low-code application development platform"
  homepage "https://www.mendix.com/"

  pkg "Mendix-#{version}-Mac-Setup.pkg"

  # TODO: Update app name when Studio Pro for Mac exits beta
  uninstall delete: "/Applications/${APP_NAME}"
end
CASK

echo "Generated ${CASK_FILE}"

echo ""
echo "=== Next steps ==="
echo ""
echo "Test locally:"
echo "  brew install --cask ${CASK_FILE}"
echo ""
if [[ "$SKIP_SHA" == "true" ]]; then
    echo "WARNING: SHA256 placeholder used. Rerun without --skip-sha before publishing."
fi
