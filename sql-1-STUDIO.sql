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