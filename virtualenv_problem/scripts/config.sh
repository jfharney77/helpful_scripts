#!/bin/bash
# config.sh - Central environment variable definitions for virtualenv_problem scripts.
# Source this file at the top of other scripts: source "$(dirname "${BASH_SOURCE[0]}")/config.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJ_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Virtual environments
VENV_311="$PROJ_ROOT/.venv_311"
VENV_312="$PROJ_ROOT/.venv_312"
VENV_UV="$PROJ_ROOT/.venv"

# Source layout
SRC_DIR="$PROJ_ROOT/src"
BACKEND_DIR="$PROJ_ROOT/src/backend"
FRONTEND_DIR="$PROJ_ROOT/frontend"

# Dependencies
REQUIREMENTS_FILE="$PROJ_ROOT/requirements.txt"

# Environment variables
ENV_FILE="$PROJ_ROOT/config/.env"
if [ -f "$ENV_FILE" ]; then
    set -a
    source "$ENV_FILE"
    set +a
fi
