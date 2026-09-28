SELECT
    payment_id, 
    order_id, 
    method, 
    amount AS payment_amount_ngn, 
    status AS payment_status, 
    paid_at
FROM {{ source('raw', 'payments')}} 