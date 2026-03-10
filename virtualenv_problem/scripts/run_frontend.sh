#!/bin/bash
# Run the React frontend on port 3000

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

# ── Check for nvm / node / npm, install if missing ───────────────────────────
NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

# Load nvm if available but not yet in the session
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

if ! command -v node &> /dev/null || ! command -v npm &> /dev/null || ! command -v nvm &> /dev/null 2>&1; then
    echo "node, npm, or nvm not found. Running setup_node.sh..."
    bash "$SCRIPT_DIR/setup_node.sh"
    # Re-load nvm after setup
    source "$NVM_DIR/nvm.sh"
else
    echo "node $(node --version), npm $(npm --version), nvm $(nvm --version) already installed."
fi

# ── Install npm dependencies if node_modules is missing ──────────────────────
if [ ! -d "$FRONTEND_DIR/node_modules" ]; then
    echo "node_modules not found. Running npm install..."
    npm --prefix "$FRONTEND_DIR" install
fi

echo "Starting React app on http://localhost:3000..."
npm --prefix "$FRONTEND_DIR" run dev -- --port 3000
