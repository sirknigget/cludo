#!/bin/bash
# install.sh

set -euo pipefail

INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/sirknigget/cdo/main/scripts/cdo"

die() {
  echo "Error: $*" >&2
  exit 1
}

# Create directory if it doesn't exist
mkdir -p "$INSTALL_DIR" || die "failed to create directory $INSTALL_DIR"

# Download the script
curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/cdo" || die "failed to download cdo from $SCRIPT_URL"

# Make it executable
chmod +x "$INSTALL_DIR/cdo" || die "failed to make $INSTALL_DIR/cdo executable"

echo "cdo installed successfully to $INSTALL_DIR"
echo "Make sure $INSTALL_DIR is in your PATH"
