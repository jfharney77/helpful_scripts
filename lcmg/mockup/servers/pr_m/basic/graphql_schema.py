TYPE_DEFS = """
    type Query {
        pr_m_info(id: String): PRMItem
    }

    type PRMItem {
        i_d: String
        status: String
    }
"""
