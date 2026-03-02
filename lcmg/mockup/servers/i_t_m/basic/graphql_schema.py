TYPE_DEFS = """
    input ITD {
        issue : String
        score : String
    }

    input ADD {
        aId : String
        iT : [ ITD ]
        updDT: String
        vD : String
    }

    input VDD {
        vId : String
        iT: [ ITD ]
        updDT : String
        vD : String
    }

    type Query {
        i_t_p_m_i (
            sT: String
            aD : [ ADD ]
            vD : [ VDD ]
        ): ITPMI
    }

    type ITPMI {
        i_d : String
        i_t_m_o : ITPD
    }

    type ITPD {
        i_t : String
    }
"""
