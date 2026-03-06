#!/bin/bash
# Run global_supervisor.py using the Python 3.11 virtual environment

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv_311"

if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Run setup_venv_311.sh first."
    exit 1
fi

source "$VENV_DIR/bin/activate"
echo "Python: $(which python) ($(python --version))"
echo "Starting global_supervisor..."
python "$SCRIPT_DIR/src/backend/global_supervisor.py"
