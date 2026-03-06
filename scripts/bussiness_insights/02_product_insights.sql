/*
===============================================================================
Product Insights Analysis
===============================================================================
Purpose:
    - Identify top-performing products and categories.
    - Understand revenue contribution across product segments.

Data Source:
    - dw_gold.report_products
===============================================================================
*/


-- ============================================================================
-- 1. Top products by revenue
-- ============================================================================
-- Business Question:
-- Which products generate the highest sales?

SELECT 
    product_name,
    category,
    total_sales
FROM dw_gold.report_products
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================================
-- 2. Most ordered products
-- ============================================================================
-- Business Question:
-- Which products are purchased most frequently?

SELECT 
    product_name,
    total_orders
FROM dw_gold.report_products
ORDER BY total_orders DESC
LIMIT 10;


-- ============================================================================
-- 3. Revenue contribution by product category
-- ============================================================================
-- Business Question:
-- Which categories generate the highest revenue?

SELECT 
    category,
    SUM(total_sales) AS total_sales
FROM dw_gold.report_products
GROUP BY category
ORDER BY total_sales DESC;


-- ============================================================================
-- 4. Product performance distribution
-- ============================================================================
-- Business Question:
-- How are products distributed across performance segments?

SELECT 
    product_segment,
    COUNT(*) AS total_products
FROM dw_gold.report_products
GROUP BY product_segment
ORDER BY total_products DESC;
