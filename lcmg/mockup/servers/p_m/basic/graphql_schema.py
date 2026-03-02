TYPE_DEFS = """
    type Query {
        p_m_info(s_t: String) : PMItem
    }

    type POI {
        p_t : String
        u_t : String
    }

    type PMItem {
        p_m_o: [POI]
        i_d: String
    }
"""
