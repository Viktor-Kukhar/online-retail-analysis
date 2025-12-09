# Online Retail Analysis (2010-2011)

**Dataset:** [Online Retail Company Dataset](https://archive.ics.uci.edu/dataset/352/online+retail)

Analysis of e-commerce transactional data to understand sales performance, customer behavior, and product trends for a UK-based online retailer operating between 2010-2011.

**Quick Stats:** $8.3M revenue | 22,190 transactions | 401,604 records analyzed

**Tools:** SQL, Tableau

[**→ View Interactive Dashboard**](https://public.tableau.com/app/profile/viktor.kukhar/viz/Retail_17531934111190/Dashboard)

---

## Executive Summary

Revenue doubled from $500K to $1.1M monthly between December 2010 and November 2011, driven by seasonal product rotations and strong late-year sales momentum. However, customer spending shows no correlation with purchase frequency, with a small group of high-value customers ($150K-$250K) driving disproportionate revenue despite low transaction counts. A $150K outlier order and the absence of consistently top-performing products highlight the need for better customer segmentation and product strategy to sustain growth.

<img width="1203" height="805" alt="Dashboard Overview" src="https://github.com/user-attachments/assets/4fbafbe7-18ac-497f-a84f-46aa4c1b8b33" />

---

## Key Findings

- **Revenue grew 120% from Dec 2010 to Nov 2011**, climbing from $500K to $1.1M monthly, showing strong business momentum with notable mid-year fluctuations.

- **One order accounts for $150K in revenue** (Invoice 581483) - nearly double the next highest order at $80K, warranting verification of legitimacy.

- **No consistent top-selling product exists.** "Regency Cakestand 3 Tier" leads overall but products rotate seasonally - Party Bunting peaks in spring ($13K), White Hanging Heart in winter ($14K).

- **Customer spending shows no correlation with purchase frequency.** Most customers spend under $100K with few transactions, but high-spending outliers ($150K-$250K) drive significant revenue despite low purchase counts.

<img width="1203" height="805" alt="Dashboard Overview" src="https://github.com/user-attachments/assets/4fbafbe7-18ac-497f-a84f-46aa4c1b8b33" />

---

## Recommendations

Based on these insights, Marketing & Operations should consider the following:

- Develop personalized campaigns for customers spending $100K+ to maximize lifetime value
- Verify the $150K order's legitimacy; if valid, analyze conditions that enabled it
- Increase inventory and staffing for Oct-Nov based on consistent late-year revenue peaks
- Rotate seasonal promotions (Party Bunting in spring, White Hanging Heart in winter)

---

## Data & Methodology

**Dataset Structure:**
Single table with 401,604 records after cleaning, containing:
- InvoiceNo, StockCode, Description, Quantity
- InvoiceDate, UnitPrice, CustomerID, Country

**Analysis Approach:**
SQL queries analyzed sales performance, product trends, customer behavior, and time-based patterns. Full queries available in `Online_Retail_Analysis.sql`.

**Key Assumptions:**
- December 2011 is a partial month (included via date filter)
- Null values and duplicates were removed, assuming remaining data accurately reflects transactions
- No missing months or significant gaps in the 2010-2011 operational period
- Product description variations (typos) were not addressed beyond trimming whitespace
