# 🛍️ Retail Sales Analysis Project (MySQL)

This project focuses on analyzing retail sales data using SQL. It covers data cleaning, exploration, and answers 10 business-driven analytical questions.

---

## 📂 Table: `retail_sales`

| Column Name      | Description                          |
|------------------|--------------------------------------|
| transaction_id   | Unique ID for each transaction       |
| sale_date        | Date of sale                         |
| sale_time        | Time of sale                         |
| customer_id      | Customer ID                          |
| gender           | Gender of customer                   |
| age              | Age of customer                      |
| category         | Product category                     |
| quantity         | Quantity sold                        |
| price_per_unit   | Price per product                    |
| cogs             | Cost of goods sold                   |
| total_sale       | Total amount from the transaction    |

---

## 🧹 Data Cleaning

```sql
SELECT * FROM retail_sales WHERE transaction_id IS NULL;
-- (Similar checks for all other columns...)

DELETE FROM retail_sales
WHERE 
  transaction_id IS NULL OR
  sale_date IS NULL OR
  sale_time IS NULL OR
  customer_id IS NULL OR
  gender IS NULL OR
  age IS NULL OR
  category IS NULL OR
  quantity IS NULL OR
  price_per_unit IS NULL OR
  cogs IS NULL OR
  total_sale IS NULL;

SET sql_safe_updates = 0;
