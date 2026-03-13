📊 Profit & Loss Analysis — SQL Project
A SQL project that analyzes a company's Profit & Loss (P&L) statement across multiple regions and financial years using Common Table Expressions (CTEs).

📁 Dataset
ColumnDescriptionRegionGeographic region (e.g., Asia Pacific, Europe)Financial_YearFiscal year (e.g., 2019/20)Account_GroupCategory: Revenue, Cost of Goods Sold, or ExpensesAccountSpecific account (e.g., Export Sales, COGS, Staff)ActualActual amount recordedBudgetBudgeted amount

🎯 Objective
Calculate the full P&L summary per Region and Financial Year:

Total Revenue
Total Cost of Goods Sold (COGS)
Total Operating Expenses
Gross Profit = Revenue − COGS
Net Profit = Gross Profit − Expenses
Status = Profitable or Loss


🧠 SQL Concepts Used

WITH — Common Table Expressions (CTEs)
CASE WHEN — Conditional aggregation
SUM() + ROUND() — Aggregation and formatting
GROUP BY — Grouping by Region and Financial Year
ORDER BY — Sorting output for readability
