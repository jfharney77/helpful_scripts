#!/bin/bash
# Run global_supervisor.py using uv

source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

if ! command -v uv &> /dev/null; then
    echo "uv not found. Installing..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

export UV_PROJECT_ENVIRONMENT="$VENV_UV"
cd "$PROJ_ROOT" || exit 1

echo "Starting global_supervisor..."
uv run python "$BACKEND_DIR/global_supervisor.py"
