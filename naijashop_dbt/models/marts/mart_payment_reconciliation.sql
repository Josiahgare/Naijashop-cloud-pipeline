SELECT
    order_id,
    SUM(
        CASE
            WHEN LOWER(payment_status) IN ('paid', 'successful', 'completed')
            THEN payment_amount_ngn
            ELSE 0
        END
    ) AS successful_payment_ngn,
    COUNT(*) AS payment_records
FROM {{ ref('stg_payments') }}
GROUP BY order_id
