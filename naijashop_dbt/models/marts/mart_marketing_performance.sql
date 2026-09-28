SELECT
    campaign_id,
    campaign_name,
    channel,
    SUM(clicks::numeric) AS total_clicks,
    SUM(conversions::numeric) AS total_conversions,
    SUM(marketing_spend_ngn::numeric) AS total_spend_ngn,
    ROUND(
        SUM(marketing_spend_ngn::numeric)
        / NULLIF(SUM(clicks::numeric), 0),
        2
    ) AS cost_per_click_ngn,
    ROUND(
        SUM(marketing_spend_ngn::numeric)
        / NULLIF(SUM(conversions::numeric), 0),
        2
    ) AS cost_per_conversion_ngn,
    ROUND(
        SUM(conversions::numeric)
        / NULLIF(SUM(clicks::numeric), 0)
        * 100,
        2
    ) AS conversion_rate_pct
FROM {{ ref('stg_marketing_spend') }}
GROUP BY
    campaign_id,
    campaign_name,
    channel
