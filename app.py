"""
# My first app
Here's our first attempt at using data to create a table:
"""

import streamlit as st
import pandas as pd
# import numpy as np
# from collections import Counter

# from datetime import datetime

import psycopg2
from psycopg2.extras import execute_values


st.write("Finally got a databse connection!!")

def click_view_button():
    st.session_state.view_preds = not st.session_state.view_preds

with st.sidebar:
    st.write('Click to view database table.')

    if 'view_preds' not in st.session_state:
        st.session_state.view_preds = False

    st.button('View Preds', on_click=click_view_button)


if st.session_state.view_preds:
    ### DATABASE CONNECTION
    USER = 'postgres.viwputoyddcvgcvvkfzb'
    PW = 'FADSsummer2024!'
    HOST = 'aws-0-us-east-1.pooler.supabase.com'
    PORT = 6543
    DB = 'postgres'
    
    conn = psycopg2.connect(dbname=DB, user=USER, password=PW, host=HOST, port=PORT)
    curs = conn.cursor()
    curs.execute('SELECT * FROM mytable')
    test_df = pd.DataFrame(curs.fetchall(), columns=['name', 'pet', 'is_cool'])
    curs.close()
    conn.close()

    
    # Initialize session state with dataframes
    # Include initialization of "edited" slots by copying originals
    if 'df1' not in st.session_state:
        st.session_state.df1 = test_df

        st.session_state.edited_df1 = st.session_state.df1.copy()

    # Convenient shorthand notation
    df1 = st.session_state.df1

    # Page functions commit edits in real time to "editied" slots in session state
    def df_updates():
        st.session_state.edited_df1 = st.data_editor(
            df1,
            column_config = {
                'is_cool': st.column_config.CheckboxColumn(
                    'is_cool',
                    help="Select row to reclassify",
                    default=False,
                )
            },
            hide_index=True,
        )
        return st.session_state.edited_df1
    
    df_update_preds = df_updates()

    if 'btn_update_preds' not in st.session_state:
            st.session_state.btn_update_preds = False

    def click_update_button():
        st.session_state.btn_update_preds = not st.session_state.btn_update_preds

    st.button('Update data', on_click=click_update_button)

    if st.session_state.btn_update_preds:
        # The message and nested widget will remain on the page
        # st.write('Button is on!')

        conn = psycopg2.connect(dbname=DB, user=USER, password=PW, host=HOST, port=PORT)
        conn.autocommit = True
        
        sql = """
            UPDATE mytable m
            SET 
                is_cool = CAST(t.is_cool AS BOOLEAN)
            FROM (values %s) AS t(name, pet, is_cool)
            WHERE m.name = t.name;
        """
        rows_to_update = list(df_update_preds.itertuples(index=False, name=None))

        curs = conn.cursor()
        execute_values(curs, sql, rows_to_update)
        curs.close()
        
        conn.commit()
        conn.close()
        
        st.success('Record added Successfully')
        
    else:
        st.write('Button is off!')

