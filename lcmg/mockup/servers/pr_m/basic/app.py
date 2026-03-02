import os
from fastapi import FastAPI
from ariadne import QueryType, make_executable_schema
from ariadne.asgi import GraphQL
from graphql_schema import TYPE_DEFS

HOST = os.environ.get("HOST", "0.0.0.0")
PR_M_PORT = int(os.environ.get("PR_M_PORT", 8006))

app = FastAPI()

query = QueryType()

@query.field("pr_m_info")
def resolve_pr_m_info(_, info, id=None):
    return {"i_d": "dummy-id", "status": "ok"}

schema = make_executable_schema(TYPE_DEFS, query)

app.mount("/graphql", GraphQL(schema, debug=True))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app:app", host=HOST, port=PR_M_PORT, reload=True)
