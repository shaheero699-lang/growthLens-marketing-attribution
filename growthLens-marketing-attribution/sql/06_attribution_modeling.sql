SELECT
    channel,

    ROUND(SUM(revenue) * 0.30, 2) AS ft_revenue,

    ROUND(SUM(revenue) * 0.50, 2) AS lt_revenue,

    ROUND(SUM(revenue) * 0.20, 2) AS linear_revenue

FROM marketing_raw

GROUP BY channel

ORDER BY channel;
