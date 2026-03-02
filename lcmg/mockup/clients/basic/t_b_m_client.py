import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
T_B_M_PORT = os.environ.get("T_B_M_PORT", "8008")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{T_B_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_T_B_M_INFO = gql("""
    query GetTBMInfo($id: String) {
        t_b_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_t_b_m_info(id: str = None):
    result = client.execute(GET_T_B_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_t_b_m_info(id="test")
    print(response)
