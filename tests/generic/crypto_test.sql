{% test assert_less_than_zero(model, column_name) %}
    select *
    from {{ model }}
    where {{ column_name }} < 0

{% endtest %}


{% test assert_not_valid_btc_address(model, column_name) %}

    select *
    from {{ model }}

    where NOT(
        
        {{ column_name }} like '0x%' or
        {{ column_name }} like '1%' or
        {{ column_name }} like '3%' or
        {{ column_name }} like 'bc1%'
    )


{% endtest %}