-- 00_setup/01_create_and_load_sales.sql
-- Creates the sales table used by every other script in this project.
-- Step 1: load the CSV as text into a staging table (keeps the dates in their original DD-MM-YYYY form).
-- Step 2: build the typed sales table with the snake_case column names the analysis uses.
-- Copy the included data/sales_data.csv to C:/retail_sales_raw/sales_data.csv first.
-- Update the COPY path if your PostgreSQL server uses a different accessible location.

DROP TABLE IF EXISTS sales_raw;
DROP TABLE IF EXISTS sales;

CREATE TABLE sales_raw (
    row_id          TEXT,
    order_id        TEXT,
    order_date      TEXT,
    ship_date       TEXT,
    ship_mode       TEXT,
    customer_id     TEXT,
    customer_name   TEXT,
    segment         TEXT,
    country         TEXT,
    city            TEXT,
    state           TEXT,
    postal_code     TEXT,
    region          TEXT,
    product_id      TEXT,
    category        TEXT,
    sub_category    TEXT,
    product_name    TEXT,
    sales           TEXT,
    quantity        TEXT,
    discount        TEXT,
    profit          TEXT
);

COPY sales_raw FROM 'C:/retail_sales_raw/sales_data.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

CREATE TABLE sales AS
SELECT
    row_id::INTEGER                          AS row_id,
    order_id,
    TO_DATE(order_date, 'DD-MM-YYYY')        AS order_date,
    TO_DATE(ship_date,  'DD-MM-YYYY')        AS ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales::NUMERIC(12,2)                     AS sales,
    quantity::INTEGER                        AS quantity,
    discount::NUMERIC(5,2)                   AS discount,
    profit::NUMERIC(12,4)                    AS profit
FROM sales_raw;

ALTER TABLE sales ADD PRIMARY KEY (row_id);

DROP TABLE sales_raw;

-- Quick check: expect 9,994 rows
SELECT COUNT(*) AS total_rows FROM sales;
