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

:: 3. Install dependencies once for all servers
echo Installing dependencies...
uv sync

:: 4. Launch all servers in the background (same window)
echo Starting all servers...
start /B uv run python "%P_M_SERVER_PATH%"
start /B uv run python "%I_T_M_SERVER_PATH%"
start /B uv run python "%C_S_A_R_M_SERVER_PATH%"
start /B uv run python "%I_A_R_M_SERVER_PATH%"
start /B uv run python "%O_I_M_SERVER_PATH%"
start /B uv run python "%O_M_SERVER_PATH%"
start /B uv run python "%PR_M_SERVER_PATH%"
start /B uv run python "%T_A_M_SERVER_PATH%"
start /B uv run python "%T_B_M_SERVER_PATH%"
start /B uv run python "%T_D_M_SERVER_PATH%"
start /B uv run python "%T_E_M_SERVER_PATH%"
start /B uv run python "%V_R_M_SERVER_PATH%"
start /B uv run python "%W_M_SERVER_PATH%"

echo All servers started. Press any key to exit.
pause
