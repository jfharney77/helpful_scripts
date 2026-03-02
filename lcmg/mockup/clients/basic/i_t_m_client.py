import os
from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST = os.environ.get("HOST", "0.0.0.0")
I_T_M_PORT = os.environ.get("I_T_M_PORT", "8001")

transport = RequestsHTTPTransport(
    url=f"http://{HOST}:{I_T_M_PORT}/graphql",
    verify=True,
    retries=3,
)

client = Client(transport=transport, fetch_schema_from_transport=True)

GET_I_T_P_M_I = gql("""
    query GetITPMI($sT: String, $aD: [ADD], $vD: [VDD]) {
        i_t_p_m_i(sT: $sT, aD: $aD, vD: $vD) {
            i_d
            i_t_m_o {
                i_t
            }
        }
    }
""")


def get_i_t_p_m_i(sT: str = None, aD: list = None, vD: list = None):
    result = client.execute(GET_I_T_P_M_I, variable_values={"sT": sT, "aD": aD, "vD": vD})
    return result


if __name__ == "__main__":
    response = get_i_t_p_m_i(sT="test")
    print(response)
