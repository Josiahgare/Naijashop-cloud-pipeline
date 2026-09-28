SELECT
    product_id, 
    product_name, 
    category, 
    price, 
    stock_qty
FROM {{ ref('stg_products')}} 
