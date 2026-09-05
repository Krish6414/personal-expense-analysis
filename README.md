# Personal Expense Analysis

## 📌 Project Overview

Personal Expense Analysis is a data analytics project that analyzes personal income and expenses to understand spending patterns, savings, monthly trends, and payment methods.

The project uses **Python, SQL, and Power BI** to perform data cleaning, analysis, and visualization.

The dataset contains **500 financial transactions** covering income and expenses across different categories and months.

---

## 🎯 Objectives

The main objectives of this project are:

- Analyze total income and expenses
- Calculate total savings and savings rate
- Identify the highest spending categories
- Analyze monthly spending trends
- Identify the most frequently used payment methods
- Find the highest individual expenses
- Understand spending patterns
- Build an interactive dashboard for financial monitoring

---

## 🛠️ Technologies Used

- **Python** – Data generation, cleaning, analysis, and visualization
- **Pandas** – Data manipulation
- **NumPy** – Numerical operations
- **Matplotlib** – Data visualization
- **MySQL** – SQL-based data analysis
- **Power BI** – Interactive dashboard
- **Git & GitHub** – Version control and project management

---

## 📂 Project Structure


personal-expense-analysis/
│
├── data/
│   └── expenses_cleaned.csv
│
├── python/
│   └── expense-analysis.ipynb
│
├── sql/
│   └── expense_analysis.sql
│
├── powerbi/
│   └── expense_dashboard.pbix
│
├── .gitignore
└── README.md

---

##📊 Dataset

The dataset contains 500 transactions with the following columns:
| Column         | Description                     |
| -------------- | ------------------------------- |
| Transaction_ID | Unique transaction identifier   |
| Date           | Date of transaction             |
| Category       | Expense or income category      |
| Description    | Description of the transaction  |
| Payment_Method | Method used for the transaction |
| Amount         | Transaction amount              |
| Type           | Income or Expense               |
| Month          | Month of the transaction        |

---

##Categories

Food
Transport
Shopping
Bills
Entertainment
Healthcare
Education
Rent
Travel
Other
Salary


##Payment Methods
UPI
Credit Card
Debit Card
Cash
Bank Transfer

---

##🔄 Project Workflow
Data Generation
       ↓
Data Cleaning using Python
       ↓
Exploratory Data Analysis
       ↓
CSV Dataset
       ↓
MySQL Database
       ↓
SQL Analysis
       ↓
Power BI Dashboard
       ↓
Business Insights

---

##🐍 Python Data Analysis

Python was used as the first stage of the analytics workflow.

Tasks performed using Python
Generated the financial transaction dataset
Checked the structure of the dataset
Checked missing values
Checked duplicate records
Converted data types
Created the Month column
Cleaned transaction data
Analyzed income and expenses
Analyzed spending by category
Analyzed spending by payment method
Analyzed monthly trends
Identified high-value transactions
Created visualizations
Data Quality Checks

---

##The cleaned dataset was validated for:

Missing values
Duplicate transactions
Incorrect data types
Invalid amounts
Date formatting

---

##The final dataset contains:

Rows    : 500
Columns : 8

---

##🗄️ MySQL & SQL Analysis

What is the total income?
What is the total expense?
What is the total savings?
What is the average expense?
Which category has the highest spending?
What is the highest individual expense?
What are the top 10 expenses?
Which month has the highest expenses?
Which month has the highest savings?
Which payment method is used most frequently?
How many transactions are present in each category?
What are the monthly transaction counts?
How much is spent on food?
Which expenses are above the average expense?
Are there any data-quality issues?

---

##📈 Power BI Dashboard

The cleaned dataset was imported into Power BI to create an interactive financial dashboard.

Dashboard KPIs

The dashboard contains the following key performance indicators:

Total Income
Total Expenses
Total Savings
Savings Rate
Dashboard Visualizations
1. Monthly Income vs Expenses

Shows how income and expenses change over time.

2. Expense by Category

Shows which categories contribute the most to total spending.

3. Expenses by Payment Method

Shows spending based on UPI, credit card, debit card, cash, and bank transfer.

4. Monthly Savings Trend

Shows how savings change from month to month.

---

##📐 Power BI DAX Measures
Total Income
Total Income =
CALCULATE(
    SUM(expenses_cleaned[Amount]),
    expenses_cleaned[Type] = "Income"
)
Total Expenses
Total Expenses =
CALCULATE(
    SUM(expenses_cleaned[Amount]),
    expenses_cleaned[Type] = "Expense"
)
Total Savings
Total Savings =
[Total Income] - [Total Expenses]
Savings Rate
Savings Rate =
DIVIDE(
    [Total Savings],
    [Total Income],
    0
)

---

##💡 Key Insights

The analysis provides insights into:

Overall income and expense levels
Total savings performance
Monthly spending patterns
Highest-spending categories
Payment method usage
High-value transactions
Monthly savings trends
Areas where spending could potentially be reduced

---

📌## Business Value

This project demonstrates how data analytics can be used to convert raw financial transaction data into actionable insights.

The project follows a complete analytics workflow:

Data → Cleaning → Analysis → SQL → Visualization → Insights

Using multiple tools demonstrates practical knowledge of:

Data cleaning
Exploratory data analysis
SQL
Data visualization
Dashboard development
Business analysis
Data-driven decision making

----

##🚀 Future Improvements

The project can be extended with:

Monthly budget tracking
Budget vs actual spending
Category-wise budgets
Spending alerts
Expense forecasting
Automated data updates
Financial trend prediction
Interactive filters and slicers
Automated expense tracking application
