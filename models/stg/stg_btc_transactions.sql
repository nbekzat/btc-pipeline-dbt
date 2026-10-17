{{ config(
    materialized='ephemeral',
)}}

select *
from {{ ref("stg_btc_output")}}
where IS_COINBASE = FALSE
