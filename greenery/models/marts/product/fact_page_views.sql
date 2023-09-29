{{
  config(
    materialized='table'
  )
}}

SELECT
    e.product_id,
    "page_views",
    "added_to_cart",
    "total_purchased",
    "number_of_orders"
        FROM 
            (select * from {{ ref('int_total_order_info') }}) e

INNER JOIN

            (select * from {{ ref('int_total_page_views') }}) i

on e.product_id = i.product_id
