SELECT
    journey_id,
    customer_id,

    COUNT(*) AS total_touchpoints,

    SUM(impressions) AS total_impressions,

    SUM(clicks) AS total_clicks,

    SUM(conversions) AS total_conversions,

    ROUND(SUM(ad_spend), 2) AS total_spend,

    ROUND(SUM(revenue), 2) AS total_revenue

FROM marketing_raw

GROUP BY
    journey_id,
    customer_id

ORDER BY total_revenue DESC;
