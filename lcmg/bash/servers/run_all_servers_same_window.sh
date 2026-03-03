#!/bin/bash
source "$(dirname "$0")/../config.sh"

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

# 3. Install dependencies once for all servers
echo "Installing dependencies..."
uv sync

# Export all environment variables
export HOST
export P_M_PORT I_T_M_PORT C_S_A_R_M_PORT I_A_R_M_PORT O_I_M_PORT O_M_PORT PR_M_PORT \
       T_A_M_PORT T_B_M_PORT T_D_M_PORT T_E_M_PORT V_R_M_PORT W_M_PORT

# 4. Launch all servers in the background
echo "Starting all servers..."
uv run python "$P_M_SERVER_PATH"      &
uv run python "$I_T_M_SERVER_PATH"    &
uv run python "$C_S_A_R_M_SERVER_PATH" &
uv run python "$I_A_R_M_SERVER_PATH"  &
uv run python "$O_I_M_SERVER_PATH"    &
uv run python "$O_M_SERVER_PATH"      &
uv run python "$PR_M_SERVER_PATH"     &
uv run python "$T_A_M_SERVER_PATH"    &
uv run python "$T_B_M_SERVER_PATH"    &
uv run python "$T_D_M_SERVER_PATH"    &
uv run python "$T_E_M_SERVER_PATH"    &
uv run python "$V_R_M_SERVER_PATH"    &
uv run python "$W_M_SERVER_PATH"      &

echo "All servers started. Press Ctrl+C to stop all."
wait
