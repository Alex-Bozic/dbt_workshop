{{
    config(
        materialized='table'
    )
}}

select
    id as payment_id,
    order_id,
    payment_method,
    {{ cents_to_dollars('amount') }} as amount
from {{ source('stg_sources', 'DBT_PAYMENTS') }}