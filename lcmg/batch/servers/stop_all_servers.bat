@echo off
call "%~dp0..\config.bat"

echo Stopping all servers...
for %%P in (
    %P_M_PORT%
    %I_T_M_PORT%
    %C_S_A_R_M_PORT%
    %I_A_R_M_PORT%
    %O_I_M_PORT%
    %O_M_PORT%
    %PR_M_PORT%
    %T_A_M_PORT%
    %T_B_M_PORT%
    %T_D_M_PORT%
    %T_E_M_PORT%
    %V_R_M_PORT%
    %W_M_PORT%
) do (
    for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":%%P " ^| findstr "LISTENING"') do (
        echo   Stopping server on port %%P (PID: %%a)...
        taskkill /F /PID %%a >nul 2>&1
    )
)
echo Done.
