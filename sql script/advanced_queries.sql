-- Query 15: Monthly Sales Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Query 16: Top 5 States by Profit
SELECT
    state,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 5;

-- Query 17: Average Order Value by Segment
SELECT
    segment,
    ROUND(AVG(sales),2) AS avg_order_value
FROM sales
GROUP BY segment;

-- Query 18: Orders with Negative Profit
SELECT COUNT(*) AS loss_orders
FROM sales
WHERE profit < 0;

-- Query 19: Top 10 Most Sold Products
SELECT
    product_name,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 10;

--windows function and cte's

-- Query 20: Rank Customers by Sales
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS customer_rank
FROM sales
GROUP BY customer_name;

-- Query 21: Top Product in Each Category
WITH ranked_products AS (
    SELECT
        category,
        product_name,
        ROUND(SUM(sales),2) AS total_sales,
        RANK() OVER (
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS rnk
    FROM sales
    GROUP BY category, product_name
)
SELECT *
FROM ranked_products
WHERE rnk = 1;

-- Query 22: Running Total of Sales
SELECT
    order_date,
    sales,
    SUM(sales) OVER (
        ORDER BY order_date
    ) AS running_total
FROM sales;

-- Query 23: Monthly Profit
SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(profit),2) AS monthly_profit
FROM sales
GROUP BY month
ORDER BY month;

-- Query 24: Most Profitable Sub-Category
SELECT
    sub_category,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_profit DESC;