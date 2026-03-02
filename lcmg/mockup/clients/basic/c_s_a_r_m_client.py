import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
C_S_A_R_M_PORT = os.environ.get("C_S_A_R_M_PORT", "8002")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{C_S_A_R_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_C_S_A_R_M_INFO = gql("""
    query GetCSARMInfo($id: String) {
        c_s_a_r_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_c_s_a_r_m_info(id: str = None):
    result = client.execute(GET_C_S_A_R_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_c_s_a_r_m_info(id="test")
    print(response)
