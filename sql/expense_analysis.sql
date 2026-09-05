-- Personal Expense Analysis
-- SQL Analysis Script
-- Dataset: 500 personal expense transactions
-- Database: personal_expense_analysis

CREATE DATABASE IF NOT EXISTS personal_expense_analysis;
USE personal_expense_analysis;

-- =====================================================
-- 1. Check table structure
-- =====================================================

DESCRIBE expenses;

-- =====================================================
-- 2. Check total number of transactions
-- =====================================================

SELECT COUNT(*) AS Total_Transactions
FROM expenses;

-- =====================================================
-- 3. Check Income vs Expense transactions
-- =====================================================

SELECT
    Type,
    COUNT(*) AS Transaction_Count,
    SUM(Amount) AS Total_Amount
FROM expenses
GROUP BY Type
ORDER BY Total_Amount DESC;

-- =====================================================
-- 4. Total Income
-- =====================================================

SELECT
    SUM(Amount) AS Total_Income
FROM expenses
WHERE Type = 'Income';

-- =====================================================
-- 5. Total Expenses
-- =====================================================

SELECT
    SUM(Amount) AS Total_Expenses
FROM expenses
WHERE Type = 'Expense';

-- =====================================================
-- 6. Total Savings
-- =====================================================

SELECT
    SUM(CASE
        WHEN Type = 'Income' THEN Amount
        ELSE 0
    END)
    -
    SUM(CASE
        WHEN Type = 'Expense' THEN Amount
        ELSE 0
    END) AS Total_Savings
FROM expenses;

-- =====================================================
-- 7. Savings Rate
-- =====================================================

SELECT
    ROUND(
        (
            SUM(CASE WHEN Type = 'Income' THEN Amount ELSE 0 END)
            -
            SUM(CASE WHEN Type = 'Expense' THEN Amount ELSE 0 END)
        )
        /
        NULLIF(
            SUM(CASE WHEN Type = 'Income' THEN Amount ELSE 0 END),
            0
        ) * 100,
        2
    ) AS Savings_Rate_Percentage
FROM expenses;

-- =====================================================
-- 8. Category-wise Expense Analysis
-- =====================================================

SELECT
    Category,
    ROUND(SUM(Amount), 2) AS Total_Expense
FROM expenses
WHERE Type = 'Expense'
GROUP BY Category
ORDER BY Total_Expense DESC;

-- =====================================================
-- 9. Highest Spending Category
-- =====================================================

SELECT
    Category,
    ROUND(SUM(Amount), 2) AS Total_Expense
FROM expenses
WHERE Type = 'Expense'
GROUP BY Category
ORDER BY Total_Expense DESC
LIMIT 1;

-- =====================================================
-- 10. Category-wise Expense Percentage
-- =====================================================

SELECT
    Category,
    ROUND(SUM(Amount), 2) AS Total_Expense,
    ROUND(
        SUM(Amount) /
        (
            SELECT SUM(Amount)
            FROM expenses
            WHERE Type = 'Expense'
        ) * 100,
        2
    ) AS Expense_Percentage
FROM expenses
WHERE Type = 'Expense'
GROUP BY Category
ORDER BY Total_Expense DESC;

-- =====================================================
-- 11. Average Expense per Transaction
-- =====================================================

SELECT
    ROUND(AVG(Amount), 2) AS Average_Expense
FROM expenses
WHERE Type = 'Expense';

-- =====================================================
-- 12. Highest Individual Expense
-- =====================================================

SELECT
    Transaction_ID,
    Date,
    Category,
    Description,
    Payment_Method,
    Amount
FROM expenses
WHERE Type = 'Expense'
ORDER BY Amount DESC
LIMIT 1;

-- =====================================================
-- 13. Top 10 Individual Expenses
-- =====================================================

SELECT
    Transaction_ID,
    Date,
    Category,
    Description,
    Payment_Method,
    Amount
FROM expenses
WHERE Type = 'Expense'
ORDER BY Amount DESC
LIMIT 10;

-- =====================================================
-- 14. Monthly Expense Analysis
-- =====================================================

