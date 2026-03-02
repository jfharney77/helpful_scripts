@echo off
:: lcmg configuration

set PROJ_ROOT=\\wsl.localhost\Ubuntu\home\john\github\helpful_scripts

set HOST=0.0.0.0
set P_M_PORT=8000
set P_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\p_m\basic\app.py
set P_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\p_m_client.py
set I_T_M_PORT=8001
set I_T_M_SERVER_PATH=%PROJ_ROOT%\lcmg\mockup\servers\i_t_m\basic\app.py
set I_T_M_CLIENT_PATH=%PROJ_ROOT%\lcmg\mockup\clients\basic\i_t_m_client.py
