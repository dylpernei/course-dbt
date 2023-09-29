select product_id,
                    sum(case when event_type = 'page_view' then 1 else 0 end) as "page_views",
                    sum(case when event_type = 'add_to_cart' then 1 else 0 end) as "added_to_cart"
            FROM {{ ref('stg_postgres__events') }}
            group by 1