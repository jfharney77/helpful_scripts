#!/bin/bash
source "$(dirname "$0")/../config.sh"

PORTS=(
    $P_M_PORT
    $I_T_M_PORT
    $C_S_A_R_M_PORT
    $I_A_R_M_PORT
    $O_I_M_PORT
    $O_M_PORT
    $PR_M_PORT
    $T_A_M_PORT
    $T_B_M_PORT
    $T_D_M_PORT
    $T_E_M_PORT
    $V_R_M_PORT
    $W_M_PORT
)

echo "Stopping all servers..."
for PORT in "${PORTS[@]}"; do
    PIDS=$(lsof -ti:$PORT)
    if [ -n "$PIDS" ]; then
        echo "  Stopping server on port $PORT (PID: $PIDS)..."
        kill $PIDS
    else
        echo "  No server running on port $PORT"
    fi
done
echo "Done."
