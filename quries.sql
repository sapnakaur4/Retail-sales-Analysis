CREATE DATABASE SQL_PROJECT2;
-- CREATE TABLE
CREATE TABLE RETAIL_SALES (
TRANSACTION_ID INT PRIMARY KEY ,
SALE_DATE DATE ,
SALE_TIME TIME ,
CUSTOMER_ID INT ,
GENDER VARCHAR (15),
AGE INT ,
CATEGORY VARCHAR (15),
QUANTITY INT ,
PRICE_PER_UNIT FLOAT ,
COGS FLOAT ,
TOTAL_SALE FLOAT );


select 
count(*)
from retail_sales;

-- data cleaning

 select *   FROM retail_sales
where TRANSACTION_ID is null

 select *   FROM retail_sales
where sale_date is null

 select *   FROM retail_sales
where sale_time is null

 select *   FROM retail_sales
where customer_id is null

 select *   FROM retail_sales
where gender is null

 select *   FROM retail_sales
where age is null

 select *   FROM retail_sales
where category is null

 select *   FROM retail_sales
where quantity is null

 select *   FROM retail_sales
where price_per_unit is null

 select *   FROM retail_sales
where cogs is null

 select *   FROM retail_sales
where total_sale is null

---

 delete   FROM retail_sales
where 
TRANSACTION_ID is null
or
SALE_DATE is null
or
SALE_TIME is null
or
CUSTOMER_ID is null
or
GENDER is null 
or 
age is null 
or 
CATEGORY is null 
or 
QUANTITY is null 
or 
PRICE_PER_UNIT is null
or 
COGS is null
or 
TOTAL_SALE is null;


set sql_safe_updates =0;



-- Data Exploration

-- How many Sales we have ?
select count(*) as total_sale from retail_sales;

-- How many uniuque customers we have ?
select count(distinct(customer_id)) as total_customer 
from retail_sales;

-- How many uniuqe category we have ?
select distinct category from retail_sales;

-- Data Analysis & Business key Problems & Answers

-- My Analysis & findings
-- Q.1 write a SQL query to retrive all columns for sales made on '2022-11-05'
-- Q.2 write a SQL query to retrive all transactions where the 'clothing and the quantity 
-- Q.3 write a SQL query to calculate the total (total_sales) for each category.
-- Q.4 write a SQL query to find the average age of customers who purchased items of 'Beauty' category.
-- Q.5  write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 write a SQL query to find the total number of transcations (transaction_id) made by each gender in each category.
-- Q.7 write a SQL query to calculate the average sale for each month. find out best selling month in each year 
-- Q.8  write a SQL query to find the top 5 customers based on the highest total sales
-- Q.9 writes a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 write a SQL query to create each shift and number of orders (example morning <=12,afternoon between 12 & 17 ,evening>17)






-- Q.1 write a SQL query to retrive all columns for sales made on '2022-11-05'

SELECT *
FROM RETAIL_SALES
WHERE SALE_DATE = '2022-11-05';


-- Q.2 write a SQL query to retrive all transactions where the 'clothing and the quantity sold is more than 4 in he month of nov-2022.

SELECT *
FROM RETAIL_SALES
WHERE TRIM(LOWER(CATEGORY)) = 'CLOTHING'
AND QUANTITY> 
(SELECT IFNULL(sum(QUANTITY),0)
FROM RETAIL_SALES
WHERE CATEGORY ='CLOTHING'
AND
DATE_FORMAT(SALE_DATE , '%Y-%M') = '2022-11'
);


-- Q.3 write a SQL query to calculate the total (total_sales) for each category.

SELECT 
CATEGORY,
sum(TOTAL_SALE) AS NET_SALE,
COUNT(*) AS TOTAL_ORDERS
FROM RETAIL_SALES
GROUP BY 1

-- Q.4 	write a SQL query to find the average age of customers who purchased items of 'Beauty' category.

SELECT 
ROUND(AVG(AGE),2) AS AVG_AGE
FROM RETAIL_SALES
WHERE CATEGORY ='BEAUTY'

-- Q.5 write a SQL query to find all transactions where the total_sale is greater than 1000.

select *
FROM RETAIL_SALES
WHERE TOTAL_SALE >1000;

-- Q.6 write a SQL query to find the total number of transcations (transaction_id) made by each gender in each category.

SELECT GENDER , CATEGORY , COUNT(Transaction_id) 
FROM RETAIL_SALES
GROUP BY  1
 , 2
ORDER BY 2

-- Q.7 write a SQL query to calculate the average sale for each month. find out best selling month in each year 

SELECT  
   EXTRACT( YEAR FROM SALE_DATE)  AS YEAR,
     EXTRACT( MONTH FROM SALE_DATE) AS MONTH,
     AVG(TOTAL_SALE)  AS AVG_SALE,
      RANK() OVER(PARTITION BY EXTRACT( YEAR FROM SALE_DATE)  ORDER BY AVG(TOTAL_SALE)  DESC)
      FROM RETAIL_SALES
        GROUP BY 1 , 2
          ORDER BY 2,3
 

-- Q.8 write a SQL query to find the top 5 customers based on the highest total sales

SELECT
    CUSTOMER_ID, 
 SUM(TOTAL_SALE)
FROM RETAIL_SALES
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


-- Q.9 writes a SQL query to find the number of unique customers who purchased items from each category.

SELECT
    CATEGORY, 
COUNT(  DISTINCT CUSTOMER_ID) AS DISTINCT_CUSTOMER
FROM RETAIL_SALES
GROUP BY 1

-- Q.10 write a SQL query to create each shift and number of orders (example morning <=12,afternoon between 12 & 17 ,evening>17)


WITH HOURLY_SALE
AS
(
SELECT *,
CASE
WHEN EXTRACT(HOUR FROM  SALE_TIME)<12 THEN 'MORNING'  
WHEN  EXTRACT(HOUR FROM  SALE_TIME) BETWEEN 12 AND 17 THEN 'AFTERNOON'
ELSE 'EVENING'
END AS SHIFT
FROM RETAIL_SALES
)
SELECT
   SHIFT,
   COUNT(*) AS TOTAL_ORDERS
FROM HOURLY_SALE
GROUP BY SHIFT