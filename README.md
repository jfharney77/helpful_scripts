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
| `PROJ_ROOT` | Root directory of this repository |
| `HOST` | Host address for all servers |
| `P_M_PORT` | Port for the p_m server (default: `8000`) |
| `I_T_M_PORT` | Port for the i_t_m server (default: `8001`) |

---

### p_m Server

A FastAPI/Ariadne GraphQL server. GraphQL endpoint: `http://<HOST>:<P_M_PORT>/graphql`

**Run (Bash):**
```bash
bash lcmg/bash/run_p_m_uv.sh
```

**Run (Batch):**
```bat
lcmg\batch\run_p_m_uv.bat
```

**Run the client (Bash):**
```bash
bash lcmg/bash/run_p_m_client.sh
```

**Run the client (Batch):**
```bat
lcmg\batch\run_p_m_client.bat
```

---

### i_t_m Server

A FastAPI/Ariadne GraphQL server. GraphQL endpoint: `http://<HOST>:<I_T_M_PORT>/graphql`

**Run (Bash):**
```bash
bash lcmg/bash/run_i_t_m_uv.sh
```

**Run (Batch):**
```bat
lcmg\batch\run_i_t_m_uv.bat
```

**Run the client (Bash):**
```bash
bash lcmg/bash/run_i_t_m_client.sh
```

**Run the client (Batch):**
```bat
lcmg\batch\run_i_t_m_client.bat
```

---

### Notes

- All scripts will automatically install `uv` if it is not already installed.
- Dependencies are installed from `pyproject.toml` at `PROJ_ROOT` on each run.
- The virtual environment is created at `PROJ_ROOT/.venv`.