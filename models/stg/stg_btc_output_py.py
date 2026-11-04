import logging

logger = logging.getLogger("btc_debug")

def model(dbt, session):
    # dbt.config(
    #     materialized="table",
    #     # packages=[
    #     #     "pandas",
    #     #     "snowflake-snowpark-python",
    #     #     "snowflake-connector-python[pandas]"
    #     # ]
    # )

    df = dbt.ref("stg_btc") 
    logger.warning(f"Columns: {df.columns}")
    logger.warning(f"Total rows: {df.count()}")
    
    # raise Exception(df.order_by("BLOCK_TIMESTAMP", ascending=False).limit(10))
    return  df.limit(10)



