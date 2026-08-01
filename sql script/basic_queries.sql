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

ALTER TABLE sales RENAME COLUMN "Row ID" TO row_id;
ALTER TABLE sales RENAME COLUMN "Order ID" TO order_id;
ALTER TABLE sales RENAME COLUMN "Order Date" TO order_date;
ALTER TABLE sales RENAME COLUMN "Ship Date" TO ship_date;
ALTER TABLE sales RENAME COLUMN "Ship Mode" TO ship_mode;
ALTER TABLE sales RENAME COLUMN "Customer ID" TO customer_id;
ALTER TABLE sales RENAME COLUMN "Customer Name" TO customer_name;
ALTER TABLE sales RENAME COLUMN "Postal Code" TO postal_code;
ALTER TABLE sales RENAME COLUMN "Product ID" TO product_id;
ALTER TABLE sales RENAME COLUMN "Sub-Category" TO sub_category;
ALTER TABLE sales RENAME COLUMN "Product Name" TO product_name;
ALTER TABLE sales RENAME COLUMN "Category" TO category;
ALTER TABLE sales RENAME COLUMN "Region" TO region;
ALTER TABLE sales RENAME COLUMN "Segment" TO segment;
ALTER TABLE sales RENAME COLUMN "Country" TO country;
ALTER TABLE sales RENAME COLUMN "City" TO city;
ALTER TABLE sales RENAME COLUMN "State" TO state;
ALTER TABLE sales RENAME COLUMN "Sales" TO sales;
ALTER TABLE sales RENAME COLUMN "Quantity" TO quantity;
ALTER TABLE sales RENAME COLUMN "Discount" TO discount;
ALTER TABLE sales RENAME COLUMN "Profit" TO profit;
