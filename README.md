# 🌍 Global Sales Analytics | SQL & Power BI

## 📌 Project Overview

This project analyzes retail sales data across six countries using **SQL and Power BI**.

The project covers the complete analytics workflow from cleaning and consolidating multiple country-level datasets to calculating key financial metrics, answering business questions, and building an interactive sales dashboard.

![Global Sales Dashboard](dashboard/sales-dashboard.png)

The countries included in the analysis are:

- Canada
- China
- India
- Nigeria
- United Kingdom
- United States

The objective was to transform raw transactional data into meaningful insights that could support sales, profitability, product, location, and management decisions.

---

## 📊 Power BI Dashboard

![Global Sales Dashboard](dashboard/sales-dashboard.png)

The Power BI dashboard provides an interactive view of sales performance with filters for:

- Country
- Store Location
- Product Category
- Payment Method
- Date

The dashboard tracks key performance indicators including:

- Total Orders
- Total Sales
- Total Profit
- Total Discounts
- Average Order Value

It also provides visual analysis of:

- Sales by store location
- Monthly sales trends
- Daily sales trends
- Sales by product category
- Payment method distribution
- Discount versus profit performance

---

## 🎯 Business Questions

The analysis was designed to answer several practical business questions:

1. Which countries generate the highest sales revenue and profit?
2. Which products sell the highest number of units?
3. Which sales representatives generate the most revenue?
4. Which store locations perform best?
5. What are the minimum, maximum, average, and total sales values?
6. What are the minimum, maximum, average, and total profit values?
7. How do sales change across different months and days?
8. Which product categories contribute the most sales?
9. Which payment methods are most commonly used?
10. What relationship exists between discounts and profitability?

### 1. Date Standardization

Dates stored as text were converted into the SQL `DATE` datatype.

### 2. Consolidating Country Data

The six country datasets were combined into one master table using UNION ALL.

### 3. Data Quality Checks

The consolidated dataset was checked for:

Missing values
Duplicate transaction IDs
Incorrect data types
Date consistency

### 4. calculated Metrics

Two important financial fields were created during the SQL transformation process.

### 📈 Power BI Analysis

After completing the SQL cleaning and analysis, the consolidated dataset was used in Power BI to build an interactive business dashboard.

The report allows users to move from high-level KPIs to more detailed analysis across:

Country → Location → Category → Payment Method → Time

Interactive filters make it possible to compare performance across different markets and periods.

### 🛠️ Tools & Skills

SQL / MySQL
Data Cleaning
Data Type Conversion
UNION ALL
Aggregations
GROUP BY
Calculated Columns
Data Validation
Business Analysis
Power BI
Dashboard Development
KPI Reporting
Interactive Filters and Slicers
Geographic Analysis
Trend Analysis
Category Analysis
Data Visualization

### Business Analytics
Revenue Analysis
Profitability Analysis
Product Performance
Sales Representative Performance
Geographic Sales Analysis
Discount Analysis
Trend Analysis














