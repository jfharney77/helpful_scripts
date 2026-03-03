import os
from fastapi import FastAPI
from ariadne import QueryType, make_executable_schema
from ariadne.asgi import GraphQL
from graphql_schema import TYPE_DEFS

HOST = os.environ.get("HOST", "0.0.0.0")
T_B_M_PORT = int(os.environ.get("T_B_M_PORT", 8008))

app = FastAPI()

query = QueryType()

@query.field("t_b_m_info")
def resolve_t_b_m_info(_, info, id=None):
    print("[t_b_m] t_b_m_info called")
    return {"i_d": "dummy-id", "status": "ok"}

schema = make_executable_schema(TYPE_DEFS, query)

app.mount("/graphql", GraphQL(schema, debug=True))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host=HOST, port=T_B_M_PORT, reload=True)
