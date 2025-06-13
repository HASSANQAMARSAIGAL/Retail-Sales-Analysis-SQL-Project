Retail Sales Analysis — SQL Project
🔹 Project Overview
This project involves analyzing retail sales data using MySQL.
The main objective is to extract valuable business insights and aid stakeholders in making data-informed decisions

🔹 Database Schema
The project utilizes a single table: retail_sales with the following structure:
transaction_id (INT, Primary Key)
sale_date (DATE)
sale_time (TIME)
customer_id (INT)
gender (VARCHAR)
age (INT)
category (VARCHAR)
quantity (INT)
price_per_unit (FLOAT)
cogs (FLOAT)
total_sale (FLOAT)

🔹 Data Cleaning
Removed records with missing or NULL values in key fields.
Standardized data to enable accurate and trustworthy analysis.

🔹 Analysis and Queries
✅ How many sales do we have in total?
✅ How many unique customers do we have?
✅ Retrieve all transactions where the category is Clothing, the quantity is greater than 4, and the transaction falls in November 2022.
✅ Calculate total sales for each product category.
✅ Identify the top 5 customers by total sales.
✅ Count number of orders by shift (Morning, Afternoon, Evening).

🔹 Tools and Techniques
MySQL for data storage, transformation, and retrieving analytical results.
SQL (with GROUP BY, SUM, COUNT, LIMIT, and CASE) for data analysis.
