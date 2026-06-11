SELECT
    YEAR(activity_date) AS year_num,
    MONTH(activity_date) AS month_num,
    channel,
    ROUND(SUM(ad_spend),2) AS total_spend,
    SUM(conversions) AS total_conversions,
    ROUND(
        SUM(ad_spend) / NULLIF(SUM(conversions),0),
        2
    ) AS monthly_cac
FROM marketing_raw
GROUP BY
    YEAR(activity_date),
    MONTH(activity_date),
    channel
ORDER BY
    YEAR(activity_date),
    MONTH(activity_date),
    channel;
