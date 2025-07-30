# 🛍️ Retail Sales Analysis (MySQL Project)

This project analyzes a retail sales dataset using MySQL to extract business insights. The dataset includes transactions with customer demographics, product categories, pricing, and sales details.

---

## 📂 Table Used: `retail_sales`

| Column Name      | Description                          |
|------------------|--------------------------------------|
| transaction_id   | Unique ID for each transaction       |
| sale_date        | Date of sale                         |
| sale_time        | Time of sale                         |
| customer_id      | Unique ID of customer                |
| gender           | Gender of customer                   |
| age              | Age of customer                      |
| category         | Product category (e.g., Clothing)    |
| quantity         | Number of units sold                 |
| price_per_unit   | Price of each product unit           |
| cogs             | Cost of goods sold                   |
| total_sale       | Total amount = quantity × price/unit |

---

## 📊 Data Cleaning

- Checked for `NULL` values in each column
- Removed rows with missing values
- Used `SQL_SAFE_UPDATES = 0` to allow deletions

---

## 🔍 Data Exploration

- Total number of sales
- Count of unique customers
- Distinct product categories

---

## 💡 Business Analysis Questions Solved

| No. | Question |
|-----|----------|
| Q1  | Retrieve all sales made on `'2022-11-05'` |
| Q2  | Clothing transactions with quantity > 4 in November 2022 |
| Q3  | Total sales and order count per category |
| Q4  | Average age of customers who purchased Beauty products |
| Q5  | Transactions with total sale > 1000 |
| Q6  | Total transactions by gender and category |
| Q7  | Monthly average sale and best-selling month per year |
| Q8  | Top 5 customers based on total spending |
| Q9  | Unique customers per category |
| Q10 | Orders grouped by shift: Morning, Afternoon, Evening |

---

## 🧪 Tools Used

- MySQL
- SQL queries
- Excel/CSV for sample dataset

---

## 📂 Sample Data

A sample of the dataset is available in this repository:  
(https://github.com/sapnakaur4/Retail-sales-Analysis/blob/main/SQL%20-%20Retail%20Sales%20Analysis_utf%20.csv)
---

## 📁 Files Included

- `queries.sql` → All SQL queries used for cleaning, exploration, and analysis  
- `retail_sales_sample.csv` → Sample data  
- `README.md` → This project overview

---

## 📎 Author

**Sapna Kaur**  
_Data Analytics Enthusiast_  
[GitHub Profile](https://github.com/sapnakaur4/Retail-sales-Analysis)


