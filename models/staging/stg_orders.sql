select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{ source('stg_sources', 'ORDERS') }}
{{ limit_data_in_dev('order_date') }}
