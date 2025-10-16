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
SELECT Count(title) AS count_title
FROM BooksDB.dbo.books
WHERE title LIKE 'The %' OR title LIKE '% the %' or title LIKE '%The %;


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
SELECT title + ' by ' + authors + ' in ' + ISNULL(language_code,'unknown') AS 'Reading List'
FROM BooksDB.dbo.books

SELECT CONCAT(title, ' by ', authors, ' in ', ISNULL(language_code, 'unknown'), ' language') AS BookInfo
FROM BooksDb.dbo.books
SELECT CONCAT(title, ' by ', authors, ' in ', COALESCE(language_code, 'unknown' ), ' language') AS BookInfo
FROM BooksDB.dbo.books
**********************************************************************************************************
USE LaborStatisticsDB
select data_type_code,data_type_text  FROM dbo.datatype WHERE data_type_text = 'Women Employees' --10
select * from dbo.series where data_type_code=10 and series_title = 'Women Employees'
select supersector_code from dbo.supersector where supersector_name LIKE 'financial activities'--55
select * from dbo.series where supersector_code = 55 and series_title = 'women employees'
select series_id,industry_code,supersector_code,series_title from dbo.series 
where industry_code = 55522110 and supersector_code=55 and series_title = 'women employees' --CES5552211010
select industry_code from dbo.industry where industry_name like 'commercial banking' ---55522110
select * from dbo.industry
select * from dbo.series
select SUM(value) from dbo.annual_2016 where series_id IN('CES5552211010','CEU5552211010')
select  SUM(value)AS total_employees from dbo.annual_2016 --2351408916
*******************************************************************************************************************
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
ORDER BY b.average_rating;

SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
WHERE tr.user_id IS NOT NULL
ORDER BY b.average_rating;

SELECT TOP 30 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
RIGHT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id;

SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
FULL JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id WHERE books_count<30 ORDER BY average_rating DESC;

SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
ORDER BY tr.book_id;
-- **Part A:**  What is the most tagged book?

-- Start by joining the `books` and `book_tags` tables ON the `books.best_book_id` and `book_tags.goodreads_book_id`. We want the *most popular* book, so think about ordering the table in a way that will display both the book title and the number of times a book tag has been used.

-- Minimum Desired output:_  The title of the most tagged book, and the number of times the book has been tagged.
SELECT TOP 1 b.title,SUM(bt.count) as total_tags
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.book_tags AS bt
ON b.best_book_id = bt.goodreads_book_id 
group by b.title order by total_tags DESC
--Harry Potter and the Sorcerer's Stone (Harry Potter, #1)
--786374
**Part B:** How many different tags have been used for the most tagged book?

Start by joining the `books` and `book_tags` tables ON the `books.best_book_id` and `book_tags.goodreads_book_id`.
 We want to find the *most popular* tag id, so think about ordering in a way that will display the most popular tag id.

*Minimum Desired Output:* The tag id for the most popular tag used for the most tagged book.

SELECT TOP 1 SUM(bt.count) as tag_count,bt.tag_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.book_tags AS bt
ON b.best_book_id = bt.goodreads_book_id
group by bt.tag_id order by tag_count DESC
--30574
--137038053
SELECT tag_name ,tag_id from BooksDB.dbo.tags where tag_name LIKE '%christmas%' where bt.tag_id = 6967
--childrens-christmas-books
--6967

SELECT tag_name ,tag_id from BooksDB.dbo.tags
where tag_name LIKE '%halloween%'
--Alyce selected `halloween-storytime`, with a tag id of 13877.
--to-read

-- **Part B:** Now that you have the tag id, find the title that was tagged the most with this tag by joining the `books` and `books_tags` tables.

-- Alyce joined the book table with the tags table and discovered that "The Little Old Lady Who Was Not Afraid of Anything" was tagged as `halloween-storytime` the most.

-- *Minimum Desired Output:* title and tag count

-- **Your Title and Number of times the tag was used:**
SELECT b.title, count(bt.tag_id) as tag_count from BooksDb.dbo.books as b
INNER JOIN BooksDB.dbo.book_tags as bt ON b.best_book_id=bt.goodreads_book_id
 where bt.tag_id = 13877
GROUP BY  title
ORDER BY tag_count


SELECT  b.title, count(bt.tag_id) as tag_count from BooksDb.dbo.books as b
INNER JOIN BooksDB.dbo.book_tags as bt ON b.best_book_id=bt.goodreads_book_id  
where bt.tag_id = 13877
GROUP BY title
ORDER BY tag_count DESC
-- **Part B:** Organize your newly joined table in a way that groups popularity based on the title based on users.

-- *Hint:* Suggest using an alias for the aggregation you will need to run on the `user_id`

-- *Minimum Desired Output:* title and aliased column

SELECT  b.title, count(tr.USER_ID) as users from BooksDb.dbo.books as b
INNER JOIN BooksDB.dbo.to_read as tr ON b.book_id=tr.book_id  
GROUP BY title
ORDER BY users DESC
-- ## **QUESTION 8:** Largest 'To Read' Lists

-- **Part A:**  Create a query that returns a table that contains the top 10 users with the most number of titles on their 'to read' list.    Group all the entries by `user_id`.

-- _Hint:_ You might want an alias for the titles.

-- _Minimum Desired Output:_ `user_id` and your aliased column of titles.
SELECT  TOP 10 tr.USER_ID,count(b.title) as Number_Titles from BooksDb.dbo.books as b
INNER JOIN BooksDB.dbo.to_read as tr ON b.book_id=tr.book_id  
GROUP BY tr.USER_ID
ORDER BY Number_Titles DESC

**Part B:**  The longest list length is 15 titles total, and is shared by 4 different users.  Select one of the uses and print out their entire 'to read' list.
SELECT b.title from BooksDb.dbo.books as b
INNER JOIN BooksDB.dbo.to_read as tr ON b.book_id=tr.book_id 
WHERE tr.USER_ID = 14771
