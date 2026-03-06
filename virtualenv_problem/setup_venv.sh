#!/bin/bash
# Experiment: set up a Python virtual environment in WSL and install packages

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv"

# 1. Check that python3-venv is installed (common missing piece on Ubuntu/Debian WSL)
if ! python3 -m venv --help > /dev/null 2>&1; then
    echo "python3-venv not found. Installing..."
    sudo apt-get update && sudo apt-get install -y python3-venv
fi

# 2. Create the virtual environment
if [ -d "$VENV_DIR" ]; then
    echo "Virtual environment already exists at $VENV_DIR"
else
    echo "Creating virtual environment at $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
    echo "Done."
fi

# 3. Activate and install packages
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

echo "Installing packages..."
pip install --upgrade pip
pip install requests fastapi uvicorn

echo ""
echo "Installed packages:"
pip list | grep -E "requests|fastapi|uvicorn"

echo ""
echo "Virtual environment is active. Run 'deactivate' to exit."
