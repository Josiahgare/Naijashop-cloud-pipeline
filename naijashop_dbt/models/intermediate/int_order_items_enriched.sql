SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS item_total_ngn
FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_products') }} p
    ON oi.product_id = p.product_id