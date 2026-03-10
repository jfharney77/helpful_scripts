from mcp.server.fastmcp import FastMCP
from fastapi import FastAPI
import uvicorn

# ── MCP server ────────────────────────────────────────────────────────────────
mcp = FastMCP("scorer")

@mcp.tool()
def add(a: float, b: float) -> float:
    """Add two numbers and return the result."""
    return a + b

# ── FastAPI app with MCP mounted at /scorerMCP ────────────────────────────────
app = FastAPI()
app.mount("/scorerMCP", mcp.streamable_http_app())

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8005)
