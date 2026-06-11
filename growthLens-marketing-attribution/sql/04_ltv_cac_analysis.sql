-- =====================================================
-- LTV:CAC ANALYSIS BY CHANNEL
-- =====================================================

SELECT
    channel,
    ROUND(AVG(customer_ltv),2) AS estimated_ltv,
    ROUND(SUM(ad_spend),2) AS total_spend,
    SUM(conversions) AS total_conversions,

    ROUND(
        SUM(ad_spend) /
        NULLIF(SUM(conversions),0),
        2
    ) AS cac,

    ROUND(
        AVG(customer_ltv) /
        NULLIF(
            SUM(ad_spend) /
            NULLIF(SUM(conversions),0),
            0
        ),
        2
    ) AS ltv_cac_ratio

FROM marketing_raw
GROUP BY channel
ORDER BY ltv_cac_ratio DESC;
