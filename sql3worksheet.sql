USE formula_one
--WHICH CIRCUIT EACH RACE on ACROSS ALL YEARS
--CIRCUIT TABLE CIRCUIT ID , NAME
RACES:
YEAR, NAME , CIRCUITid, DATE
SELECT TOP 5
    *
FROM formula_one.DBO.circuits
SELECT TOP 5
    *
FROM formula_one.DBO.races
/*SELECT races.name , races.[year],races.[date],circuits.name
FROM formula_one.dbo.races AS races
INNER JOIN formula_one.dbo.circuits as circuits
ON races.circuitId = circuits.circuitId
*/
--pitstop data but with race name instead of race id
--race_id, driver_id,stop, lap,time, duration, milliseconds
--races : raceid, year, name
SELECT TOP 5
    *
FROM formula_one.dbo.pit_stops
SELECT *
FROM formula_one.DBO.races AS races
    LEFT JOIN formula_one.dbo.pit_stops AS pitstop
    ON races.raceid =pitstop.raceid
WHERE pitstop.raceId IS NULL
--which circuits hosted races in 2021
--year,race_name,circuit
SELECT R.YEAR, R.NAME as RACE_NAME, CIR.NAME AS CIRCUIT_NAME
FROM formula_one.DBO.races AS R
    INNER JOIN formula_one.DBO.circuits AS CIR
    ON R.circuitId=CIR.circuitId
WHERE R.[year] = 2021
ORDER BY CIR.name

--WHO WON EACH RACE IN 2021
---FIRST AND LAST NAME OF WINNERS AND NAME OF RACE THEY WON
--NAMES FROM DRIVERS TABLE
--RACE NAME IN RACES TABLE AND POSITION IN RESULTS TABLE
SELECT r.name as race_name,
    d.forename + '' + d.surname as winner_name
FROM formula_one.dbo.results as res
    INNER JOIN formula_one.dbo.races as R
    ON res.raceId = r.raceId
    INNER JOIN formula_one.dbo.drivers as d
    on res.driverId=d.driverId
WHERE r.[year] = 2021 and res.[position] <> '/N'
---How many races has each  circuit held?
--circuit table(), and races table
select c.name as CIRCUIT_NAME,
    count(r.raceId) as total_races
from formula_one.dbo.circuits as c
    left join formula_one.dbo.races as r on c.circuitId=r.circuitId
GROUP BY c.name
order by total_races DESC
-- how many races did eac driver participate in 2021
--drivers name , results drivers ids? race id
SELECT d.forename + '' + d.surname as driver_name,
    count(res.resultID) as races_entered
from formula_one.dbo.drivers as D
    INNER JOIN formula_one.dbo.results as res
    ON d.driverId=res.driverId
    INNER JOIN formula_one.dbo.races as r on res.raceId=r.raceId
where r.[year]=2021
group by d.forename,d.surname
order by races_entered DESC
------how many races at each  circuit
SELECT c.NAME as circuit_name,
    COUNT(r.raceid) as total_races
from formula_one.dbo.circuits as C
    left join formula_one.dbo.races as R
    on c.circuitId=r.circuitId
where r.[year]>2000
group by c.name
having count(r.raceId)>5

-- Highlight popular women writers based on ratings from `BooksDB`
-- by writing a query that returns `tag_id`, the number of times each `tag_id` is used and the `tag_name`.
-- Use the `GROUP BY` and `HAVING` clause to narrow your focus and try multiple keywords, such as "woman" and "female".


USE BooksDB
select *
from dbo.books
select *
from dbo.book_tags
select *
from dbo.tags
where tag_name like '%female%' OR tag_name LIKE '%woman%'

SELECT t.tag_name, bt.tag_id, sum(bt.count) as tag_number
from dbo.book_tags as bt
    INNER JOIN dbo.tags AS t
    ON t.tag_id=bt.tag_id
GROUP BY bt.tag_id,T.tag_name
HAVING t.tag_name LIKE '%woman%'
    OR t.tag_name LIKE '%female%'
ORDER BY tag_number DESC
****************************
SELECT t.tag_name, bt.tag_id, count(bt.tag_id) as tag_number
from dbo.books as b
    INNER JOIN dbo.book_tags AS bt
    ON b.book_id=bt.goodreads_book_id
    INNER JOIN dbo.tags AS T
    on t.tag_id=bt.tag_id
GROUP BY bt.tag_id,T.tag_name
HAVING t.tag_name LIKE '%woman%'
    OR t.tag_name LIKE '%female%'
ORDER BY tag_number DESC


SELECT TOP 1
    bt.tag_id,
    SUM(bt.count) AS total_tag_count,
    t.tag_name
FROM BooksDB.dbo.book_tags AS bt
    INNER JOIN BooksDB.dbo.tags AS t
    ON bt.tag_id = t.tag_id
    INNER JOIN BooksDB.dbo.books as B
    on b.book_id =bt.goodreads_book_id
