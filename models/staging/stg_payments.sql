select
    id as payment_id,
    order_id,
    payment_method,
    amount / 100 AS amount
from {{ source('stg_sources', 'DBT_PAYMENTS') }}