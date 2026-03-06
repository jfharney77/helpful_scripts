#!/bin/bash
# Set up a uv-based virtual environment using requirements.txt

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$SCRIPT_DIR/.venv"

# 1. Install uv if not available
if ! command -v uv &> /dev/null; then
    echo "uv not found. Installing..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

# 2. Generate pyproject.toml from requirements.txt
echo "Generating pyproject.toml from requirements.txt..."
python3 - "$SCRIPT_DIR/requirements.txt" "$SCRIPT_DIR/pyproject.toml" <<'EOF'
import sys

req_file = sys.argv[1]
toml_file = sys.argv[2]

with open(req_file) as f:
    deps = [line.strip() for line in f if line.strip()]

lines = [
    '[project]',
    'name = "virtualenv-problem"',
    'version = "0.1.0"',
    'requires-python = ">=3.11"',
    'dependencies = [',
]
for dep in deps:
    lines.append(f'    "{dep}",')
lines.append(']')
lines.append('')

with open(toml_file, 'w') as f:
    f.write('\n'.join(lines))

print(f"pyproject.toml written with {len(deps)} dependencies.")
EOF

# 3. Create the virtual environment and install dependencies
export UV_PROJECT_ENVIRONMENT="$VENV_DIR"
cd "$SCRIPT_DIR" || exit 1

echo "Running uv sync..."
uv sync

echo ""
echo "Installed packages:"
source "$VENV_DIR/bin/activate"
pip list | grep -iE "$(grep -v '^$' "$SCRIPT_DIR/requirements.txt" | paste -sd'|')"

chmod +x "$VENV_DIR/bin/activate"
