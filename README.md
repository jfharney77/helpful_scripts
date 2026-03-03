# helpful_scripts

A collection of Windows batch and WSL bash scripts for managing and running project services.

---

## lcmg

### Configuration

Before running any scripts, review and update the config files with your paths and ports:

- **Bash:** `lcmg/bash/config.sh`
- **Batch:** `lcmg/batch/config.bat`

Key variables:

| Variable | Description |
|---|---|
| `PROJ_ROOT` | Root directory of this repository (resolved automatically) |
| `HOST` | Host address for all servers |
| `P_M_PORT` | Port for the p_m server (default: `8000`) |
| `I_T_M_PORT` | Port for the i_t_m server (default: `8001`) |
| `C_S_A_R_M_PORT` | Port for the c_s_a_r_m server (default: `8022`) |
| `I_A_R_M_PORT` | Port for the i_a_r_m server (default: `8003`) |
| `O_I_M_PORT` | Port for the o_i_m server (default: `8004`) |
| `O_M_PORT` | Port for the o_m server (default: `8005`) |
| `PR_M_PORT` | Port for the pr_m server (default: `8006`) |
| `T_A_M_PORT` | Port for the t_a_m server (default: `8007`) |
| `T_B_M_PORT` | Port for the t_b_m server (default: `8008`) |
| `T_D_M_PORT` | Port for the t_d_m server (default: `8009`) |
| `T_E_M_PORT` | Port for the t_e_m server (default: `8010`) |
| `V_R_M_PORT` | Port for the v_r_m server (default: `8011`) |
| `W_M_PORT` | Port for the w_m server (default: `8012`) |

---

### Run All Servers

Starts all servers as background processes in the same terminal window. Dependencies are installed once before launching.

**Bash:**
```bash
bash lcmg/bash/servers/run_all_servers_same_window.sh
```

**Batch:**
```bat
lcmg\batch\servers\run_all_servers_same_window.bat
```

> Bash: Press `Ctrl+C` to stop all servers. Batch: press any key to exit (servers continue running in background).

---

### Stop All Servers

Finds and kills any processes running on the configured ports.

**Bash:**
```bash
bash lcmg/bash/servers/stop_all_servers.sh
```

**Batch:**
```bat
lcmg\batch\servers\stop_all_servers.bat
```

---

### Individual Servers

Each server is a FastAPI/Ariadne GraphQL app. Scripts are in `lcmg/bash/servers/` and `lcmg/batch/servers/`. Clients are in `lcmg/bash/clients/` and `lcmg/batch/clients/`.

| Service | Port | Run (Bash) | Run (Batch) |
|---|---|---|---|
| p_m | 8000 | `bash lcmg/bash/servers/run_p_m_uv.sh` | `lcmg\batch\servers\run_p_m_uv.bat` |
| i_t_m | 8001 | `bash lcmg/bash/servers/run_i_t_m_uv.sh` | `lcmg\batch\servers\run_i_t_m_uv.bat` |
| c_s_a_r_m | 8022 | `bash lcmg/bash/servers/run_c_s_a_r_m_uv.sh` | `lcmg\batch\servers\run_c_s_a_r_m_uv.bat` |
| i_a_r_m | 8003 | `bash lcmg/bash/servers/run_i_a_r_m_uv.sh` | `lcmg\batch\servers\run_i_a_r_m_uv.bat` |
| o_i_m | 8004 | `bash lcmg/bash/servers/run_o_i_m_uv.sh` | `lcmg\batch\servers\run_o_i_m_uv.bat` |
| o_m | 8005 | `bash lcmg/bash/servers/run_o_m_uv.sh` | `lcmg\batch\servers\run_o_m_uv.bat` |
| pr_m | 8006 | `bash lcmg/bash/servers/run_pr_m_uv.sh` | `lcmg\batch\servers\run_pr_m_uv.bat` |
| t_a_m | 8007 | `bash lcmg/bash/servers/run_t_a_m_uv.sh` | `lcmg\batch\servers\run_t_a_m_uv.bat` |
| t_b_m | 8008 | `bash lcmg/bash/servers/run_t_b_m_uv.sh` | `lcmg\batch\servers\run_t_b_m_uv.bat` |
| t_d_m | 8009 | `bash lcmg/bash/servers/run_t_d_m_uv.sh` | `lcmg\batch\servers\run_t_d_m_uv.bat` |
| t_e_m | 8010 | `bash lcmg/bash/servers/run_t_e_m_uv.sh` | `lcmg\batch\servers\run_t_e_m_uv.bat` |
| v_r_m | 8011 | `bash lcmg/bash/servers/run_v_r_m_uv.sh` | `lcmg\batch\servers\run_v_r_m_uv.bat` |
| w_m | 8012 | `bash lcmg/bash/servers/run_w_m_uv.sh` | `lcmg\batch\servers\run_w_m_uv.bat` |

---

### Individual Clients

| Service | Run (Bash) | Run (Batch) |
|---|---|---|
| p_m | `bash lcmg/bash/clients/run_p_m_client.sh` | `lcmg\batch\clients\run_p_m_client.bat` |
| i_t_m | `bash lcmg/bash/clients/run_i_t_m_client.sh` | `lcmg\batch\clients\run_i_t_m_client.bat` |
| c_s_a_r_m | `bash lcmg/bash/clients/run_c_s_a_r_m_client.sh` | `lcmg\batch\clients\run_c_s_a_r_m_client.bat` |
| i_a_r_m | `bash lcmg/bash/clients/run_i_a_r_m_client.sh` | `lcmg\batch\clients\run_i_a_r_m_client.bat` |
| o_i_m | `bash lcmg/bash/clients/run_o_i_m_client.sh` | `lcmg\batch\clients\run_o_i_m_client.bat` |
| o_m | `bash lcmg/bash/clients/run_o_m_client.sh` | `lcmg\batch\clients\run_o_m_client.bat` |
| pr_m | `bash lcmg/bash/clients/run_pr_m_client.sh` | `lcmg\batch\clients\run_pr_m_client.bat` |
| t_a_m | `bash lcmg/bash/clients/run_t_a_m_client.sh` | `lcmg\batch\clients\run_t_a_m_client.bat` |
| t_b_m | `bash lcmg/bash/clients/run_t_b_m_client.sh` | `lcmg\batch\clients\run_t_b_m_client.bat` |
| t_d_m | `bash lcmg/bash/clients/run_t_d_m_client.sh` | `lcmg\batch\clients\run_t_d_m_client.bat` |
| t_e_m | `bash lcmg/bash/clients/run_t_e_m_client.sh` | `lcmg\batch\clients\run_t_e_m_client.bat` |
| v_r_m | `bash lcmg/bash/clients/run_v_r_m_client.sh` | `lcmg\batch\clients\run_v_r_m_client.bat` |
| w_m | `bash lcmg/bash/clients/run_w_m_client.sh` | `lcmg\batch\clients\run_w_m_client.bat` |

---

### Notes

- All scripts will automatically install `uv` if it is not already installed.
- Dependencies are installed from `pyproject.toml` at `PROJ_ROOT` on each run.
- The virtual environment is created at `PROJ_ROOT/.venv`.
