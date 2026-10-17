select 
* 
from {{ source('btc_raw', 'btc_usd_max')}}