GROUP BY bt.tag_id, t.tag_name
HAVING t.tag_name LIKE '%woman%'
    OR t.tag_name LIKE '%female%'
ORDER BY total_tag_count DESC;



SELECT b.average_rating, book

-- Write a query to return authors, titles, ratings, and `tag_id` that you would want to promote during your chosen event.

select b.authors, b.title, b.average_rating, bt.tag_id, b.original_publication_year
FROM BooksDB.dbo.books as B
    INNER JOIN BooksDB.dbo.book_tags as bt on b.book_id=bt.goodreads_book_id


-- # Part 2: Choose Another Month

-- Choose another month and plan at least 2 events / promotions and answer the following questions:
-- 1. Which month did you choose?
-- 1. What 2 events / promotions are you highlighting?

--For each event write at least one query that joins any two tables in `BooksDB` to support your choice 
-- and record you thoughts as to why you used the paticlular query. At least one of your queries needs to include a `HAVING` clause.

--1. Join `annual_2016` with `series` on `series_id`. We only want the data in the `annual_2016` table to be included in the result.
USE LaborStatisticsDB
select TOP 50
    A16.*
from dbo.annual_2016 AS A16
    INNER JOIN dbo.series AS series
    ON A16.series_id=series.series_id
    INNER JOIN dbo.datatype AS dt
    ON series.data_type_code = dt.data_type_code
    INNER JOIN dbo.industry as i
    on series.industry_code=i.industry_code
ORDER BY A16.id
-- Write a query that returns the series_id, industry_code, industry_name, and value
-- from the january_2017 table but only if that value is greater than the average value for annual_2016 of data_type_code 82.
WITH
    cte_value
    AS

    (
        SELECT AVG(ann.value) as avg_value
        FROM dbo.annual_2016 AS ann
            INNER JOIN dbo.series as s2
            ON ann.series_id=s2.series_id
        WHERE data_type_code=82
    )
SELECT jan.series_id, series.industry_code, industry.industry_name, jan.[value]
FROM dbo.january_2017 as Jan
    INNER JOIN dbo.series as series
    on jan.series_id = series.series_id
    -- INNER JOIN dbo.annual_2016 AS ann
    -- ON ann.series_id=series.series_id
    INNER JOIN dbo.industry as industry
    ON series.industry_code = industry.industry_code
where jan.[value]>(select avg_value
from cte_value)
WHERE  jan.[value]>
(
    SELECT AVG(ann.value)
FROM dbo.annual_2016 AS ann
    INNER JOIN dbo.series as s2
    ON ann.series_id=s2.series_id
WHERE data_type_code=82
    )
WITH
    cte_value
    AS

    (
        SELECT AVG(ann.value)
        FROM dbo.annual_2016 AS ann
            INNER JOIN dbo.series as s2
            ON ann.series_id=s2.series_id
        WHERE data_type_code=82
    )
SELECT *
from dbo.annual_2016
where [value]=(select *
from cte_value)
select *
from dbo.annual_2016
select *
from dbo.january_2017

select *
from dbo.series
select *
from dbo.datatype
where data_type_code =82

SELECT jan.series_id, series.industry_code, industry.industry_name, jan.[value]
FROM dbo.january_2017 as Jan
    INNER JOIN dbo.series as series
    on jan.series_id = series.series_id
    INNER JOIN dbo.industry as industry
    ON series.industry_code = industry.industry_code
WHERE  jan.[value]> (
    SELECT AVG(ann.value)
FROM dbo.annual_2016 AS ann
    INNER JOIN dbo.series as s2
    ON ann.series_id=s2.series_id
WHERE data_type_code=82
    )
/*Create a Union table comparing average weekly earnings of production and nonsupervisory employees 
between annual_2016 and january_2017 using the data type 30. Round to the nearest penny. 
You should have a column for the average earnings and a column for the year, and the period.*/
    SELECT Ann_2016.[year], ROUND(AVG(Ann_2016.[value]),2)AS average_earnings, Ann_2016.[period]
    FROM annual_2016 as Ann_2016
        INNER JOIN dbo.series as s2
        ON Ann_2016.series_id=s2.series_id
    WHERE data_type_code=30
    GROUP BY Ann_2016.[year],Ann_2016.[period]
UNION
    SELECT Jan_2017.[year], ROUND(AVG(Jan_2017.[value]),2)AS average_earnings, Jan_2017.[period]
    FROM january_2017 as Jan_2017
        INNER JOIN dbo.series as s2
        ON Jan_2017.series_id=s2.series_id
    WHERE data_type_code=30
    GROUP BY Jan_2017.[year],Jan_2017.[period]

INSERT into schema_name.recipes
    (name,DESCRIPTION,instructions)
VALUES(coffee, wake-up
human,'')
UPDATE schema_name.recipes 
    SET instructions  ='Call Dominos and order for delivery'
    where recipeId=2
DELETE from schema_name.recipes 
where description ='frozen'
