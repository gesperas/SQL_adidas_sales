-- Use the adidas database
USE adidasdb;

-- Show the columns of adidas table
SHOW COLUMNS FROM adidas_sales;

-- Show the data from adidas sales table
SELECT * FROM adidas_sales;

-- Retrieve all sales records of year 2020
SELECT * FROM adidas_sales
WHERE invoice_date LIKE "%20";

-- List all products sold in the dataset
SELECT DISTINCT product
FROM adidas_sales;

-- Find the total number of sales transactions
SELECT COUNT(total_sales) AS Total_Transactions
FROM adidas_sales;

-- Creating view to retrieve data for later 
CREATE VIEW RETAILERSALES AS 
SELECT retailer, SUM(DISTINCT total_sales) AS TOTALSALES
FROM adidas_sales
GROUP BY retailer
ORDER BY TOTALSALES DESC;

SELECT * FROM RETAILERSALES;

-- Find the highest and lowest sale amounts
SELECT MAX(total_sales) AS HighestSales, MIN(total_sales) AS LowestSales
FROM adidas_sales;

-- List all sales for a specific product
SELECT *
FROM adidas_sales
WHERE product = 'Men''s Apparel' or product = 'Women''s Apparel';

-- Calculate the average sale amount
SELECT AVG(total_sales) AS AverageSaleAmount
FROM adidas_sales;

-- List all sales made by a particular retailer
SELECT * FROM adidas_sales
WHERE retailer = 'Foot Locker';

-- List all sales made by a specific retailer in the Q1 of 2021
SELECT * FROM adidas_sales
WHERE YEAR(STR_TO_DATE(invoice_date, '%d-%M-%y')) = 2021
  AND MONTH(STR_TO_DATE(invoice_date, '%d-%M-%y')) BETWEEN 1 AND 3
  AND retailer = 'Kohls'
ORDER BY STR_TO_DATE(invoice_date, '%d-%M-%y');

-- Find the 5 most recent sales transactions
SELECT * FROM adidas_sales
ORDER BY invoice_date DESC
LIMIT 5;

-- List all sales for products in a specific region
SELECT * FROM adidas_sales
WHERE region = 'South';

-- Calculate the total number of products sold
SELECT COUNT(product) AS TotalProductsSOld
FROM adidas_sales;

-- Retrieve all sales on a specific date
SELECT * FROM adidas_sales
WHERE invoice_date = '2-Feb-20';

-- Calculate the total number of product sold by each retailer
SELECT retailer, count(product) AS TotalProductSold
FROM adidas_sales
GROUP BY retailer
ORDER BY TotalProductSold DESC;

-- List the retailer who have made purchases in the last month
SELECT retailer, invoice_date FROM adidas_sales
WHERE MONTH(STR_TO_DATE(invoice_date, '%d-%M-%y')) = 1
AND YEAR(STR_TO_DATE(invoice_date, '%d-%M-%y')) = 2020;

-- Find the products with the highest and lowest profit
SELECT product, MAX(operating_profit) AS HighestProfit, MIN(operating_profit) AS LowestProfit
FROM adidas_sales
GROUP BY product;

-- List all sales for a specific product and retailer
SELECT * FROM adidas_sales
WHERE product = 'Men''s Apparel' AND retailer = 'Walmart';

-- Calculate the total revenue from a specific product
SELECT product, SUM(total_sales) AS TotalRevenue
FROM adidas_sales
WHERE product = 'Men''s Apparel';

-- Calculate the average sales in each retailer of year 2021
SELECT retailer, AVG(total_sales) AS AVGSALES, SUM(total_sales) AS TOTALSALES
FROM adidas_sales
WHERE YEAR(str_to_date(invoice_date, '%d-%M-%y')) = 2021
GROUP BY retailer
ORDER BY TOTALSALES DESC;

-- Insert a new data to the table
INSERT INTO adidas_sales VALUES (106, 'Gero Retail', '22-Sept-23', 'NCR', 'Manila', 'Manila', 'Men''s Apparel', 40, 100, 4000, 3000, '80%', 'Online');

SELECT * FROM adidas_sales
WHERE retail_id = 106;

-- Delete the retailer name Gero Retail
DELETE FROM adidas_sales
WHERE retailer = 'Gero Retail';




