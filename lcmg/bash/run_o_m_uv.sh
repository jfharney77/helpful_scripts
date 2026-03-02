#!/bin/bash
source "$(dirname "$0")/config.sh"

# 1. Install uv if not installed
if ! command -v uv &> /dev/null; then
    echo "uv not found. Installing..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

# Set venv location to PROJ_ROOT
export UV_PROJECT_ENVIRONMENT="$PROJ_ROOT/.venv"

# Navigate to PROJ_ROOT for uv operations
cd "$PROJ_ROOT" || exit 1

# 2. Initialize uv if no pyproject.toml
if [ ! -f "pyproject.toml" ]; then
    echo "No pyproject.toml found. Initializing uv project..."
    uv init
fi

# 3. Install dependencies from pyproject.toml
echo "Installing dependencies..."
uv sync

# 4. Run the fastapi app
export HOST
export O_M_PORT
echo "Starting o_m server on $HOST:$O_M_PORT..."
uv run python "$O_M_SERVER_PATH"
