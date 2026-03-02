import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
O_M_PORT = os.environ.get("O_M_PORT", "8005")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{O_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_O_M_INFO = gql("""
    query GetOMInfo($id: String) {
        o_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_o_m_info(id: str = None):
    result = client.execute(GET_O_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_o_m_info(id="test")
    print(response)
