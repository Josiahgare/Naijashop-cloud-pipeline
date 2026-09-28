SELECT
    "from" AS source_currency,
    "to" AS target_currency,
    rate, 
    amount, 
    result, 
    success, 
    change24h AS change_24h, 
    "updatedAt" AS updated_at, 
    "changePct24h" AS change_pct_24h
FROM {{ source('raw', 'exchange_rate_cloud')}}