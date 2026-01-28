{{
    config(
        materialized='table'
    )
}}

select
    id as payment_id,
    orderid,
    paymentmethod,
    {{ cents_to_dollars('amount') }} as amount
from {{ source('stg_sources', 'PAYMENT') }}