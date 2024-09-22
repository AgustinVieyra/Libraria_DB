CREATE VIEW [BookTranslationOrOriginal] AS
WITH BooksWithLanguageNames AS (
    SELECT *
    FROM Books B
    LEFT JOIN Languages L
        ON B.Original_language_ID = L.Language_ID
)

SELECT 
    B.ISBN,
    COALESCE(T.Translated_title, B.Title) Title,
    Author,
    Edition,
    COALESCE(T.Translated_genre,B.Genre) Genre,
    COALESCE(T.Translated_description,B.description) Description,
    L.Language_name Translated_language,
    B.Language_name Original_language,
    Price
FROM BooksWithLanguageNames B
    LEFT JOIN (BookTranslations T
        LEFT JOIN Languages L
        ON T.Language_ID = L.Language_ID)
    ON B.ISBN = T.ISBN
--WHERE T.Language_ID = 'ESP' ----This gets selected by the user looking for a specific language translation
;