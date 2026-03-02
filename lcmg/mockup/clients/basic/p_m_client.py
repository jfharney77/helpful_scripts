import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
P_M_PORT = os.environ.get("P_M_PORT", "8000")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{P_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_P_M_INFO = gql("""
    query GetPMInfo($s_t: String) {
        p_m_info(s_t: $s_t) {
            i_d
            p_m_o {
                p_t
                u_t
            }
        }
    }
""")


def get_p_m_info(s_t: str = None):
    result = client.execute(GET_P_M_INFO, variable_values={"s_t": s_t})
    return result


if __name__ == "__main__":
    response = get_p_m_info(s_t="test")
    print(response)
