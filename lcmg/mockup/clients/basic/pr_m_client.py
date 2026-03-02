import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
PR_M_PORT = os.environ.get("PR_M_PORT", "8006")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{PR_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_PR_M_INFO = gql("""
    query GetPRMInfo($id: String) {
        pr_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_pr_m_info(id: str = None):
    result = client.execute(GET_PR_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_pr_m_info(id="test")
    print(response)
