CREATE VIEW [SalesByGenreLastTwoMonths] AS
SELECT Genre, STRFTIME('%m',Transaction_date) AS Month,
CASE
    WHEN STRFTIME('%m',Transaction_date) = STRFTIME('%m',DATE('now')) THEN 'Current_month'
    WHEN STRFTIME('%m',Transaction_date) = STRFTIME('%m',DATE('now','-1 month')) THEN 'Last_month'
END AS Month_flag,
    SUM(Number_of_items) 'Books sold', SUM(Subtotal_by_title) 'Subtotal by genre & month',
    SUM((Discount_pct/100)*Subtotal_by_title) AS 'Discounted amount', SUM(Total_by_title) 'Sales by genre & month'
FROM InvoiceDetails
WHERE Month_flag IS NOT	NULL
GROUP BY Genre, Month_flag
ORDER BY Month_flag, SUM(Number_of_items) DESC, Genre;