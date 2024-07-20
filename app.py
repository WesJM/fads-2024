"""
# My first app
Here's our first attempt at using data to create a table:
"""

import streamlit as st
import pandas as pd
import numpy as np
from collections import Counter

from datetime import datetime
import psycopg2


st.write("Finally!! Hello World.")

def click_view_button():
    st.session_state.view_preds = not st.session_state.view_preds

with st.sidebar:
    st.write('Click to view database table.')

    if 'view_preds' not in st.session_state:
        st.session_state.view_preds = False

    st.button('View Preds', on_click=click_view_button)


if st.session_state.view_preds:
    ### DATABASE CONNECTION
    DB = 'compliance_db'
    USER = 'postgres'
    PW = 'admin'
    HOST = 'localhost'
    PORT = 5432

    conn = psycopg2.connect(dbname=DB, user=USER, password=PW, host=HOST, port=PORT)
    curs = conn.cursor()
    curs.execute('SELECT * FROM mytable')
    test_df = pd.DataFrame(curs.fetchall(), columns=['name', 'pet', 'is_cool'])
    curs.close()
    conn.close()
