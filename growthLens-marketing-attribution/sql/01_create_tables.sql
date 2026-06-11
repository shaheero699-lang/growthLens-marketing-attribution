-- Check Total Records
SELECT COUNT(*) AS total_records
FROM marketing_raw;

-- Check Null Values
SELECT *
FROM marketing_raw
WHERE customer_id IS NULL
   OR session_id IS NULL
   OR channel IS NULL;

-- Check Duplicate Customer Sessions
SELECT
    customer_id,
    session_id,
    COUNT(*) AS duplicate_count
FROM marketing_raw
GROUP BY customer_id, session_id
HAVING COUNT(*) > 1;

-- Check Negative Values
SELECT *
FROM marketing_raw
WHERE impressions < 0
   OR clicks < 0
   OR conversions < 0
   OR ad_spend < 0
   OR revenue < 0;

-- Check Conversion Logic
SELECT *
FROM marketing_raw
WHERE conversions > clicks;

-- Check Click Logic
SELECT *
FROM marketing_raw
WHERE clicks > impressions;
