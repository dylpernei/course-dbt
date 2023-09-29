SELECT product_id,
                    sum(quantity) as "total_purchased",
                    count(*) as "number_of_orders"
            FROM {{ source('postgres', 'order_items') }}
            group by 1