# Online Retail Analysis SQL Project

## Project Background

This project analyzes transactional data from an [Online Retail Company Dataset](https://archive.ics.uci.edu/dataset/352/online+retail) that operated between 2010 and 2011. The company operates in the e-commerce industry, selling a variety of products to customers across multiple countries via an online platform. Its business model focuses on direct-to-consumer sales, with key business metrics including total sales revenue, number of transactions, customer spending patterns, and product performance.

Insights and recommendations are provided on the following key areas:

- **Sales Performance:** Total revenue, transaction counts, and high-value orders.
- **Product Analysis:** Best-selling products and high-volume items.
- **Customer Behavior:** Spending rankings and repeat purchase patterns.
- **Time-based Trends:** Sales patterns over time, including monthly and yearly trends.

The SQL queries used to inspect, clean, and analyze the data for this project can be found in the Online_Retail_Analysis.sql file.

## Data Structure & Initial Checks

The dataset consists of a single table, `Online_Retail`, with the following columns:

- **InvoiceNo:** Unique identifier for each transaction.
- **StockCode:** Unique code for each product.
- **Description:** Product name or description.
- **Quantity:** Number of units sold in the transaction.
- **InvoiceDate:** Date and time of the transaction.
- **UnitPrice:** Price per unit of the product.
- **CustomerID:** Unique identifier for each customer.
- **Country:** Country where the customer is located.

Initial data cleaning steps removed null values and duplicates, resulting in a refined dataset. The total row count after cleaning is 401,604.

<img width="226" alt="Screenshot 2025-05-22 at 14 01 25" src="https://github.com/user-attachments/assets/d42559c9-2f9c-48f1-9174-fef30f139cc7" />
<img width="1230" alt="Screenshot 2025-05-22 at 14 02 04" src="https://github.com/user-attachments/assets/2d56d2f3-5233-429b-9c70-a5e22f99c931" />

## Executive Summary

### Overview of Findings

The analysis reveals a total sales revenue of approximately $8.2 million across 22,000 unique transactions from December 2010 to October 2011. Customer spending shows no strong correlation with purchase frequency with most customers showing low spending and few transactions, alongside a few high-spending outliers. Revenue grew significantly by November 2011, reaching $1.1 million monthly, while high-value orders include a notable outlier at $150,000. Product revenue fluctuates dynamically over time, with no consistent top performer among the top five products but "REGENCY CAKE STAND 3 TIER" brought most revenue overall.

## Insights Deep Dive

### Sales Performance

- **Total sales revenue reached $8,288,339.** Calculated as the sum of `UnitPrice * Quantity` across all transactions.
- **The dataset includes 22,190 unique transactions.** Derived from counting distinct `InvoiceNo` values.
- **A significant outlier exists among high-value orders.** Invoice 581483 at ~$150,000, far exceeding the next highest order (541431) at ~$80,000. Remaining top orders range from $20,000 to $40,000 identified through grouping by `InvoiceNo` and summing revenue.

<img width="967" alt="Screenshot 2025-05-21 at 21 59 59" src="https://github.com/user-attachments/assets/093282c6-99c2-4769-9df6-48b71647a83a" />

### Product Analysis

- **Top products show dynamic revenue trends with no consistent leader.**
  - **Regency Cakestand 3 Tier:** Peaks at $16,000 (Dec 2010), stabilizes at ~$10,000.
  - **White Hanging Heart T-Light Holder:** Peaks at $14,000 (Jan and Nov 2011).
  - **Party Bunting:** Peaks at $13,000 (April 2011), drops to $3,600 (Nov 2011).
  - **Jumbo Bag Red Retrospot:** Rises to $10,000 (Nov 2011) from $3,500 (Dec 2010).
  - **Postage:** Grows to $9,500 (Nov 2011) from $4,000 (Dec 2010).
- **Insight:** Revenue fluctuates over time due to seasonal demand or promotions with no top product ranking high consistently.

<img width="1255" alt="Screenshot 2025-05-21 at 23 16 31" src="https://github.com/user-attachments/assets/ff09963b-b5d5-4d7d-ab34-98739ed96df5" />

### Customer Behavior

- **No strong correlation exists between customer spending and purchase frequency or invoice count.** 
- **Customer Spending vs Number of Purchases** indicates most customers make fewer than 80 purchases with spending under $100,000, with outliers at $250,000 for 20-40 purchases and $150,000 for 200+ purchases.
- **Insight:** The majority of customers are low spenders with few transactions, but a small subset of high spenders significantly impacts total revenue.

<img width="1081" alt="Screenshot 2025-05-21 at 22 59 52" src="https://github.com/user-attachments/assets/0ec42065-2156-4456-b403-6bbf823f67bf" />

### Monthly Revenue Trends

- **Revenue grew from $500,000 in December 2010 to $1.1 million in November 2011, with fluctuations.** 
  - Dips to ~$400,000 in early 2011, followed by a peak of ~$600,000 in May.
  - Steady growth from July ($570,000) to November ($1.1 million).
- **Insight:** The upward trend suggests increasing sales momentum, with fluctuations possibly tied to seasonal or operational factors.

<img width="1077" alt="Screenshot 2025-05-21 at 23 20 06" src="https://github.com/user-attachments/assets/7471be53-d09b-43d5-9090-3f8b09921219" />

## Recommendations

Based on the insights and findings above, we recommend the following to the marketing and operations teams:

- **Target high-spending outliers.** Develop personalized marketing for customers with spending above $100,000 to maximize their lifetime value.
- **Investigate the $150,000 order.** Verify its legitimacy. If valid, replicate conditions driving such sales; if it's an error, adjust revenue calculations.
- **Prepare for late-year growth.** Increase inventory and staffing for October-November based on the $1.1 million peak trend.
- **Promote top products dynamically.** Rotate promotions for products like Party Bunting (spring) and White Hanging Heart T-Light Holder (winter) to leverage seasonal peaks.

## Assumptions and Caveats

Throughout the analysis, the following assumptions and caveats were noted:

- **Data cleaning removed all null values and duplicates.** This assumes the remaining data accurately reflects the company’s transactions.
- **The dataset spans the full operational period (2010-2011).** No missing months or significant gaps are assumed.
- **Product descriptions are consistent.** Variations in naming (due to typos) were not addressed beyond trimming whitespace.
