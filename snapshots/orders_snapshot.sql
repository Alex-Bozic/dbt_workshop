{% snapshot orders_snapshot %}

{{
    config(
      target_database='DBT_DEMO',
      target_schema='SNAPSHOTS',
      unique_key='id',

      strategy='timestamp',
      updated_at='order_date',
    )
}}

select * from {{ source('stg_sources', 'ORDERS') }}

{% endsnapshot %}