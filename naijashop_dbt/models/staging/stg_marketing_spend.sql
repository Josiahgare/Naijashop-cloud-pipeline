SELECT
    campaign_id,
    campaign_name,
    channel, 
    clicks, 
    conversions,
    amount_ngn AS marketing_spend_ngn,
    spend_date
FROM {{ source('raw', 'Copy_of_marketing_spend')}} 