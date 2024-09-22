CREATE VIEW [Invoices] AS
SELECT User_ID,
    Sale_ID,
    Transaction_date,
    SUM(Price * Number_of_items) AS Subtotal,
    SUM((Price - Lowered_price) * Number_of_items) AS Total_discount,
    SUM(Lowered_price * Number_of_items) AS Total_sale
FROM InvoiceDetails 
GROUP BY User_id, Sale_ID, Transaction_date
ORDER BY User_ID, Transaction_date DESC, Total_sale, Sale_ID
--WHERE USER_ID = 111 --This gets selected by the user_id looking at their purchase history
;