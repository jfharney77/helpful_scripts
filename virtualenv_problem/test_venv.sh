#!/bin/bash
# Test that the virtual environment and installed packages work correctly

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv"

if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Run setup_venv.sh first."
    exit 1
fi

source "$VENV_DIR/bin/activate"

echo "Python: $(which python)"
echo "Python version: $(python --version)"

# Verify Python 3.11 is being used
if ! python --version 2>&1 | grep -q "3.11"; then
    echo "WARNING: Expected Python 3.11 but got $(python --version)"
fi
echo ""

python - <<'EOF'
import importlib, sys

packages = ["requests", "fastapi", "uvicorn"]
for pkg in packages:
    try:
        mod = importlib.import_module(pkg)
        version = getattr(mod, "__version__", "unknown")
        print(f"  [OK] {pkg} ({version})")
    except ImportError as e:
        print(f"  [FAIL] {pkg} - {e}")
        sys.exit(1)

print("\nAll packages imported successfully!")
EOF
