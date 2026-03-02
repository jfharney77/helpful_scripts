@echo off
call "%~dp0..\config.bat"

:: 1. Install uv if not installed
where uv >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo uv not found. Installing...
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
)

:: Set venv location to PROJ_ROOT
set UV_PROJECT_ENVIRONMENT=%PROJ_ROOT%\.venv

:: Navigate to PROJ_ROOT for uv operations (pushd handles UNC paths)
pushd "%PROJ_ROOT%"

:: 2. Initialize uv if no pyproject.toml
if not exist "pyproject.toml" (
    echo No pyproject.toml found. Initializing uv project...
    uv init
)

:: 3. Install dependencies from pyproject.toml
echo Installing dependencies...
uv sync

:: 4. Run the client
echo Running pr_m client...
uv run python "%PR_M_CLIENT_PATH%"
