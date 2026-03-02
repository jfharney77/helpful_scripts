import os
from fastapi import FastAPI
from ariadne import QueryType, make_executable_schema
from ariadne.asgi import GraphQL
from graphql_schema import TYPE_DEFS

HOST = os.environ.get("HOST", "0.0.0.0")
I_T_M_PORT = int(os.environ.get("I_T_M_PORT", 8001))

app = FastAPI()

query = QueryType()

@query.field("i_t_p_m_i")
def resolve_i_t_p_m_i(_, info, sT=None, aD=None, vD=None):
    return {
        "i_d": "dummy-id",
        "i_t_m_o": {
            "i_t": "dummy_i_t"
        }
    }

schema = make_executable_schema(TYPE_DEFS, query)

app.mount("/graphql", GraphQL(schema, debug=True))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host=HOST, port=I_T_M_PORT, reload=True)
