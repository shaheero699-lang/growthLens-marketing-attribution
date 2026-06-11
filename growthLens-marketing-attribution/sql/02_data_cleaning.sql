-- =====================================================
-- DATA CLEANING & QUALITY CHECKS
-- Project: GrowthLens Marketing Attribution
-- File: 02_data_cleaning.sql
-- =====================================================

-- 1. Check Total Records
SELECT COUNT(*) AS total_records
FROM marketing_raw;


-- 2. Check Null Values
SELECT *
FROM marketing_raw
WHERE customer_id IS NULL
   OR session_id IS NULL
   OR channel IS NULL
   OR campaign_name IS NULL;


-- 3. Check Duplicate Customer Sessions
SELECT
    customer_id,
    session_id,
    COUNT(*) AS duplicate_count
FROM marketing_raw
GROUP BY customer_id, session_id
HAVING COUNT(*) > 1;


-- 4. Check Negative Values
SELECT *
FROM marketing_raw
WHERE impressions < 0
   OR clicks < 0
   OR conversions < 0
   OR ad_spend < 0
   OR revenue < 0
   OR customer_ltv < 0;


-- 5. Check Conversion Logic
SELECT *
FROM marketing_raw
WHERE conversions > clicks;


-- 6. Check Click Logic
SELECT *
FROM marketing_raw
WHERE clicks > impressions;


-- 7. Check Missing Revenue
SELECT *
FROM marketing_raw
WHERE revenue IS NULL;


-- 8. Check Missing LTV
SELECT *
FROM marketing_raw
WHERE customer_ltv IS NULL;


-- 9. Check Date Range
SELECT
    MIN(activity_date) AS first_date,
    MAX(activity_date) AS last_date
FROM marketing_raw;


-- 10. Check Channel Distribution
SELECT
    channel,
    COUNT(*) AS records_count
FROM marketing_raw
GROUP BY channel
ORDER BY records_count DESC;
