WITH product_sales AS (
SELECT
    product_id,
    SUM(quantity) AS units_sold,
    SUM(item_total_ngn) AS sales_value_ngn,
    COUNT(DISTINCT order_id) AS number_of_orders
FROM {{ ref('int_order_items_enriched') }}
GROUP BY product_id
)
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.stock_qty,
    COALESCE(s.units_sold, 0) AS units_sold,
    COALESCE(s.sales_value_ngn, 0) AS sales_value_ngn,
    COALESCE(s.number_of_orders, 0) AS number_of_orders
FROM {{ ref('stg_products') }} p
LEFT JOIN product_sales s
    ON p.product_id = s.product_id
    