--Case Study 1: Executive Sales Summary
--How is the business performing overall?

SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(AVG(sales),2) AS avg_order_value,
    ROUND(AVG(discount),2) AS avg_discount
FROM sales;

-- Insight:
-- Total Sales: $2,297,200.86
-- Total Profit: $286,397.03
-- Average Order Value: $229.86
-- Business is overall profitable.
-- ==========================================


-- CASE STUDY 2: REGIONAL PERFORMANCE ANALYSIS
-- Which region performs best in terms of sales and profit?

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

-- Insight:
-- West is the most profitable region.
-- Central is the least profitable region.
-- Recommendation:
-- Maintain growth strategies in the West region.
-- Investigate pricing, discounts, and product mix in the Central region
-- to improve profitability.
-- ==========================================


-- CASE STUDY 3: CATEGORY PERFORMANCE ANALYSIS
-- Which product category contributes the most to sales and profit?

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- Insight:
-- Technology generated the highest sales ($836,154.03)
-- and the highest profit ($145,454.95).
-- Furniture generated high sales ($741,999.80)
-- but the lowest profit ($18,451.27).
-- Office Supplies delivered balanced sales ($719,047.03)
-- with strong profitability ($122,490.80).

-- Recommendation:
-- Continue investing in Technology products.
-- Review Furniture pricing, discounts, and costs to improve margins.
-- Maintain Office Supplies as a stable profit contributor.
-- ==========================================


-- CASE STUDY 4: CUSTOMER VALUE ANALYSIS
-- Who are the top 10 customers by total sales?

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Insight:
-- Sean Miller is the highest-value customer with total sales of $25,043.05.
-- Several top customers generated both high sales and strong profits.
-- However, Sean Miller recorded a loss of $1,980.74 despite the highest sales,
-- indicating that high revenue does not always translate into profitability.

-- Recommendation:
-- Retain high-value customers through loyalty programs.
-- Investigate unprofitable high-value customers by reviewing discounts,
-- returned orders, or product mix.
-- ==========================================


-- CASE STUDY 5: LOSS-MAKING PRODUCTS
-- Which products generate the highest losses?

SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_loss
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_loss
LIMIT 10;

-- Insight:
-- Several products consistently generate significant losses.
-- The Cubify CubeX 3D Printer models recorded the highest losses,
-- followed by conference tables and premium office equipment.

-- Recommendation:
-- Review pricing strategy and discount policies for these products.
-- Evaluate supplier costs and discontinue products with consistently
-- negative profitability if corrective actions are ineffective.
-- ==========================================



-- CASE STUDY 6: DISCOUNT IMPACT ANALYSIS
-- Does increasing discount reduce profitability?

SELECT
    discount,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;

-- Insight:
-- Orders with no discount generated the highest sales ($1,087,908.47)
-- and the highest profit ($320,987.60).
-- Profitability declines as discount levels increase.
-- Discounts of 30% and above consistently resulted in losses.

-- Recommendation:
-- Avoid offering discounts above 30% unless strategically necessary.
-- Optimize promotional campaigns by balancing customer acquisition
-- with profitability.
-- ==========================================



-- CASE STUDY 7: MONTHLY SALES TREND
-- How do sales change over time?

SELECT
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Insight:
-- Monthly sales show seasonal fluctuations throughout the year.
-- Peak sales occurred in November, indicating strong holiday demand.
-- Sales typically increase toward the year-end.

-- Recommendation:
-- Increase inventory and marketing efforts before the holiday season.
-- Plan promotional campaigns around peak demand months.
-- ==========================================



-- CASE STUDY 8: SHIPPING MODE ANALYSIS
-- Which shipping mode generates the highest sales and profit?

SELECT
    ship_mode,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY ship_mode
ORDER BY total_profit DESC;

-- Insight:
-- Standard Class handled the highest number of orders (5,968),
-- generated the highest sales ($1,358,215.74),
-- and delivered the highest profit ($164,088.79).
-- Same Day shipping had the lowest order volume and profitability.

-- Recommendation:
-- Continue optimizing Standard Class as the primary shipping option.
-- Review pricing and operational costs of Same Day delivery to
-- improve profitability.
-- ==========================================



-- CASE STUDY 9: STATE PERFORMANCE ANALYSIS
-- Which states generate the highest profit?

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- Insight:
-- California generated the highest sales ($457,687.63)
-- and the highest profit ($76,381.39).
-- New York ranked second in both sales and profitability.
-- The top-performing states contribute a significant share of overall profit.

-- Recommendation:
-- Continue expanding business in high-performing states such as
-- California, New York, and Washington.
-- Analyze successful strategies in these markets and replicate
-- them in lower-performing states where feasible.
-- ==========================================



-- CASE STUDY 10: EXECUTIVE RECOMMENDATIONS

-- Key Recommendations:
-- 1. Increase investment in the Technology category as it delivers the highest sales and profit.
-- 2. Improve profitability of the Furniture category by reviewing pricing, costs, and discount strategy.
-- 3. Prioritize growth initiatives in the West region while addressing underperformance in the Central region.
-- 4. Limit discounts above 30%, as higher discounts consistently reduce profitability.
-- 5. Focus customer retention efforts on high-value customers and investigate customers with high sales but low or negative profit.
-- 6. Expand and optimize Standard Class shipping, which generates the highest sales and profit.
-- 7. Prepare inventory and marketing campaigns ahead of November to capitalize on peak seasonal demand.