with customers as (

    select
        customer_id,
        first_name,
        last_name
    from {{ ref('stg_customers') }}

)

select
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as dim_customer_id,
    customer_id,
    first_name,
    last_name,
from customers
