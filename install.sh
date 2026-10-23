#!/usr/bin/env bash
# install.sh — one-shot setup for Leben's NVIDIA Pack (Linux/macOS)
# Installs the packwiz fork (trusted CurseForge key) and exports the .mrpack.
# Usage: bash install.sh
set -euo pipefail

TAG="v0.0.1"
REPO="Lebenoa/packwiz"

# Pick the right release asset for this platform.
case "$(uname -s)-$(uname -m)" in
  Linux-x86_64)  ASSET="packwiz-linux-amd64" ;;
  Linux-aarch64) ASSET="packwiz-linux-arm64" ;;
  Linux-armv7l)  ASSET="packwiz-linux-arm64" ;;
  Darwin-arm64)  ASSET="packwiz-darwin-arm64" ;;
  Darwin-x86_64) ASSET="packwiz-darwin-amd64" ;;
  *) echo "Unsupported platform: $(uname -s)-$(uname -m)" >&2; exit 1 ;;
esac

# 0. Ensure we are in the pack checkout (fetch it if run standalone).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ ! -f "$SCRIPT_DIR/pack.toml" ]; then
    echo "No pack.toml next to the script - fetching pack metadata from GitHub..."
    TMP="$(mktemp -d)"
    curl -L -o "$TMP/pack.tar.gz" "https://github.com/Lebenoa/leben-nvidia-pack/archive/refs/heads/master.tar.gz"
    tar -xzf "$TMP/pack.tar.gz" -C "$TMP"
    mkdir -p "$SCRIPT_DIR"
    cp -r "$TMP"/leben-nvidia-pack-master/* "$SCRIPT_DIR/"
    rm -rf "$TMP" "$SCRIPT_DIR/install.sh"
    echo "Pack fetched into $SCRIPT_DIR"
fi
cd "$SCRIPT_DIR"

# 1. Resolve packwiz: use existing if present, else download fork release.
PACKWIZ=""
if command -v packwiz >/dev/null 2>&1; then
    PACKWIZ="$(command -v packwiz)"
    echo "Found existing packwiz at $PACKWIZ"
    echo "WARNING: must be the Lebenoa/packwiz fork (trusted CurseForge key), not upstream."
    echo "If export fails on InstaPack, that's why — set PACKWIZ_BIN to the fork binary."
else
    DEST="./packwiz"
    echo "Downloading fork packwiz ($ASSET)..."
    curl -L -o "$DEST" "https://github.com/$REPO/releases/download/$TAG/$ASSET"
    chmod +x "$DEST"
    "$DEST" --help >/dev/null  # fail fast if the binary is broken
    PACKWIZ="$DEST"
    echo "Downloaded to $DEST"
fi

# Honor PACKWIZ_BIN override for users who keep the fork somewhere else.
PACKWIZ="${PACKWIZ_BIN:-$PACKWIZ}"

# 2. Export the pack from this repo's checkout.
echo "Exporting .mrpack..."
"$PACKWIZ" modrinth export -o leben-nvidia-pack.mrpack

echo ""
echo "Done: $(pwd)/leben-nvidia-pack.mrpack"
echo "Import it into a Modrinth-compatible launcher (Prism, ATLauncher, ...)."
