import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
O_I_M_PORT = os.environ.get("O_I_M_PORT", "8004")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{O_I_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_O_I_M_INFO = gql("""
    query GetOIMInfo($id: String) {
        o_i_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_o_i_m_info(id: str = None):
    result = client.execute(GET_O_I_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_o_i_m_info(id="test")
    print(response)
