#!/bin/bash
# Run global_supervisor.py using uv

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v uv &> /dev/null; then
    echo "uv not found. Installing..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

export UV_PROJECT_ENVIRONMENT="$SCRIPT_DIR/.venv"
cd "$SCRIPT_DIR" || exit 1

echo "Starting global_supervisor..."
uv run python "$SCRIPT_DIR/src/backend/global_supervisor.py"
