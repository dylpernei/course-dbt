# Week 1:
How many users do we have?
130

## On average, how many orders do we receive per hour?
7.680851

## On average, how long does an order take from being placed to being delivered?
5,604.196721 minutes

## How many users have only made one purchase? Two purchases? Three+ purchases?
One purchase: 25
Two purchase: 28
Three+ purchases: 71

## On average, how many unique sessions do we have per hour?
10.140351 unique sessions per hour

# Week 2:
## question 1: What is our user repeat rate?
``` 
SELECT sum(case when "num_orders" > 1 then 1 else 0 end) * 100 / count(*) FROM
        (SELECT 
        USER_ID,
        count(*) as "num_orders"
        FROM DEV_DB.DBT_DPEREZNEIDERGMAILCOM.STG_POSTGRES__ORDERS
        group by 1)
```

## question 2: What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

shipping cost and orders

```
SELECT case when "num_orders" > 1 then 1 
            when "num_orders" = 1 then 0
            else null end as "num_orders_group",
            avg("average_order_cost"),
            avg("average_shipping_cost"),
            avg("average_order_total")
        FROM
        (SELECT 
        USER_ID,
        avg(order_cost) as "average_order_cost",
        avg(shipping_cost) as "average_shipping_cost",
        avg(order_total) as "average_order_total",
        count(*) as "num_orders"
        FROM DEV_DB.DBT_DPEREZNEIDERGMAILCOM.STG_POSTGRES__ORDERS
        group by 1)
        group by 1
```