#!/bin/bash
# Run global_supervisor.py using the Python 3.12 virtual environment

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATA_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VENV_DIR="$DATA_DIR/.venv_312"

if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Run setup_venv_312.sh first."
    exit 1
fi

source "$VENV_DIR/bin/activate"
echo "Python: $(which python) ($(python --version))"
echo "Starting global_supervisor..."
python "$DATA_DIR/src/backend/global_supervisor.py"
