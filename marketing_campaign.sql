CREATE DATABASE marketing_analysis;
USE marketing_analysis;
CREATE TABLE campaign_data (
    campaign_id VARCHAR(10),
    channel VARCHAR(50),
    start_date DATE,
    end_date DATE,
    audience_age VARCHAR(10),
    gender VARCHAR(10),
    budget INT,
    impressions INT,
    clicks INT,
    conversions INT,
    revenue INT
);
/*USE marketing_analysis;*/
/*SELECT * FROM campaign_data LIMIT 10;*/

/*Total Campaigns Per Channel*/
SELECT channel, COUNT(*) AS total_campaigns
FROM campaign_data
GROUP BY channel;

/*Click-Through Rate (CTR)*/
SELECT campaign_id, channel, 
       ROUND((clicks * 100.0) / impressions, 2) AS CTR
FROM campaign_data;

/*Return on Investment (ROI)*/
SELECT campaign_id, 
       ROUND((revenue - budget) * 100.0 / budget, 2) AS ROI_Percentage
FROM campaign_data;

/*Conversion Rate*/
SELECT campaign_id, 
       ROUND((conversions * 100.0) / clicks, 2) AS Conversion_Rate
FROM campaign_data;

/*Monthly Performance*/
SELECT MONTH(start_date) AS Month, 
       SUM(budget) AS Total_Spend, 
       SUM(revenue) AS Total_Revenue
FROM campaign_data
GROUP BY MONTH(start_date);