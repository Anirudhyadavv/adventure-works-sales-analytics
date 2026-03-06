/*
===============================================================================
Customer Insights Analysis
===============================================================================
Purpose:
    - Identify customer purchasing behavior and retention patterns.
    - Understand how customers contribute to revenue.
    - Detect high-value customer segments.

Data Source:
    - dw_gold.report_customers
===============================================================================
*/


-- ============================================================================
-- 1. Distribution of customers by number of orders
-- ============================================================================
-- Business Question:
-- How many customers purchase only once vs multiple times?

SELECT 
    total_orders,
    COUNT(*) AS total_customers
FROM dw_gold.report_customers
GROUP BY total_orders
ORDER BY total_orders;


-- ============================================================================
-- 2. Customer segmentation by purchasing behavior
-- ============================================================================
-- Business Question:
-- How can customers be categorized based on purchasing frequency?

SELECT 
    CASE 
        WHEN total_orders = 1 THEN 'One-time Buyer'
        WHEN total_orders BETWEEN 2 AND 3 THEN 'Occasional Buyer'
        WHEN total_orders BETWEEN 4 AND 10 THEN 'Loyal Customer'
        ELSE 'Power Buyer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM dw_gold.report_customers
GROUP BY customer_type
ORDER BY total_customers DESC;


-- ============================================================================
-- 3. Top customers by total spending
-- ============================================================================
-- Business Question:
-- Who are the highest revenue-generating customers?

SELECT 
    customer_key,
    customer_name,
    total_orders,
    total_sales
FROM dw_gold.report_customers
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================================
-- 4. Revenue contribution by customer segment
-- ============================================================================
-- Business Question:
-- Which customer segments generate the most revenue?

SELECT 
    customer_segment,
    COUNT(*) AS customers,
    SUM(total_sales) AS total_revenue
FROM dw_gold.report_customers
GROUP BY customer_segment
ORDER BY total_revenue DESC;
