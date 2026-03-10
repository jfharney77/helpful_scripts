#!/bin/bash
# Run global_supervisor.py using the Python 3.11 virtual environment

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"
VENV_DIR="$VENV_311"

if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Run setup_venv_311.sh first."
    exit 1
fi

source "$VENV_DIR/bin/activate"
echo "Python: $(which python) ($(python --version))"
echo "Starting global_supervisor..."
python "$BACKEND_DIR/global_supervisor.py"
