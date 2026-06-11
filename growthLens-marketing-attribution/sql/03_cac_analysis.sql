-- CAC Analysis by Channel

SELECT
    channel,
    ROUND(SUM(ad_spend),2) AS total_spend,
    SUM(conversions) AS total_conversions,
    ROUND(
        SUM(ad_spend) / NULLIF(SUM(conversions),0),
        2
    ) AS cac,
    ROUND(SUM(revenue),2) AS total_revenue,
    ROUND(
        ((SUM(revenue) - SUM(ad_spend))
        / NULLIF(SUM(ad_spend),0)) * 100,
        2
    ) AS roi_pct
FROM marketing_raw
GROUP BY channel
ORDER BY cac ASC;
