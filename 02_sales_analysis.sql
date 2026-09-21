-- ============================================================
-- GLOBAL SALES ANALYSIS
-- BUSINESS QUESTIONS & ANALYSIS
-- ============================================================
-- Purpose:
-- Analyze sales performance across countries, products,
-- sales representatives, store locations, revenue and profit.
-- ============================================================


-- ============================================================
-- 1. SALES REVENUE & PROFIT BY COUNTRY
-- ============================================================
-- Which countries generate the highest sales revenue and profit?

SELECT
    Country,
    SUM(Total_amount) AS Total_Sales_Revenue,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Country
ORDER BY Total_Sales_Revenue DESC;


-- ============================================================
-- 2. TOP 5 BEST-SELLING PRODUCTS
-- ============================================================
-- Which products sold the highest number of units
-- during the selected period?

SELECT
    Product_Name,
    SUM(Quantity_Purchased) AS Total_Units_Sold
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Units_Sold DESC
LIMIT 5;


-- ============================================================
-- 3. SALES REPRESENTATIVE PERFORMANCE
-- ============================================================
-- Which sales representatives generated the most revenue?

SELECT
    Sales_Rep,
    SUM(Total_amount) AS Total_Sales
FROM sales_data
GROUP BY Sales_Rep
ORDER BY Total_Sales DESC;


-- ============================================================
-- 4. TOP-PERFORMING STORE LOCATIONS
-- ============================================================
-- Which store locations generated the highest sales?

SELECT
    Store_Location,
    SUM(Total_amount) AS Total_Sales
FROM sales_data
GROUP BY Store_Location
ORDER BY Total_Sales DESC
LIMIT 10;


-- ============================================================
-- 5. SALES & PROFIT SUMMARY
-- ============================================================
-- What are the key sales and profit statistics
-- for the selected period?

SELECT
    MIN(Total_amount) AS Minimum_Sales_Value,
    MAX(Total_amount) AS Maximum_Sales_Value,
    AVG(Total_amount) AS Average_Sales_Value,
    SUM(Total_amount) AS Total_Sales_Value,

    MIN(Profit) AS Minimum_Profit,
    MAX(Profit) AS Maximum_Profit,
    AVG(Profit) AS Average_Profit,
    SUM(Profit) AS Total_Profit

FROM sales_data;


-- ============================================================
-- 6. FINAL DATASET PREVIEW
-- ============================================================

SELECT *
FROM sales_data;


-- ============================================================
-- END OF BUSINESS ANALYSIS
-- ============================================================
