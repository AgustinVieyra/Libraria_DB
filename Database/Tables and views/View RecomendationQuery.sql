CREATE VIEW [RecomendationQuery] AS
--Takes out the books that have been already been purchased by the user
WITH PurchasedBooksByUser AS (
	SELECT ISBN
	FROM Transactions T
	LEFT JOIN TransactionDetails TD
		ON T.Sale_ID = TD.Sale_ID
	WHERE T.User_ID = '002' --User defined by the query we are making
)

SELECT B.*, AVG(Five_star_score) Avg_score
FROM Books B
RIGHT JOIN Reviews R
	ON B.ISBN = R.ISBN
WHERE B.ISBN NOT IN (SELECT * FROM PurchasedBooksByUser)
GROUP BY B.ISBN
--The crux of the recomendation is getting the Average score
ORDER BY Avg_score DESC
LIMIT 3;