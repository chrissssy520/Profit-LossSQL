SELECT * FROM profit_loss;

-- ============================================
-- Profit & Loss Analysis by Region and Year
-- ============================================

WITH total AS (
    -- Aggregate actual figures into three P&L buckets:
    -- Revenue, Cost of Goods Sold, and Operating Expenses
    SELECT 
        Financial_year, 
        Region,
        ROUND(SUM(CASE WHEN Account_Group = "Revenue" THEN Actual ELSE 0 END), 2)             AS total_revenue,
        ROUND(SUM(CASE WHEN Account_Group = "Cost of Goods Sold" THEN Actual ELSE 0 END), 2)  AS total_cogs,
        ROUND(SUM(CASE WHEN Account_Group = "Expenses" THEN Actual ELSE 0 END), 2)            AS total_expenses
    FROM profit_loss
    GROUP BY Financial_year, Region
),

withGrossprofit AS (
    -- Gross Profit = Total Revenue - Cost of Goods Sold
    -- Measures profitability before operating expenses
    SELECT *,
        ROUND(total_revenue - total_cogs, 2) AS Gross_profit
    FROM total
),

withNetprofit AS (
    -- Net Profit = Gross Profit - Total Operating Expenses
    -- Represents the bottom line after all costs are deducted
    SELECT *,
        ROUND(Gross_profit - total_expenses, 2) AS Net_profit
    FROM withGrossprofit
)

-- Final output: Full P&L summary per Region and Financial Year
-- Status flags whether the business unit is Profitable or at a Loss
SELECT
    Region,
    Financial_year,
    total_revenue   AS Total_Revenue,
    total_cogs      AS Total_COGS,
    total_expenses  AS Total_Expenses,
    Gross_profit,
    Net_profit,
    CASE 
        WHEN Net_profit > 0 THEN "Profitable"
        ELSE "Loss" 
    END AS Status
FROM withNetprofit
ORDER BY Financial_year, Region;