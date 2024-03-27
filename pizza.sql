--Calculate Total Revenue
SELECT sum(total_price) AS "Total Revenue" FROM pizza_sales;

--Calculate Average Order Value
SELECT sum(total_price)/count(DISTINCT order_id) AS "Average Order Value" FROM pizza_sales;

--Calculate Total PIzza Sold
SELECT sum(quantity) AS "Total Pizza Sold" FROM pizza_sales;

--Calculate Total Orders
SELECT count(DISTINCT order_id) AS "Total Orders" FROM pizza_sales;

--Calculate Average Pizza Per Order
SELECT sum(quantity)/count(DISTINCT order_id) AS "Average Pizza Per Order" FROM pizza_sales;

--Calculate Daily Trend For Orders
SELECT to_char(order_date,'Day') AS "Week Day",count(DISTINCT order_id) AS "Total Orders" FROM pizza_sales 
GROUP BY  to_char(order_date,'Day') ;
  
  --calculate Monthly Trend for orders
  SELECT to_char(order_date,'Month') AS "Month",count(DISTINCT order_id) AS "Total Orders" FROM pizza_sales 
GROUP BY  to_char(order_date,'Month') ;

--Calculate Percentage of Sales by Pizza Category
SELECT pizza_category, sum(total_price)*100/ (SELECT sum(total_price) FROM pizza_sales) AS "Percentage Sales By Category"
FROM pizza_sales 
GROUP BY pizza_category;

SELECT pizza_size, sum(total_price) AS "Total Sales", sum(total_price)*100/(SELECT sum(total_price) FROM pizza_sales AS "PCT")
FROM pizza_sales
GROUP BY pizza_size;

--Top 5 Pizza By Revenue
SELECT pizza_name, sum(total_price) AS "Total Price" FROM pizza_sales
GROUP BY pizza_name 
ORDER BY   sum(total_price) DESC
LIMIT 5;

--Bottom 5 Pizza By Revenue
SELECT pizza_name, sum(total_price) AS "Total Price" FROM pizza_sales
GROUP BY pizza_name 
ORDER BY   sum(total_price) 
LIMIT 5;

--Top 5 Pizza By Quantity
SELECT pizza_name, sum(quantity) AS "Total Quantity" FROM pizza_sales
GROUP BY pizza_name 
ORDER BY   sum(quantity) DESC
LIMIT 5;


--Bottom 5 Pizza By Quantity
SELECT pizza_name, sum(quantity) AS "Total Quantity" FROM pizza_sales
GROUP BY pizza_name 
ORDER BY   sum(quantity) 
LIMIT 5;