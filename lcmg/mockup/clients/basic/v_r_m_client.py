import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
V_R_M_PORT = os.environ.get("V_R_M_PORT", "8011")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{V_R_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_V_R_M_INFO = gql("""
    query GetVRMInfo($id: String) {
        v_r_m_info(id: $id) {
            i_d
            status
        }
    }
""")


def get_v_r_m_info(id: str = None):
    result = client.execute(GET_V_R_M_INFO, variable_values={"id": id})
    return result


if __name__ == "__main__":
    response = get_v_r_m_info(id="test")
    print(response)
