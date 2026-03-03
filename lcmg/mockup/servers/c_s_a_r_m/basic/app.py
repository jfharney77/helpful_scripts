import os
from fastapi import FastAPI
from ariadne import QueryType, make_executable_schema
from ariadne.asgi import GraphQL
from graphql_schema import TYPE_DEFS

HOST = os.environ.get("HOST", "0.0.0.0")
C_S_A_R_M_PORT = int(os.environ.get("C_S_A_R_M_PORT", 8002))

app = FastAPI()

query = QueryType()

@query.field("c_s_a_r_m_info")
def resolve_c_s_a_r_m_info(_, info, id=None):
    print("[c_s_a_r_m] c_s_a_r_m_info called")
    return {"i_d": "dummy-id", "status": "ok"}

schema = make_executable_schema(TYPE_DEFS, query)

app.mount("/graphql", GraphQL(schema, debug=True))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host=HOST, port=C_S_A_R_M_PORT, reload=True)
