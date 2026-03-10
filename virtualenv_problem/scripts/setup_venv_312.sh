#!/bin/bash
# Experiment: set up a Python 3.12 virtual environment in WSL and install packages

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VENV_DIR="$DATA_DIR/.venv_312"
PYTHON="python3.12"

# 1. Install Python 3.12 if not available
if ! command -v $PYTHON &> /dev/null; then
    echo "Python 3.12 not found. Installing via deadsnakes PPA..."
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:deadsnakes/ppa
    sudo apt-get update
    sudo apt-get install -y python3.12 python3.12-venv
fi

# 2. Check that python3.12-venv is available
if ! $PYTHON -m venv --help > /dev/null 2>&1; then
    echo "python3.12-venv not found. Installing..."
    sudo apt-get install -y python3.12-venv
fi

# 3. Create the virtual environment
if [ -d "$VENV_DIR" ]; then
    echo "Virtual environment already exists at $VENV_DIR"
else
    echo "Creating Python 3.12 virtual environment at $VENV_DIR..."
    $PYTHON -m venv "$VENV_DIR"
    echo "Done."
fi

# 4. Activate and install from requirements.txt
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

echo "Python version: $(python --version)"
echo "Installing packages from requirements.txt..."
pip install --upgrade pip
pip install -r "$DATA_DIR/requirements.txt"

echo ""
echo "Installed packages:"
pip list | grep -iE "$(grep -v '^$' "$DATA_DIR/requirements.txt" | paste -sd'|')"

chmod +x "$VENV_DIR/bin/activate"
