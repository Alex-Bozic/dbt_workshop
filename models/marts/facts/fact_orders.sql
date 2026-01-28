{{
  config(
    unique_key='order_id',
    incremental_strategy='merge')
}}


with orders as (

    select * from {{ ref('stg_orders') }}

),

customers as (

    select * from {{ ref('dim_customer') }}

),
order_payments as (

    
    select * from {{ ref('int_order_payments') }}

),

final as (

    select
        orders.order_id,
        customers.dim_customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount
    from orders
    left join order_payments using (order_id)
    left join customers using (customer_id)

)

select * from final
{% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
  {% endif %}
