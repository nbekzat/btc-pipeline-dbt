select 
to_date(replace(event_date, 'UTC', '')) as event_date,
close_price_usd,
market_cap_usd,
volume_usd
from {{ source('btc', 'btc_usd_max')}}
