{% macro convert_to_usd(btc_amount)%}

{{ btc_amount }}  *
(select 
    CLOSE_PRICE_USD 

    from {{ ref("btc_usd_max") }}

    where to_date(replace(event_date, 'UTC', '')) = current_date() - 1
)

{% endmacro %}