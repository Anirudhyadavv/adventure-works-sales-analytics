/*
===============================================================================
Sales Summary Report
===============================================================================
Purpose:
    - Consolidated time-based performance report.
    - Provides key business KPIs at a monthly level.

Highlights:
    - Monthly revenue performance
    - Order and quantity trends
    - Active customers and products
    - Key revenue metrics
===============================================================================
*/

-- =============================================================================
-- Create View: dw_gold.report_sales_summary
-- =============================================================================
DROP VIEW IF EXISTS dw_gold.report_sales_summary;

CREATE VIEW dw_gold.report_sales_summary AS

WITH sales_transactions AS (
/*---------------------------------------------------------------------------
1) Base Query: Retrieve clean sales transactions
---------------------------------------------------------------------------*/
SELECT
    order_number,
    order_date,
    customer_key,
    product_key,
    sales_amount,
    quantity
FROM dw_gold.fact_sales
WHERE order_date IS NOT NULL
),

monthly_sales AS (
/*---------------------------------------------------------------------------
2) Monthly Aggregation
---------------------------------------------------------------------------*/
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,

    COUNT(DISTINCT order_number) AS total_orders,
    COUNT(DISTINCT customer_key) AS active_customers,
    COUNT(DISTINCT product_key) AS active_products,

    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_quantity

FROM sales_transactions
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)

SELECT
    order_month,
    total_orders,
    active_customers,
    active_products,
    total_sales,
    total_quantity,

    -- Average Order Value
    CASE
        WHEN total_orders = 0 THEN 0
        ELSE total_sales / total_orders
    END AS avg_order_value,

    -- Average items per order
    CASE
        WHEN total_orders = 0 THEN 0
        ELSE total_quantity / total_orders
    END AS avg_items_per_order

FROM monthly_sales
ORDER BY order_month;
