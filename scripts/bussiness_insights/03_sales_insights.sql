/*
===============================================================================
Sales Insights Analysis
===============================================================================
Purpose:
    - Identify trends and peak performance periods.
    - Understand overall sales performance over time.

Data Source:
    - dw_gold.report_sales_summary
===============================================================================
*/


-- ============================================================================
-- 1. Best performing months by revenue
-- ============================================================================
-- Business Question:
-- Which months generated the highest sales?

SELECT 
    order_month,
    total_sales
FROM dw_gold.report_sales_summary
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================================
-- 2. Lowest performing months
-- ============================================================================
-- Business Question:
-- Which months had the lowest sales?

SELECT 
    order_month,
    total_sales
FROM dw_gold.report_sales_summary
ORDER BY total_sales ASC
LIMIT 10;


-- ============================================================================
-- 3. Average order value over time
-- ============================================================================
-- Business Question:
-- How has the average order value changed over time?

SELECT 
    order_month,
    avg_order_value
FROM dw_gold.report_sales_summary
ORDER BY order_month;


-- ============================================================================
-- 4. Monthly sales growth
-- ============================================================================
-- Business Question:
-- How is revenue growing month-to-month?

SELECT 
    order_month,
    total_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY order_month) AS monthly_growth
FROM dw_gold.report_sales_summary
ORDER BY order_month;
