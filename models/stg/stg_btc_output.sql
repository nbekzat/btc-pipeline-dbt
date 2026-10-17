{{ config(
    materialized='incremental',
    incremental_strategy='append', 
)}}

select
    st.HASH_KEY,
    st.BLOCK_TIMESTAMP,
    st.BLOCK_NUMBER,   
    st.IS_COINBASE,
    o.value:address::STRING as output_address,
    o.value:value::FLOAT as output_value

from {{ ref('stg_btc')}} st,

LATERAL FLATTEN(input => OUTPUTS) as o

where o.value:value is not null  and o.value:address is not null

{% if is_incremental() %}

and BLOCK_TIMESTAMP > (select max(BLOCK_TIMESTAMP) from {{ this }} )

{% endif %}