SELECT
    Month,
    ROUND(SUM(Amount), 2) AS Monthly_Expense
FROM expenses
WHERE Type = 'Expense'
GROUP BY Month
ORDER BY Month;

-- =====================================================
-- 15. Monthly Income Analysis
-- =====================================================

SELECT
    Month,
    ROUND(SUM(Amount), 2) AS Monthly_Income
FROM expenses
WHERE Type = 'Income'
GROUP BY Month
ORDER BY Month;

-- =====================================================
-- 16. Monthly Income, Expenses and Savings
-- =====================================================

SELECT
    Month,

    ROUND(
        SUM(CASE
            WHEN Type = 'Income' THEN Amount
            ELSE 0
        END),
        2
    ) AS Income,

    ROUND(
        SUM(CASE
            WHEN Type = 'Expense' THEN Amount
            ELSE 0
        END),
        2
    ) AS Expense,

    ROUND(
        SUM(CASE
            WHEN Type = 'Income' THEN Amount
            ELSE 0
        END)
        -
        SUM(CASE
            WHEN Type = 'Expense' THEN Amount
            ELSE 0
        END),
        2
    ) AS Savings

FROM expenses
GROUP BY Month
ORDER BY Month;

-- =====================================================
-- 17. Highest Expense Month
-- =====================================================

SELECT
    Month,
    ROUND(SUM(Amount), 2) AS Total_Expense
FROM expenses
WHERE Type = 'Expense'
GROUP BY Month
ORDER BY Total_Expense DESC
LIMIT 1;

-- =====================================================
-- 18. Highest Savings Month
-- =====================================================

SELECT
    Month,

    ROUND(
        SUM(CASE
            WHEN Type = 'Income' THEN Amount
            ELSE 0
        END)
        -
        SUM(CASE
            WHEN Type = 'Expense' THEN Amount
            ELSE 0
        END),
        2
    ) AS Savings

FROM expenses
GROUP BY Month
ORDER BY Savings DESC
LIMIT 1;

-- =====================================================
-- 19. Payment Method Analysis
-- =====================================================

SELECT
    Payment_Method,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Amount), 2) AS Total_Expense
FROM expenses
WHERE Type = 'Expense'
GROUP BY Payment_Method
ORDER BY Total_Expense DESC;

-- =====================================================
-- 20. Most Frequently Used Payment Method
-- =====================================================

SELECT
    Payment_Method,
    COUNT(*) AS Transaction_Count
FROM expenses
WHERE Type = 'Expense'
GROUP BY Payment_Method
ORDER BY Transaction_Count DESC
LIMIT 1;

-- =====================================================
-- 21. Expense Count by Category
-- =====================================================

SELECT
    Category,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Amount), 2) AS Total_Expense
FROM expenses
WHERE Type = 'Expense'
GROUP BY Category
ORDER BY Total_Expense DESC;

-- =====================================================
-- 22. Monthly Transaction Count
-- =====================================================

SELECT
    Month,
    COUNT(*) AS Transaction_Count
FROM expenses
GROUP BY Month
ORDER BY Month;

-- =====================================================
-- 23. Food Spending
-- =====================================================

SELECT
    ROUND(SUM(Amount), 2) AS Food_Expense
FROM expenses
WHERE Type = 'Expense'
  AND Category = 'Food';

-- =====================================================
-- 24. Expenses Above Average
-- =====================================================

SELECT
    Transaction_ID,
    Date,
    Category,
    Description,
    Amount
FROM expenses
WHERE Type = 'Expense'
  AND Amount > (
      SELECT AVG(Amount)
      FROM expenses
      WHERE Type = 'Expense'
  )
ORDER BY Amount DESC;

-- =====================================================
-- 25. Final Data Quality Check
-- =====================================================

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Transaction_ID) AS Unique_Transaction_IDs,
    SUM(CASE WHEN Transaction_ID IS NULL THEN 1 ELSE 0 END) AS Missing_IDs,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Dates,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Missing_Categories,
    SUM(CASE WHEN Amount IS NULL THEN 1 ELSE 0 END) AS Missing_Amounts
FROM expenses;
