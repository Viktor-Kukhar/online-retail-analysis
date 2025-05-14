# Online Retail Analysis

## Overview
This project analyzes the [Online Retail Dataset](https://archive.ics.uci.edu/dataset/352/online+retail) to uncover insights about sales performance, customer behavior, and product trends for an online retail business.

## Objectives
- Clean and preprocess the dataset for accurate analysis.
- Identify top-selling products and high-value customers.
- Analyze sales trends by month and year.
- Segment customers based on spending and order frequency.

## Dataset
- **Source**: UCI Machine Learning Repository
- **Columns**:
  - InvoiceNo, StockCode, Description
  - Quantity, InvoiceDate, UnitPrice
  - CustomerID, Country
- **Link**: [Dataset](https://archive.ics.uci.edu/dataset/352/online+retail)

## Files
- `Online_Retail_Analysis.sql`: SQL queries for data cleaning and analysis.

## Key Queries
1. **Transactions in Date Range**: Counted transactions from Dec 1-5, 2010.
2. **Top Products**: Listed top 10 best-selling products by revenue.
3. **Customer Spending**: Identified customers with above-average spending.
4. **Sales by Time**: Grouped sales revenue by month and year.
5. **Highest Order**: Found the customer with the highest single order value.
6. **Data Cleaning**: Removed nulls, duplicates, and formatted dates.

## Sample Insights
- 5027 transactions occurred between Dec 1-5, 2010 (Query 1).
- Top product: REGENCY CAKESTAND 3 TIER, Revenue: 132,567 (Query 8).
- Sales peaked in November, 2011: 1,128,461 revenue (Query 7).
- Customer 16446 had the highest order value: 168,469 (Query 11).
- Average customer spending: 20, with 4,310 customers above average (Query 10).

## How to Run
1. Download the dataset from [UCI](https://archive.ics.uci.edu/dataset/352/online+retail).
2. Import it into a SQL database.
3. Run `Online_Retail_Analysis.sql` in a SQL editor.

## Skills Demonstrated
- **SQL**: Data cleaning, CTE's, subqueries, aggregation and filtering, sorting, grouping, datetime functions.
- **Analysis**: Sales analysis, customer segmentation, trend analysis.
- **Data Cleaning**: Handling nulls, duplicates, text formatting.

## Contact Me
- **Name**: Viktor Kukhar
- **LinkedIn**: https://www.linkedin.com/in/kukhar-viktor/
- **Email**: viktor.kukhar1708@gmail.com

---
Last Updated: May 2025

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Data Analysis](https://img.shields.io/badge/Analysis-Insights-green)
