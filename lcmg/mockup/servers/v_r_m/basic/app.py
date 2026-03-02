import os
from fastapi import FastAPI
from ariadne import QueryType, make_executable_schema
from ariadne.asgi import GraphQL
from graphql_schema import TYPE_DEFS

HOST = os.environ.get("HOST", "0.0.0.0")
V_R_M_PORT = int(os.environ.get("V_R_M_PORT", 8011))

app = FastAPI()

query = QueryType()

@query.field("v_r_m_info")
def resolve_v_r_m_info(_, info, id=None):
    return {"i_d": "dummy-id", "status": "ok"}

schema = make_executable_schema(TYPE_DEFS, query)

app.mount("/graphql", GraphQL(schema, debug=True))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host=HOST, port=V_R_M_PORT, reload=True)
