import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
T_E_M_PORT = os.environ.get("T_E_M_PORT", "8010")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{T_E_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_T_E_M_INFO = gql("""
    query GetTEMInfo($id: String) {
        t_e_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_t_e_m_info(id: str = None):
    result = client.execute(GET_T_E_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_t_e_m_info(id="test")
    print(response)
