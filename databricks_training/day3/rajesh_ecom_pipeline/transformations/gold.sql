create materialized view rajesh_gold.customer_active as 
select * from rajesh_silver.customers_cleaned where `__END_AT` is NULL;


create materialized view rajesh_gold.top_customers as
select
  s.customer_id,
  c.customer_name,
  c.customer_email,
  c.customer_city,
  sum(s.total_amount) as total_sales
from rajesh_silver.sales_cleaned_pl s
join rajesh_gold.customer_active c
  on s.customer_id = c.customer_id
group by all
order by total_sales desc
limit 3;