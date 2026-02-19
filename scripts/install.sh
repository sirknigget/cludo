#!/bin/bash
# install.sh

INSTALL_DIR="${HOME}/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/sirknigget/cludo/main/cludo"

# Create directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download the script
curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/cludo"

# Make it executable
chmod +x "$INSTALL_DIR/cludo"

echo "cludo installed successfully to $INSTALL_DIR"
echo "Make sure $INSTALL_DIR is in your PATH"
