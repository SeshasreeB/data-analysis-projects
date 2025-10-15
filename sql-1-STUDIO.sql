Use BooksDB
SELECT TOP 100
    authors, book_id, title, average_rating AS STAR
FROM books
ORDER BY average_rating DESC
--adding a new column
SELECT original_title , ratings_count
FROM BooksDB.dbo.books
order by ratings_count
--least popular(Meu Pé de Laranja Lima)
SELECT top 1
    tag_id, count
FROM book_tags
order by count desc
SELECT count , tag_id
FROM book_tags
--30574
SELECT tag_name AS TagName
FROM tags
where tag_id =30574
--to read
select COUNT(*) AS countOfBooks_2000_Decade
from books
where original_publication_year between 2000 AND 2010
--3594
select COUNT(original_title) AS count_with_happy
FROM books
where original_title LIKE '%happy%'
SELECT TOP 3
    authors , book_id, title, average_rating
from books
ORDER BY average_rating DESC, authors DESC
SELECT title, authors, average_rating, book_id
FROM books
Where authors IN('Bill Watterson','J.K.Rowling','Brandon Sanderson')
ORDER BY average_rating DESC,authors DESC
select count(authors) AS authors_count
from books
WHERE authors BETWEEN 'rock' AND 'roll'
select authors, average_rating , title
from books
order by average_rating ASC
select count(*) AS count_books, authors
from books
group by authors
order by count_books DESC--Stephen King
select TOP 5
    original_publication_year, title, average_rating
