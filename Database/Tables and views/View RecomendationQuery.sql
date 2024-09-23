CREATE VIEW [RecomendationQuery] AS
WITH
--All of the CTE's bellow are filtered by a specific User_ID, selected here
VariableDeclaration AS (
  SELECT 1 as Selected_User_ID --User defined by the query we are making
),

--Making a list of the books (by their primary key) that shouldn't be recomended, as they have already been purchased by the User
ISBNsOfAlreadyPurchasedBooks AS (
	SELECT ISBN
	FROM VariableDeclaration, Transactions T
	LEFT JOIN TransactionDetails TD
		ON T.Sale_ID = TD.Sale_ID
	WHERE T.User_ID = Selected_User_ID --User defined by the query we are making
),

--Making the count of the books purchased by each genre (by a single user)
FavouriteGenres AS (
    SELECT T.User_ID, B.Genre, SUM(TD.Number_of_items) Total_books_by_genre
    FROM VariableDeclaration, Transactions T
    LEFT JOIN (TransactionDetails TD
    	       left join Books B
               ON TD.ISBN = B.ISBN)
        ON T.Sale_ID = TD.Sale_ID
    WHERE T.User_ID = Selected_User_ID --User defined by the query we are making
    GROUP BY T.User_ID, B.Genre
    ORDER BY Total_books_by_genre DESC
),

--Make the count of the books purchased by a single user
TotalBooksPurchasedByUser AS (
    SELECT SUM(number_of_items) Total_books_purchased
	FROM VariableDeclaration, Transactions T
	LEFT JOIN TransactionDetails TD
		ON T.Sale_ID = TD.Sale_ID
    WHERE T.User_ID = Selected_User_ID --User defined by the query we are making
)

SELECT B.*, 
	AVG(Five_star_score) Avg_score, IFNULL(100*G.Total_books_by_genre/TB.Total_books_purchased,0) Perc_of_genre_read_by_user
FROM TotalBooksPurchasedByUser TB, Reviews R
LEFT JOIN (Books B
           LEFT JOIN FavouriteGenres G
                ON G.Genre = B.Genre
          )
	ON B.ISBN = R.ISBN
WHERE B.ISBN NOT IN (SELECT * FROM ISBNsOfAlreadyPurchasedBooks)
GROUP BY B.ISBN
--The crux of the recomendation is getting the average score and the percentage of the genres read by user:
ORDER BY Avg_score DESC, Perc_of_genre_read_by_user DESC, Price DESC
LIMIT 3;