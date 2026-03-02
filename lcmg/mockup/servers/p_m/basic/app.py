import os
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from ariadne import QueryType, make_executable_schema
from ariadne.asgi import GraphQL
from graphql_schema import TYPE_DEFS

HOST = os.environ.get("HOST", "0.0.0.0")
P_M_PORT = int(os.environ.get("P_M_PORT", 8000))

app = FastAPI()

query = QueryType()

@query.field("p_m_info")
def resolve_p_m_info(_, info, s_t=None):
    return {
        "i_d": "dummy-id",
        "p_m_o": [
            {"p_t": "dummy_p_t", "u_t": "dummy_u_t"}
        ]
    }

schema = make_executable_schema(TYPE_DEFS, query)

app.mount("/graphql", GraphQL(schema, debug=True))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host=HOST, port=P_M_PORT, reload=True)
