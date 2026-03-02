import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
I_A_R_M_PORT = os.environ.get("I_A_R_M_PORT", "8003")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{I_A_R_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_I_A_R_M_INFO = gql("""
    query GetIARMInfo($id: String) {
        i_a_r_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_i_a_r_m_info(id: str = None):
    result = client.execute(GET_I_A_R_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_i_a_r_m_info(id="test")
    print(response)
