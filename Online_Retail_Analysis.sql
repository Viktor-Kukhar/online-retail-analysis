-- Project: Online Retail Analysis
-- Dataset: Online Retail Dataset
-- Source: https://archive.ics.uci.edu/dataset/352/online+retail
-- Purpose: Analyze sales, customer behavior, and product performance
-- Author: [Viktor Kukhar]
-- Date: April 2025



SELECT * 
FROM Online_Retail 
LIMIT 500;

-- Data Cleaning and Transformation
UPDATE Online_Retail
SET 
  InvoiceNo = TRIM(InvoiceNo),
  StockCode = TRIM(StockCode),
  Description = TRIM(Description),
  Country = TRIM(Country); -- Removing white space from text columns
  
UPDATE Online_Retail
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i'); -- Converting string to datetime

DELETE FROM Online_Retail
WHERE 
  InvoiceNo IS NULL OR
  StockCode IS NULL OR
  Description IS NULL OR
  Quantity IS NULL OR
  InvoiceDate IS NULL OR
  UnitPrice IS NULL OR
  CustomerID IS NULL OR
  Country IS NULL; -- Deleting null values

SELECT InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country, COUNT(*) AS count
FROM Online_Retail
GROUP BY InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country
HAVING COUNT(*) > 1; -- identifying duplicates
  
ALTER TABLE Online_Retail ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY; -- adding ID column to make duplicates deletion easier

DELETE FROM Online_Retail
WHERE id NOT IN (
    SELECT * FROM (
        SELECT MIN(id)
        FROM Online_Retail
        GROUP BY InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country
    ) AS temp_ids
); -- deleting duplicates

ALTER TABLE Online_Retail DROP COLUMN id; -- removing added column



-- 1. List all transactions that occurred in a specific month or date range.
SELECT COUNT(InvoiceNo) AS 'transactions_2010-12-01_2010-12-05'
FROM Online_Retail
WHERE InvoiceDate BETWEEN '2010-12-01' AND '2010-12-05';

-- 2. Retrieve a list of all products sorted by price or by name.
SELECT Description AS product, UnitPrice
FROM Online_Retail
ORDER BY UnitPrice DESC; -- Products ordered by highest price

SELECT Description AS product
FROM Online_Retail
ORDER BY Description; -- Products ordered by name

-- 3. Count the total number of transactions (orders) in the dataset.
SELECT COUNT(InvoiceNo) AS num_orders
FROM Online_Retail;

-- 4. Calculate the total sales revenue (unit price * quantity sold).
SELECT SUM(UnitPrice * Quantity) AS sales_revenue
FROM Online_Retail;

-- 5. Group transactions by product and display the total quantity sold for each product.
SELECT Description AS product, SUM(Quantity) AS total_quantity_sold
FROM Online_Retail
GROUP BY Description
ORDER BY SUM(Quantity) DESC;

-- 6. Identify products that sold more than a specified threshold number of units.
-- Let's say our threshold is 2000 units
SELECT Description AS product, Quantity
FROM Online_Retail
GROUP BY Description, Quantity
HAVING Quantity > 2000
ORDER BY Quantity DESC;

-- 7. Extract the month and year from the transaction date and group sales by these time intervals.
SELECT SUBSTRING(InvoiceDate, 4, 2) AS month, SUBSTRING(InvoiceDate, 7, 4) AS year, SUM(UnitPrice * Quantity) AS sales_revenue
FROM Online_Retail
GROUP BY year, month;

-- 8. Find the top 10 best-selling products based on sales revenue.
SELECT Description AS product, SUM(UnitPrice * Quantity) AS sales_revenue
FROM Online_Retail
GROUP BY Description
ORDER BY sales_revenue DESC
LIMIT 10;

-- 9. Rank customers based on their total spending.
SELECT CustomerID, SUM(UnitPrice * Quantity) AS total_spent, RANK() OVER (ORDER BY SUM(UnitPrice * Quantity) DESC) AS rank_by_total_spending
FROM Online_Retail
GROUP BY CustomerID;

-- 10. Find customers whose total purchase is above the average of all customers.
SELECT SUM(UnitPrice * Quantity) AS total_spent, AVG(UnitPrice * Quantity) AS avg_spent
FROM Online_Retail; -- Finding average spending

WITH customers_above_avg
AS (
    SELECT CustomerID, SUM(UnitPrice * Quantity) AS total_spent
    FROM Online_Retail
    GROUP BY CustomerID
    )
SELECT CustomerID, AVG(total_spent) AS avg_spent
FROM customers_above_avg
GROUP BY CustomerID
HAVING avg_spent > 20.401853884564613;

-- 11. Retrieve details of the customer with the highest single order value.
SELECT CustomerID, InvoiceNo, SUM(UnitPrice * Quantity) AS total_order_value
FROM Online_Retail
GROUP BY CustomerID, InvoiceNo
ORDER BY total_order_value DESC
LIMIT 1;

-- 12. Update a product’s price based on a percentage increase.
UPDATE Online_Retail SET UnitPrice = UnitPrice * 1.10
WHERE Description LIKE '%LANTERN%';

-- 13. Retrieve orders that meet several criteria (high-value, repeat customers).
SELECT InvoiceNo, SUM(UnitPrice * Quantity) AS Value
FROM Online_Retail
GROUP BY InvoiceNo
HAVING Value >= 10000
ORDER BY Value DESC; -- High-value orders

SELECT CustomerID
FROM Online_Retail
WHERE CustomerID IN (
    SELECT CustomerID FROM Online_Retail GROUP BY CustomerID HAVING COUNT(*) > 1
    ); -- repeating customers