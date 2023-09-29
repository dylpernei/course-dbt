{{
  config(
    materialized='table'
  )
}}


SELECT o.order_cost,
       o.promo_id,
       o.address_id,
       o.created_at as "order_created_at",
       o.shipping_cost,
       o.order_total,
       o.tracking_id,
       o.shipping_service,
       o.estimated_delivery_at,
       o.delivered_at,
       datediff("minute",o.created_at, o.delivered_at) as "time_to_delivery_mins",
       u.first_name,
       u.last_name,
       concat(u.first_name, ' ', u.last_name) as "full_name",
       u.email,
       u.phone_number,
       u.created_at as "user_created_at"
FROM {{ ref('stg_postgres__orders') }} o
LEFT JOIN {{ ref('stg_postgres__users') }} u
on o.user_id = u.user_id
