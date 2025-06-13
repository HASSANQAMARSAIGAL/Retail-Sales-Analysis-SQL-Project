-- SQL RETAIL SALE ANALYSIS
USE retail_sales;

-- Create Table
CREATE TABLE retail_sales
(
	transaction_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT,
	category VARCHAR(16),
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
);

SELECT * 
FROM retail_sales
LIMIT 10;

-- DATA CLEANING
SELECT *
FROM retail_sales
WHERE transaction_id is NULL ;

SELECT *
FROM retail_sales
WHERE sale_date is NULL ;

SELECT *
FROM retail_sales
WHERE sale_time is NULL ;

SELECT * 
FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

--
SET SQL_SAFE_UPDATES = 0;

DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

-- DATA EXPLORATION

-- How many sales do we have
SELECT COUNT(*) as total_sale
FROM retail_sales ;

-- How many uniuque customers we have ?
SELECT COUNT(DISTINCT(customer_id)) AS total_customer
FROM retail_sales ;

-- Data Analysis & Business Key Problems & Answers

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05' ;

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is 4 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE
	category = 'Clothing'
    AND
	YEAR(sale_date) = 2022
	AND
    MONTH(sale_date) = 11
    AND 
    quantiy >= 4;
    
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT
	category,
	SUM(total_sale) AS total_sales
FROM
	retail_sales
GROUP BY
	category ;
  
-- Q.4 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT customer_id,SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY
	customer_id
ORDER BY
	total_sale DESC
LIMIT 5;

-- Q.5 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
SELECT
	CASE
		WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(sale_time) > 17 THEN 'Evening'
	END AS shift,
	COUNT(*) AS number_of_order
FROM retail_sales
GROUP BY
shift ;

-- End Project






