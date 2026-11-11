SELECT * FROM sales LIMIT 1;

SELECT COUNT(*) AS total_orders FROM sales;

SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales;

SELECT DISTINCT category
FROM sales;

SELECT DISTINCT region
FROM sales;

SELECT
    region,
    ROUND(SUM(profit),2) AS profit
FROM sales
GROUP BY region
ORDER BY profit DESC;

SELECT
    region,
    ROUND(SUM(profit),2) AS profit
FROM sales
GROUP BY region
ORDER BY profit DESC;

SELECT
    segment,
    COUNT(*) AS orders
FROM sales
GROUP BY segment;

