CREATE DATABASE WALMARTSALES;
USE WALMARTSALES;

-- Creating Table --

CREATE TABLE IF NOT EXISTS Sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- Import Data from CSV file --

select * from Sales;
-- --------------------------------------------------------------------
-- ---------------------------- Adding/Removing Columns/Feature Engineering ------------------------------
-- --------------------------------------------------------------------

-- Adding a column 'time_of_day' (To store Morning ,Afternoon etc) --

SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;
ALTER TABLE Sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- Adding column 'day_name' to store Monday,Tuesday etc based on datetime --

select date, dayname(date) as day_name from sales;
ALTER TABLE Sales ADD COLUMN day_name VARCHAR(15);
UPDATE sales
SET day_name = DAYNAME(date);

SELECT
	date,
	MONTHNAME(date)
FROM sales;

UPDATE sales
SET day_name = DAYNAME(date);

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);
UPDATE sales SET month_name = MONTHNAME(date);
select * from sales;
-- --------------------------------------------------------------------------------------------------

-- Business Questions --

-- How Many Unique Cities exist in the data?-----

Select distinct  city from Sales;

-- How many branches ---
select distinct branch from sales;

-- Product Analysis --

-- How many unique product lines does the data have?--

select distinct product_line from sales;

-- What is the most common payment method? --

select payment, count(payment) as cnt from sales group by payment order by cnt desc;

-- What is the most selling product line? --

select product_line, count(product_line) as cntpr from sales group by product_line order by cntpr desc;
SELECT COUNT(DISTINCT product_line) FROM sales; -- 6 Unique Product Lines

-- What is the total revenue by month?

select sum(total) as total_revenue, month_name as month from sales group by month_name;

-- What month had the largest COGS?

select max(cogs) as maxcogs , month_name as month from sales group by month_name;

-- What product line had the largest revenue?

select sum(total) as maxtotal, product_line from sales group by product_line;

-- What is the city with the largest revenue?

select sum(total) as maxtotal2, city from sales group by city order by maxtotal2 desc;

-- What product line had the largest VAT?

select avg(tax_pct) as avg_tax , product_line from sales group by product_line order by avg_tax desc;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". 
-- Good if its greater than average sales

ALTER TABLE sales ADD COLUMN salesquality VARCHAR(10);

-- select product_line as prline, cogs, 
-- CASE
-- when cogs > (select avg(cogs) from sales) then "good" else "bad" END as performance from sales;--

-- Which branch sold more products than average product sold?

select branch, sum(quantity) as qty from sales group by branch order by qty desc;

-- What is the most common product line by gender?

select gender , product_line, count(gender) as cgender from sales group by gender,product_line 
order by cgender desc;

-- What is the average rating of each product line?

select product_line, avg(rating) as avgrating from sales group by product_line order by avgrating desc;

-- ---------------------------------------------------------------------------------------------------------------
-- --------------------------- Sales Analysis ------------------------------------------------------
select * from sales;

-- Number of sales made in each time of the day per weekday

select count(*) as total_number_ofsales, time_of_day from sales group by time_of_day;

-- Which of the customer types brings the most revenue?

select customer_type , sum(total) as totalrevenue from sales group by customer_type;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?

select avg(tax_pct) as avg_vat, city from sales group by city order by avg_vat desc;

-- Which customer type pays the most in VAT?

select avg(tax_pct) as avg_vat1, customer_type from sales group by customer_type order by avg_vat1 desc;

-- --------------------- Customer Analytics -----------------------------------

-- How many unique customer types does the data have?

select distinct customer_type from sales;

-- How many unique payment methods does the data have?

select count(distinct payment) from sales;

-- What is the most common customer type?
-- Which customer type buys the most?
-- select sum(total) as total1 , customer_type from sales group by customer_type order by total1 desc;
select customer_type, count(*) as cstm_cnt from sales group by customer_type;

-- What is the gender of most of the customers?

SELECT gender, COUNT(*) AS frequency FROM sales GROUP BY gender ORDER BY frequency DESC;

-- What is the gender distribution per branch?

SELECT gender, COUNT(*) AS gendercount FROM sales where branch = "A" GROUP BY gender 
ORDER BY gendercount DESC;

-- Which time of the day do customers give most ratings?

select time_of_day, avg(rating) as avgrating09 from sales group by time_of_day order by avgrating09 desc;

-- Which time of the day do customers give most ratings per branch

SELECT day_name, avg(rating) AS avgrating08 FROM sales GROUP BY day_name 
order by avgrating08 desc;

-- Which day of the week has the best avg ratings as per branch?

SELECT day_name, avg(rating) AS avgrating08 FROM sales where branch = "C" GROUP BY day_name 
order by avgrating08 desc;





















