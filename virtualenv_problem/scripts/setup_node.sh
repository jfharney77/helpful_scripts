#!/bin/bash
# Install and set up nvm, Node.js, and npm on Linux if not already present

set -e

NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
NODE_VERSION="--lts"

# ── nvm ──────────────────────────────────────────────────────────────────────
if [ -s "$NVM_DIR/nvm.sh" ]; then
    echo "nvm already installed at $NVM_DIR"
else
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
fi

# Load nvm into this shell session
export NVM_DIR="$NVM_DIR"
# shellcheck source=/dev/null
source "$NVM_DIR/nvm.sh"

echo "nvm version: $(nvm --version)"

# ── Node.js ───────────────────────────────────────────────────────────────────
echo "Installing Node.js LTS..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# ── npm ───────────────────────────────────────────────────────────────────────
echo "Updating npm to latest..."
npm install -g npm@latest

# ── Confirm versions ──────────────────────────────────────────────────────────
echo ""
echo "Setup complete:"
echo "  nvm  : $(nvm --version)"
node --version
npm --version
echo ""
echo "NOTE: To use nvm in new shells, add the following to your ~/.bashrc or ~/.zshrc:"
echo '  export NVM_DIR="$HOME/.nvm"'
echo '  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"'
