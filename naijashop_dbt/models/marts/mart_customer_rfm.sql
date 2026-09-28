WITH customer_metrics AS (
SELECT
    customer_id,
    MAX(order_date) AS last_order_date,
    COUNT(*) AS frequency,
    SUM(order_total_ngn) AS monetary_value_ngn
FROM {{ ref('fct_orders') }}
GROUP BY customer_id
)
SELECT
    customer_id,
    last_order_date,
    CURRENT_DATE - last_order_date::date AS recency_days,
    frequency,
    monetary_value_ngn,
    CASE
        WHEN CURRENT_DATE - last_order_date::date <= 30
            AND frequency >= 5
        THEN 'Frequent Recent Customer'
        WHEN CURRENT_DATE - last_order_date::date <= 90
            AND frequency >= 2
        THEN 'Repeat Customer'
        WHEN CURRENT_DATE - last_order_date::date > 90
        THEN 'Needs Attention'
        ELSE 'Other'
    END AS customer_segment
FROM customer_metrics
