-- ============================================================
-- GLOBAL SALES ANALYSIS
-- DATA CLEANING & PREPARATION
-- ============================================================
-- Purpose:
-- 1. Standardize date formats across country sales tables
-- 2. Combine all country datasets into one master table
-- 3. Check for missing values and duplicate transactions
-- 4. Create calculated fields for revenue and profit
-- 5. Validate the final dataset
-- ============================================================


-- ============================================================
-- 1. CANADA SALES DATA
-- ============================================================

SELECT *
FROM sales_canada;

DESCRIBE sales_canada;

-- Convert Date from text format to DATE
UPDATE sales_canada
SET Date = CASE
    WHEN Date LIKE '%/%'
        THEN STR_TO_DATE(Date, '%m/%d/%Y')
    ELSE Date
END;

ALTER TABLE sales_canada
MODIFY COLUMN Date DATE;


-- ============================================================
-- 2. CHINA SALES DATA
-- ============================================================

SELECT *
FROM sales_china;

DESCRIBE sales_china;

UPDATE sales_china
SET Date = CASE
    WHEN Date LIKE '%/%'
        THEN STR_TO_DATE(Date, '%m/%d/%Y')
    ELSE Date
END;

ALTER TABLE sales_china
MODIFY COLUMN Date DATE;


-- ============================================================
-- 3. INDIA SALES DATA
-- ============================================================

SELECT *
FROM sales_india;

UPDATE sales_india
SET Date = CASE
    WHEN Date LIKE '%/%'
        THEN STR_TO_DATE(Date, '%m/%d/%Y')
    ELSE Date
END;

ALTER TABLE sales_india
MODIFY COLUMN Date DATE;


-- ============================================================
-- 4. NIGERIA SALES DATA
-- ============================================================

SELECT *
FROM sales_nigeria;

UPDATE sales_nigeria
SET Date = CASE
    WHEN Date LIKE '%/%'
        THEN STR_TO_DATE(Date, '%m/%d/%Y')
    ELSE Date
END;

ALTER TABLE sales_nigeria
MODIFY COLUMN Date DATE;


-- ============================================================
-- 5. UNITED KINGDOM SALES DATA
-- ============================================================

SELECT *
FROM sales_uk;

UPDATE sales_uk
SET Date = CASE
    WHEN Date LIKE '%/%'
        THEN STR_TO_DATE(Date, '%m/%d/%Y')
    ELSE Date
END;

ALTER TABLE sales_uk
MODIFY COLUMN Date DATE;


-- ============================================================
-- 6. UNITED STATES SALES DATA
-- ============================================================

SELECT *
FROM sales_us;

UPDATE sales_us
SET Date = CASE
    WHEN Date LIKE '%/%'
        THEN STR_TO_DATE(Date, '%m/%d/%Y')
    ELSE Date
END;

ALTER TABLE sales_us
MODIFY COLUMN Date DATE;


-- ============================================================
-- 7. COMBINE ALL COUNTRY TABLES
-- ============================================================
-- UNION ALL is used to retain every transaction from each table.

CREATE TABLE sales_data AS

SELECT * FROM sales_canada

UNION ALL

SELECT * FROM sales_china

UNION ALL

SELECT * FROM sales_india

UNION ALL

SELECT * FROM sales_nigeria

UNION ALL

SELECT * FROM sales_uk

UNION ALL

SELECT * FROM sales_us;


-- Preview consolidated dataset
SELECT *
FROM sales_data;


-- ============================================================
-- 8. DATA QUALITY CHECKS
-- ============================================================

-- Check for missing Quantity_Purchased values
SELECT *
FROM sales_data
WHERE Quantity_Purchased IS NULL;


-- Check for duplicate Transaction IDs
SELECT
    Transaction_ID,
    COUNT(*) AS transaction_count
FROM sales_data
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;


-- ============================================================
-- 9. STANDARDIZE NUMERIC DATA TYPES
-- ============================================================

ALTER TABLE sales_data
MODIFY COLUMN Price_per_Unit DECIMAL(10,2),
MODIFY COLUMN Quantity_Purchased INT,
MODIFY COLUMN Discount_Applied DECIMAL(10,2),
MODIFY COLUMN Cost_Price DECIMAL(10,2);


-- ============================================================
-- 10. CREATE CALCULATED FIELDS
-- ============================================================

-- ------------------------------------------------------------
-- 10.1 Total Amount
-- Total Amount = Gross Sales - Discount
-- ------------------------------------------------------------

ALTER TABLE sales_data
ADD COLUMN Total_amount DECIMAL(10,2);

UPDATE sales_data
SET Total_amount =
    (Price_per_Unit * Quantity_Purchased) - Discount_Applied;


-- ------------------------------------------------------------
-- 10.2 Profit
-- Profit = Total Amount - Total Product Cost
-- ------------------------------------------------------------

ALTER TABLE sales_data
ADD COLUMN Profit DECIMAL(10,2);

UPDATE sales_data
SET Profit =
    Total_amount - (Cost_Price * Quantity_Purchased);


-- ============================================================
-- 11. FINAL DATA VALIDATION
-- ============================================================

-- Preview cleaned dataset
SELECT *
FROM sales_data;


-- Check analysis period
SELECT
    MIN(Date) AS earliest_transaction_date,
    MAX(Date) AS latest_transaction_date
FROM sales_data;


-- ============================================================
-- END OF DATA CLEANING
-- ============================================================
