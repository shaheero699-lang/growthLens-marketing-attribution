-- GrowthLens Marketing Attribution
-- Create Raw Marketing Table

CREATE TABLE marketing_raw (
    customer_id VARCHAR(50),
    session_id VARCHAR(50),
    activity_date DATE,
    channel VARCHAR(50),
    campaign_name VARCHAR(100),
    impressions INT,
    clicks INT,
    ad_spend DECIMAL(10,2),
    conversions INT,
    revenue DECIMAL(10,2),
    customer_ltv DECIMAL(10,2),
    device_type VARCHAR(20),
    region VARCHAR(50),
    touchpoint_order INT,
    journey_id VARCHAR(50)
);
