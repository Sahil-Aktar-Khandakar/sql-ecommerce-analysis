-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Monthly sales trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(payment_value) AS total_sales
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
GROUP BY year, month
ORDER BY year, month;

-- Top 10 cities by number of orders
SELECT 
    customer_city,
    COUNT(order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_city
ORDER BY total_orders DESC
LIMIT 10;
