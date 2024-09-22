CREATE VIEW [InvoiceDetails] AS

--Have the 'book prices' for the Transaction Details
WITH TransactionDetailBookPrices AS (
    SELECT TD.[Sale_ID], B.[ISBN], B.[Title], B.[Genre], B.[Price], TD.[Number_of_items]
    FROM TransactionDetails TD
    LEFT JOIN Books B
        on TD.ISBN = B.ISBN
),

--Adding the 'transaction dates' to TransactionDetailBookPrices
TransactionsInfo AS (
    SELECT T.[User_ID], T.[Sale_ID], T.[Transaction_date], BP.[ISBN], BP.[Title], BP.[Genre], BP.[Price], BP.[Number_of_items]
    FROM Transactions T
  	LEFT JOIN TransactionDetailBookPrices BP
        ON T.Sale_ID = BP.Sale_ID
),

--Have the discount percentages by adding the CompleteDiscountView to TransactionsInfo
DiscountedTransactions AS (
    SELECT TI.[User_ID], TI.[Sale_ID], TI.[Transaction_date], TI.[ISBN], TI.[Title], TI.[Genre], TI.[Number_of_items], TI.[Price],
        (TI.[Number_of_items] * TI.[Price]) AS Subtotal_by_title,
        DD.[Discount_pct], ROUND((1-DD.[Discount_pct]/100)*Price,2) AS Lowered_price
    FROM TransactionsInfo TI
    LEFT JOIN CompleteDiscountView DD
        ON TI.[ISBN] = DD.[ISBN]
    WHERE TI.[Transaction_date] BETWEEN DD.[Start_date] AND DD.[End_date]
)

SELECT *,
    Number_of_items * Lowered_price AS Total_by_title
FROM DiscountedTransactions
ORDER BY User_ID, Transaction_date DESC, Sale_ID, Number_of_items DESC, Discount_pct DESC, Title
--WHERE USER_ID = 111 --This gets selected by the user_id looking at their purchase history
;