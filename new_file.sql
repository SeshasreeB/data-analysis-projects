SELECT TOP 1000
    *
FROM BooksDB.dbo.books
SELECT COUNT (title) AS TOTAL_TITLE
FROM BooksDB.dbo.books
SELECT COUNT(*) AS number_of_books
FROM BooksDB.dbo.books
WHERE original_publication_year<1800
SELECT DISTINCT authors
FROM BooksDB.dbo.books
SELECT COUNT(books_count) AS english_book_count
FROM BooksDB.dbo.books
WHERE language_code ='en-' or language_code = 'eng'
SELECT COUNT(*) original_title_WW1
from BooksDB.dbo.books
where original_publication_year BETWEEN 1914 AND 1921
SELECT TOP 1000
    *
FROM BooksDB.DBO.book_tags
ORDER BY tag_id
SELECT tag_id, COUNT( goodreads_book_id)
FROM BooksDB.DBO.book_tags
GROUP BY tag_id
SELECT TOP 1000
    *
FROM BooksDB.dbo.ratings
ORDER BY rating DESC
SELECT COUNT(USER_ID) AS users_low_rating
FROM BooksDB.dbo.ratings
WHERE rating<2
SELECT COUNT(*) AS BOOK_HIGH_RATING
FROM BooksDB.dbo.ratings
WHERE rating>=4
SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name LIKE '%mystery%'
-- SELECT *
-- FROM BooksDB.dbo.tags
-- WHERE tag_name < 'd' AND tag_name >= 'c';
--  Returns all tag_names before alphabet 'd' and anything that starts as 'c' or after
SELECT user_id, count(book_id) AS Total_books_to_read
FROM BooksDB.dbo.to_read
GROUP BY [user_id]
ORDER BY [user_id] ASC
SELECT user_id, count(book_id) AS Total_books_to_read
FROM BooksDB.dbo.to_read
GROUP BY[user_id]
ORDER BY Total_books_to_read DESC
