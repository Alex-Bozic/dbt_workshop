with customers as (

    select
        customer_id,
        first_name,
        last_name
    from {{ ref('stg_customers') }}

)

select
    MD5_NUMBER_UPPER64(customer_id) as dim_customer_id
    customer_id,
    first_name,
    last_name,
from customers
