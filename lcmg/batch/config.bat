@echo off
:: lcmg configuration

:: set PROJ_ROOT=\\wsl.localhost\Ubuntu\home\john\github\helpful_scripts
for %%i in ("%~dp0..\..") do set PROJ_ROOT=%%~fi

set HOST=0.0.0.0

:: --- Ports ---
set P_M_PORT=8000
set I_T_M_PORT=8001
set C_S_A_R_M_PORT=8002
set I_A_R_M_PORT=8003
set O_I_M_PORT=8004
set O_M_PORT=8005
set PR_M_PORT=8006
set T_A_M_PORT=8007
set T_B_M_PORT=8008
set T_D_M_PORT=8009
set T_E_M_PORT=8010
set V_R_M_PORT=8011
set W_M_PORT=8012

:: --- Server Paths ---
set P_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\p_m\basic\app.py
set I_T_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\i_t_m\basic\app.py
set C_S_A_R_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\c_s_a_r_m\basic\app.py
set I_A_R_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\i_a_r_m\basic\app.py
set O_I_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\o_i_m\basic\app.py
set O_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\o_m\basic\app.py
set PR_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\pr_m\basic\app.py
set T_A_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\t_a_m\basic\app.py
set T_B_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\t_b_m\basic\app.py
set T_D_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\t_d_m\basic\app.py
set T_E_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\t_e_m\basic\app.py
set V_R_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\v_r_m\basic\app.py
set W_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\w_m\basic\app.py

:: --- Client Paths ---
set P_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\p_m_client.py
set I_T_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\i_t_m_client.py
set C_S_A_R_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\c_s_a_r_m_client.py
set I_A_R_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\i_a_r_m_client.py
set O_I_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\o_i_m_client.py
set O_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\o_m_client.py
set PR_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\pr_m_client.py
set T_A_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\t_a_m_client.py
set T_B_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\t_b_m_client.py
set T_D_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\t_d_m_client.py
set T_E_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\t_e_m_client.py
set V_R_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\v_r_m_client.py
set W_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\w_m_client.py
