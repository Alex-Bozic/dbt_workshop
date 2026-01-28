with customers as (

    select * from {{ ref('stg_customers') }}

)

select
    MD5_NUMBER_UPPER64(customers.customer_id) as dim_customer_id
    customers.customer_id,
    customers.first_name,
    customers.last_name
from customers