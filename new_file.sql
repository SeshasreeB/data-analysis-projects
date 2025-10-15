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
**************************************************************
SELECT UPPER(LEFT(surname, 3)), nationality, driverId
FROM formula_one.dbo.drivers;
which month has most races
select *
FROM formula_one.INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'races'

SELECT MONTH([date]) as race_month , DATENAME(month, date) AS month_name, count(*) AS num_races
FROM formula_one.dbo.races
WHERE YEAR([date])>2014
group by MONTH(date), DATENAME(month, [date])
order by num_races DESC

/*race review occur 4 days after each race, the day of the race reviews?
SELECT name AS race_name ,[date] as race_date, DATEADD(DAY,4,[date]) as review_date
FROM formula_one.dbo.races 
*/
--how can we display each race date as formatted string like "SUnday, march 28, 2021"?
/*SELECT name as race_name,
FORMAT(date, 'dddd,MMMM d, yyyy') as formatted_date
FROM formula_one.dbo.races 
ORDER BY [date]
*/
SELECT *
FROM BooksDB.dbo.books
WHERE original_title is NULL
--Create a column that has original title if it exists or title if originall title IS NULL
SELECT authors, book_id, ISNULL(original_title, title) AS original_title_refined
from BooksDB.dbo.books
--isnull can take two arguments

SELECT authors, book_id, COALESCE(original_title, title) AS original_title_refined
from BooksDB.dbo.books
