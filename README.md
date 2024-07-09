# Walmart Sales Data Analysis

To analyze Walmart sales data to identify top-performing branches and products, understand sales trends, and study customer behavior. This analysis aims to suggest improvements and optimizations for sales strategies.



### Dataset Source :



The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

Historical sales data for 45 Walmart stores across different regions.

Includes sales data for various departments within each store.

Contains information on selected holiday markdown events affecting sales.

### Aim of this project :

Gain insights into Walmart's sales data.

Identify factors affecting sales across different branches.

Develop strategies for improving sales performance.
### Analysis Objectives :

#### Product Analysis:

Understand the performance of different product lines.
Identify best-performing product lines and those needing improvement.

#### Sales Analysis:

Analyze sales trends of various products.
Evaluate the effectiveness of current sales strategies.
Suggest modifications to enhance sales performance.

#### Customer Analysis:

Uncover different customer segments.
Study purchase trends and profitability of each segment.
### Approach and Methodology :



#### Data Wrangling:

Inspect and clean the dataset.
Handle missing or NULL values by using data replacement methods.

Ensure data integrity by creating tables with NOT NULL constraints.

#### Database Creation:

Build a database to store cleaned data.

Create tables , Import data from CSV file

Filter out columns with null values (ensured by NOT NULL constraints).

#### Feature Engineering:

Generate new columns from existing data to enhance analysis.

time_of_day:  Categorize sales into Morning, Afternoon, and Evening.

day_name:
 Extract day of the week for each transaction (Mon, Tue, Wed, Thu, Fri).
 
 month_name: 
Extract month of the year for each transaction (Jan, Feb, Mar).

### Business Questions Answered :

Conducted in-depth analysis to answer project questions.

#### Product Analysis
How many unique product lines does the data have?

What is the most common payment method?

What is the most selling product line?

What is the total revenue by month?

What month had the largest COGS?

What product line had the largest revenue?

What is the city with the largest revenue?

What product line had the largest VAT?

Fetch each product line and add a column to those 
product line showing "Good", "Bad". Good if its greater than average sales

Which branch sold more products than average product sold?

What is the most common product line by gender?
What is the average rating of each product line?

### Sales

Number of sales made in each time of the day per weekday

Which of the customer types brings the most revenue?

Which city has the largest tax percent/ VAT (Value Added Tax)?

Which customer type pays the most in VAT?

### Customer Analysis

How many unique customer types does the data have?
How many unique payment methods does the data have?

What is the most common customer type?

Which customer type buys the most?

What is the gender of most of the customers?

What is the gender distribution per branch?

Which time of the day do customers give most ratings?

Which time of the day do customers give most ratings per branch?

Which day fo the week has the best avg ratings?

Which day of the week has the best average ratings per branch?
