--Query 9 – Top 10 Products by Sales
SELECT
    product_name,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

--Query 10 – Top 10 Customers
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

--Query 11 – Sales by Region
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

--Query 12 – Profit by Category
SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

--Query 13 – Average Discount by Segment
SELECT
    segment,
    ROUND(AVG(discount),2) AS avg_discount
FROM sales
GROUP BY segment;

--Query 14 – Top 10 Loss-Making Products
SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit
LIMIT 10;

