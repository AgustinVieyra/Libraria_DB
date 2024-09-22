CREATE VIEW [CompleteDiscountView] AS

--Without the DISTINCT function in this CTE, it creates a Cartesian Product for the view
WITH BoughtBooks AS (
    SELECT DISTINCT [ISBN]
    FROM TransactionDetails
)

SELECT BB.[ISBN], 
    IFNULL(D.[Discount_pct], 0) AS Discount_pct,
    COALESCE(D.[Start_date], '1970-01-01') AS Start_date,
    COALESCE(D.[End_date], DATE('now','+10 years')) AS End_date
FROM BoughtBooks BB
LEFT JOIN Discounts D
    ON D.[ISBN] = BB.[ISBN];