from books
where original_publication_year=2000
order by average_rating desc
SELECT RTRIM('Too many trailing spaces.     ');
SELECT LTRIM('         Leading spaces');
SELECT LEFT('hello there!', 7);
SELECT RIGHT('hello there!', 7);
SELECT LEN('hello there!'')
SELECT DATALENGTH('hello there!  ')
SELECT CHARINDEX('log', 'catalogue');
SELECT SUBSTRING('Strings are fun!', 4, 9);
SELECT REVERSE('Data Analysis');
SELECT UPPER('taco');
SELECT LOWER('tACO');
SELECT REPLACE('Beach Streat', 'ea', 'ee');
SELECT CONCAT('Alyce','Cat', 'Frey');
SELECT CONCAT('Alyce', NULL, 'Frey');
SELECT CONCAT_WS(' =::= ',  'Alyce', 'Frey');
SELECT CONCAT_WS('  -  ',  'Alyce', NULL, 'Frey');
SELECT STUFF('Pumpkin Pie', 3, 0, 'Add Chars');
SELECT STUFF('Pumpkin Pie', 3, 1, 'Add Chars');
SELECT STUFF('Pumpkin Pie', 3, 5, 'Delete Chars');
SELECT GETDATE();
SELECT SYSDATETIME();
SELECT DATEADD(month, 1, '20220224');
-- calculate and return the difference of a date part between end date and start date
SELECT DATEDIFF(day, '2022-11-13', '2022-12-12');
SELECT DATEDIFF(month, '2022-11-13', '2022-12-12');
-- calculate and return the difference of a date part between end date and start date
SELECT DATEDIFF(year, '1984-11-13', '2022-12-12');
--Returns a string representing the desired date part by selecting either a day, month, or year.
SELECT DATENAME(month, '2022-07-25');
SELECT DATENAME(day, '2022-07-25');
SELECT DATENAME(year, '2022-07-25');

-- returns an integer representing the desired date part by selecting either a day, month, or year.
SELECT DATEPART(day, '2022-08-21');
SELECT DATEPART(month, '2022-08-21');
SELECT DATEPART(year, '2022-08-21');

You are also able to simply select a specific DAY, MONTH, or YEAR, returning an integer based value.

SELECT DAY('2022-08-21');
SELECT MONTH('2022-08-21');
SELECT YEAR('2022-08-21');
SELECT CONVERT(varchar, GETDATE());
-- requesting the format of day, month, year. Since the time is not requested, it is not returned.
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy');
SELECT FORMAT(GETDATE(), 'MM/dd/yyyy');

SELECT FORMAT(GETDATE(), 'hh:mm');

SELECT SUM(ratings_2) FROM BooksDB.DBO.books
SELECT MAX(ratings_2) FROM BooksDB.DBO.books
SELECT MIN(ratings_2) FROM BooksDB.DBO.books

SELECT  TOP 5 title, isbn, original_publication_year
FROM BooksDB.dbo.books
WHERE isbn IS NOT NULL AND original_publication_year IS NOT NULL;

SELECT title, original_title,authors
FROM BooksDB.dbo.books
WHERE authors LIKE 'Sophocles%' AND original_title IS NOT NULL;

SELECT original_title,title,authors, ISNULL(original_title, title) AS UpdatedOriginalTitle
FROM BooksDB.dbo.books
WHERE authors LIKE 'Sophocles%';

SELECT COALESCE(NULL, 'cat', 'bird');
SELECT COALESCE('cat', NULL, 'bird');
***********************************************************************************
selects title if original_title is NULL
SELECT COALESCE(original_title, title) + ' by ' + authors AS 'Reading List'
FROM BooksDB.dbo.books
WHERE authors LIKE 'Sophocles%';
USE RideShareDB

SELECT RIGHT(Base_Name, 3) AS last_3_Base_Name,Base_Name FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015;
SELECT Number_of_Trips,Number_of_Vehicles FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015;
select charindex(' ', Number_of_Trips) AS Location_of_Spaces,Number_of_Trips,Number_of_Vehicles,charindex(' ', Number_of_Vehicles) AS Location_in_Vehicles FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015;
Select Pick_Up_Date FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
SELECT DATENAME(month,Pick_UP_Date) AS Month_Of_Pick_Up_Date FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015 ORDER BY  Pick_UP_Date DESC
SELECT charindex(' ', Pick_UP_Date) as SPACES_Pick_UP_Date FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
SELECT DAY(Pick_Up_Date) AS Day_Number, DATENAME(month,Pick_UP_Date) AS Month_Of_Pick_Up_Date FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015 ORDER BY  Day_Number ASC
SELECT MAX(start_lng) AS Most_Easterly_lyftPickUp FROM RideShareDB.dbo.LYFT
SELECT CONCAT_WS(':',base_number,base_name) AS Concat_Number_name FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015;

-- STUDIO***************************************************************************************************************
-- select len(title) AS longest_title , original_title FROM BooksDB.dbo.books  ORDER BY longest_title desc
-- SELECT title AS longest_title FROM BooksDB.dbo.books where len(title)=186

-- SELECT MIN(LEN(AUTHORS)) AS LENGHTH_OF_AUTHORS,AUTHORS FROM BooksDB.dbo.books GROUP BY AUTHORS order by LENGHTH_OF_AUTHORS ASC
-- SELECT authors,LEN(AUTHORS) AS LENGHTH_OF_AUTHORS FROM BooksDB.dbo.books order by LENGHTH_OF_AUTHORS ASC

-- SELECT AUTHORS AS SHORTEST_AUTHORS_NAME FROM BooksDB.dbo.books where len(AUTHORS)=3

-- 3. How many titles contain the word "The"?  
-- A. Is there a difference between the number of titles that use "The" or "the"?
-- SELECT Count(title) AS count_title
-- FROM BooksDB.dbo.books
-- WHERE title LIKE 'The %' OR title LIKE '% the %'

-- SELECT Count(DISTINCT(authors)) AS authors_z
-- FROM BooksDB.dbo.books
-- WHERE authors LIKE 'z%' group by authors

-- SELECT authors
-- FROM BooksDB.dbo.books
-- WHERE authors LIKE 'z%' 

-- 5. How many books have been identified as printed in a language other than English?
--   There are four language codes for English: 'en', 'eng', 'en-US', and 'en-UK'. 
--    Use LEFT to answer the question.  (Do not use the wildcard)
-- SELECT COUNT(*) AS Books_NotEnglish
-- FROM BooksDB.dbo.books WHERE language_code <> LEFT('EN')
-- SELECT COUNT(*) AS BOOKS_NOT_ENG FROM BooksDB.dbo.books
--  WHERE LEFT(LANGUAGE_CODE ,2) !='en'

-- 6. Retry question 5 using SUBSTRING.
-- SELECT COUNT(*) AS BOOKS_NOT_ENG FROM BooksDB.dbo.books
--  WHERE SUBSTRING(LANGUAGE_CODE ,1,2) !='en'
-- SELECT COUNT(SUBSTRING(LANGUAGE_CODE,1,5)) AS  BOOKS_NOTENG FROM BooksDB.dbo.books  
-- WHERE (LANGUAGE_CODE <>'EN' AND LANGUAGE_CODE <>'eng' AND LANGUAGE_CODE <> 'EN-US' AND LANGUAGE_CODE <>'EN-UK')
-- 7.  Create a column that returns the title, authors, and language codes.
-- Concatenate these elements so that they return in the following way: title by authors in language_code language.
-- A.  Check each selected column to see where any values are NULL.  Did any of the columns contain NULL values?  If so, which one?
-- SELECT CONCAT(title,' by ', authors, ' in ',language_code) AS title_authors_langCode FROM BooksDB.dbo.books 
-- select count(*) FROM BooksDB.dbo.books where title IS NULL
-- select count(*) FROM BooksDB.dbo.books where authors IS NULL
-- select title FROM BooksDB.dbo.books where title IS NULL
-- select language_code FROM BooksDB.dbo.books where language_code IS NULL
-- select count(*) FROM BooksDB.dbo.books where language_code IS NULL
-- language code contained NULL

-- 8.Update the query in question 7 using COALESCE to change the language code values from NULL to 'unknown'.
-- A.  Has this changed the language_code  where the values are NULL?

-- SELECT COALESCE(NULL, 'cat', 'bird');
-- SELECT COALESCE('cat', NULL, 'bird');
-- SELECT COALESCE title + ' by ' + authors + 'in' + language_code AS 'Reading List'
-- FROM BooksDB.dbo.books
-- SELECT title + ' by ' + authors + ' in ' + COALESCE(language_code,'unknown') AS 'Reading List'
-- FROM BooksDB.dbo.books
-- YES
-- SELECT title + ' by ' + authors + ' in ' + ISNULL(language_code,'unknown') AS 'Reading List'
-- FROM BooksDB.dbo.books