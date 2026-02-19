#!/bin/bash
# install.sh

set -euo pipefail

INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/sirknigget/cludo/main/scripts/cludo"

die() {
  echo "Error: $*" >&2
  exit 1
}

# Create directory if it doesn't exist
mkdir -p "$INSTALL_DIR" || die "failed to create directory $INSTALL_DIR"

# Download the script
curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/cludo" || die "failed to download cludo from $SCRIPT_URL"

# Make it executable
chmod +x "$INSTALL_DIR/cludo" || die "failed to make $INSTALL_DIR/cludo executable"

echo "cludo installed successfully to $INSTALL_DIR"
echo "Make sure $INSTALL_DIR is in your PATH"
