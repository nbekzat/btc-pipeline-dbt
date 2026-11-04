{% macro convert_to_usd(btc_amount)%}

{{ btc_amount }}  *
(select 
    CLOSE_PRICE_USD 

    from {{ ref("btc_price_dict") }}

    where event_date = to_date('2026-10-16 00:00:00')
)

{% endmacro %}