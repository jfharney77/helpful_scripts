#!/bin/bash
# lcmg configuration

# PROJ_ROOT="/home/john/github/helpful_scripts"
PROJ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

HOST="0.0.0.0"

# --- Ports ---
P_M_PORT=8000
I_T_M_PORT=8001
C_S_A_R_M_PORT=8022
I_A_R_M_PORT=8003
O_I_M_PORT=8004
O_M_PORT=8005
PR_M_PORT=8006
T_A_M_PORT=8007
T_B_M_PORT=8008
T_D_M_PORT=8009
T_E_M_PORT=8010
V_R_M_PORT=8011
W_M_PORT=8012

# --- Server Paths ---
P_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/p_m/basic/app.py"
I_T_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/i_t_m/basic/app.py"
C_S_A_R_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/c_s_a_r_m/basic/app.py"
I_A_R_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/i_a_r_m/basic/app.py"
O_I_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/o_i_m/basic/app.py"
O_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/o_m/basic/app.py"
PR_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/pr_m/basic/app.py"
T_A_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/t_a_m/basic/app.py"
T_B_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/t_b_m/basic/app.py"
T_D_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/t_d_m/basic/app.py"
T_E_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/t_e_m/basic/app.py"
V_R_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/v_r_m/basic/app.py"
W_M_SERVER_PATH="$PROJ_ROOT/lcmg/mockup/servers/w_m/basic/app.py"

# --- Client Paths ---
P_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/p_m_client.py"
I_T_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/i_t_m_client.py"
C_S_A_R_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/c_s_a_r_m_client.py"
I_A_R_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/i_a_r_m_client.py"
O_I_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/o_i_m_client.py"
O_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/o_m_client.py"
PR_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/pr_m_client.py"
T_A_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/t_a_m_client.py"
T_B_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/t_b_m_client.py"
T_D_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/t_d_m_client.py"
T_E_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/t_e_m_client.py"
V_R_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/v_r_m_client.py"
W_M_CLIENT_PATH="$PROJ_ROOT/lcmg/mockup/clients/basic/w_m_client.py"
