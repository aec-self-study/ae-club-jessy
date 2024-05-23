with orders_agg as (
  select 
  customer_id
  ,min(orders.created_at) as first_order_at
  ,count(orders.id) as total_orders
from `analytics-engineers-club.coffee_shop.orders` as orders
group by customer_id
)
select 
  customers.id as customer_id
  ,customers.name
  ,customers.email
  ,orders_agg.*
from `analytics-engineers-club.coffee_shop.customers` as customers
left join orders_agg
on customers.id = orders_agg.customer_id
order by first_order_at
limit 5;
/*person A adding a comment to test merge*/