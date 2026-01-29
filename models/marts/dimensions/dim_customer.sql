with customers as (

    select * from {{ ref('stg_customers') }}

)

select
    customer_id,
    MD5_NUMBER_UPPER64(customer_id) as customer_sid,
    first_name,
    last_name,
from customers