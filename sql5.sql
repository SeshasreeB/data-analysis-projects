--which drivers have ever finished first?
USE formula_one
SELECT *
FROM dbo.drivers
--forename,surname,driverid
SELECT *
FROM dbo.races
--raceid,circuitid
SELECT *
from dbo.results
--resultid,raceid,driverid,position
SELECT distinct driverId
FROM results
where [position]='1'
ORDER BY driverId ASC
SELECT d.forename, d.surname, d.driverId
FROM dbo.drivers as d
WHERE d.driverId IN(
    select r.driverId
from dbo.results AS r
WHERE [position]='1'
     )
ORDER BY d.driverId ASC
--how many races has each driver entered
SELECT *
FROM dbo.pit_stops
SELECT d.forename, d.surname, d.driverId
FROM dbo.drivers as d
SELECT *
FROM dbo.races

SELECT d.forename,
    d.surname, (
SELECT COUNT(*)
    from dbo.results as r
    where r.driverId=d.driverId
)AS count_races
FROM dbo.drivers as d
--which drivers have entered atleast 50 competetions
SELECT d.forename,
    d.surname, (
SELECT COUNT(*)
    from dbo.results as r
    where r.driverId=d.driverId
)AS count_races
FROM dbo.drivers as d
where (
SELECT COUNT(*)
from dbo.results as r
where r.driverId=d.driverId
)>=50
order by count_races ASC
--which drivers have finished first atleast once?
SELECT d.forename, d.surname, d.driverId
FROM dbo.drivers as d
WHERE d.driverId IN(
    select r.driverId
from dbo.results AS r
WHERE [position]='1'
     )
ORDER BY d.driverId ASC

WITH
    winning_drivers
    AS
    (
        select DISTINCT r.driverId
        from dbo.results AS r
        WHERE [position]='1'
    )
SELECT forename, surname
from dbo.drivers
WHERE driverId IN (select driverId
from winning_drivers)
-- for each circuit,how many years has it hosted atleast one race
--info on each circuit like circuit name
select *
from dbo.circuits
 WITH circuit_years
AS
(SELECT circuitId, count(distinct[year]) as num_years_hosted
from dbo.races as r
group by circuitId)
SELECT cir.name AS circuit_name,
    cy.num_years_hosted
FROM formula_one.dbo.circuits as cir
    INNER JOIN circuit_years as cy
    ON cir.circuitId=cy.circuitId
ORDER BY cy.num_years_hosted DESC

--which drivers have score points in more than 5 races
--driver names
select *
from dbo.results
select forename, surname
from dbo.drivers
WITH driver_points
AS
(
    SELECT
    driverid,
    count(resultid) as races_with_points
FROM dbo.results
WHERE points>0
GROUP BY driverid
)
SELECT D.forename, D.surname, DRIVER_POINTS.races_with_points
FROM DBO.drivers AS D
    INNER JOIN
    DRIVER_POINTS
    ON D.driverId=driver_points.driverid
WHERE driver_points.races_with_points>5
order by races_with_points
--In January 2017, what is the average weekly hours worked by production and nonsupervisory employees across all industries?
USE LaborStatisticsDB
select *
from dbo.january_2017
where [year]=2021
SELECT *
--id, seriesid,year
select *
from dbo.annual_2016
FROM dbo.industry
--ind code, ind name,id
SELECT *
FROM dbo.[period]
--period code,MONTHSELECT * FROM dbo.industry as i
SELECT *
FROM dbo.datatype
WHERE data_type_text='Women employees'
SELECT *
FROM LaborStatisticsDB.dbo.series
--seriesid,supersector ,in code
WHERE i.industry_code IN(
SELECT s.industry_code
FROM dbo.series as s
WHERE series_title
LIKE '%Average weekly hours of production and nonsupervisory employees%'
)
SELECT *
FROM dbo.series
--seriesid,supersector,ind code series title

SELECT AVG(j.[value]) AS weekly_avg_hours
FROM dbo.january_2017 as j
WHERE j.series_id IN(
SELECT s.series_id
FROM dbo.series as s
WHERE series_title
LIKE '%Average weekly hours of production and nonsupervisory employees%'
)

SELECT SUM(j.[value]) as total_weekly_payroll
FROM dbo.january_2017 as j
    INNER JOIN dbo.series as s
    ON s.series_id =j.series_id
    INNER JOIN dbo.industry as i
    ON s.industry_code=i.industry_code
WHERE s.series_title
LIKE '%Average weekly earnings of production and nonsupervisory employees%'
GROUP BY i.industry_name
ORDER BY avg_weekly_hours
--49.6/Motor vehicle power train components
--16.85/Fitness and recreational sports centers

SELECT ROUND(SUM([value]),0) as total_employees
FROM dbo.annual_2016 as a
    INNER JOIN dbo.series as s
    ON s.series_id =a.series_id
WHERE s.series_title
LIKE '%All employees%'
    AND a.[period] ='M13'

--  For Average weekly hours → value is the number of hours per week. Example: 36.9 means 36.9 hours/week.

-- For Average weekly earnings / payroll → value is dollars per week. Example: 962.73 means $962.73/week.

-- For Number of employees → value is thousands of persons. Example: 411.29 means 411,290 employees if units are in thousands (BLS often uses that convention).   
use LaborStatisticsDB
SELECT SUM(j.[value]) as weekly_payroll_prodNonSuper
FROM dbo.january_2017 as j
    INNER JOIN dbo.series as s
    ON s.series_id =j.series_id
    INNER JOIN dbo.datatype as d
    ON s.data_type_code=d.data_type_code
WHERE d.data_type_code=82
---1838753220
SELECT SUM(j.[value]) as weekly_payroll_prodNonSuper
FROM dbo.january_2017 as j
    INNER JOIN dbo.series as s
    ON s.series_id =j.series_id
    INNER JOIN dbo.industry as i
    ON s.industry_code=i.industry_code
WHERE s.series_title
LIKE '%Aggregate weekly payrolls of production and nonsupervisory employees%'
--1839113368.8000028
SELECT SUM(a.[value]) as weekly_payroll_prodNonSuper
FROM dbo.annual_2016 as a
    INNER JOIN dbo.series as s
    ON s.series_id =a.series_id
    INNER JOIN dbo.industry as i
    ON s.industry_code=i.industry_code
WHERE s.series_title
LIKE '%Aggregate weekly payrolls of production and nonsupervisory employees%'
--903773480.9999993
----------
USE LaborStatisticsDB
select *
FROM dbo.datatype
WHERE data_type_code=6
SELECT *
from dbo.datatype
where data_type_text ='AVERAGE WEEKLY HOURS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
--7
select *
from dbo.series
where data_type_code=1
SELECT SUM(value) as total_employee_count
from dbo.annual_2016
select sum([value]) as Total_weekly_payroll_prod_Nonsup
from dbo.january_2017
WHERE series_id IN(
    select a.series_id
from dbo.series as a
WHERE a.data_type_code=82)
--2340612.2000000016


--  In January 2017, for which industry was the average weekly hours worked by production and nonsupervisory employees the highest? Which industry was the lowest?
--value in 2017, Average weekly hours of production and nonsupervisory employees, industry name

SELECT SUM(j.value) as val, i.industry_name
from dbo.january_2017 as j
    INNER JOIN dbo.series as s
    ON j.series_id=s.series_id
    inner join dbo.industry as i
    on s.industry_code=i.industry_code
where s.data_type_code = and i.industry_name is NOT NULL
GROUP BY industry_name
ORDER BY val DESC
--49.8,Motor vehicle power train components
--16.7,Fitness and recreational sports centers
select *
FROM dbo.datatype
where data_type_text='Average weekly earnings of production and nonsupervisory employees'
--data type code 7
select *
from dbo.industry
where industry_code
select *
from dbo.series
USE LaborStatisticsDB
SELECT ROUND(SUM(value),0) as total_employee_count
from dbo.annual_2016 as a
    INNER JOIN dbo.series as S
    on a.series_id=s.series_id
where s.series_title LIKE '%All employees%'
group by series_title

SELECT DISTINCT
    (   SELECT industry_name
    FROM industry as I
    WHERE i.industry_code=(
    SELECT ser.industry_code
    FROM dbo.series as ser
    WHERE ser.series_id=jan.series_id
    )
) AS industry_name, JAN.[value]
FROM dbo.january_2017 as jan
WHERE jan.series_id IN (
    SELECT ser.series_id
    from dbo.series as ser
    where ser.data_type_code =7)

    AND
    (   SELECT industry_name
    FROM industry as I
    WHERE i.industry_code=(
    SELECT ser.industry_code
    FROM dbo.series as ser
    WHERE ser.series_id=jan.series_id
    )
 ) IS NOT NULL

select i.industry_name
from dbo.industry as i
where i.industry_name is not null
    and i.industry_code in 
(select s.industry_code
    from dbo.series as s
    where)

During which time period did production and nonsupervisory employees fare better?
In which industries did production and nonsupervisory employees fare better?
select ROUND(AVG(j.[value]),0) as avg_weekly_earnings,
    (Select ind.industry_name
    from dbo.industry as ind
    WHERE ind.industry_code =
 (select s.industry_code
    from dbo.series as s
    where s.data_type_code=30 or s.data_type_code=31) ) as ind_name
from dbo.january_2017 as j
    INNER JOIN dbo.series as s
    on j.series_id = s.series_id
    INNER JOIN dbo.datatype as dt
    on s.data_type_code=dt.data_type_code
WHERE dt.data_type_code=30 OR dt.data_type_code=31

select *
from dbo.series
where data_type_code=30 OR data_type_code=31 and series_id is NOT NULL
Now that you have explored the datasets, is there any data or information that you wish you had in this analysis?
SELECT TOP 5
    i.industry_name,
    ROUND(AVG(j.value), 0) AS avg_weekly_earnings
FROM dbo.annual_2016 AS j
    JOIN dbo.series AS s ON j.series_id = s.series_id
    JOIN dbo.industry AS i ON s.industry_code = i.industry_code
WHERE s.data_type_code IN ('30', '31')
GROUP BY i.industry_name
ORDER BY avg_weekly_earnings DESC;

AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES

select *
FROM dbo.datatype
where data_type_text='AGGREGATE WEEKLY PAYROLLS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
--data type code 82
SELECT DISTINCT *
FROM (
    SELECT
        jan.[value],
        (   SELECT industry_name
        FROM industry as I
        WHERE i.industry_code=(
    SELECT ser.industry_code
        FROM dbo.series as ser
        WHERE ser.series_id=jan.series_id
    )
) AS industry_name
    FROM dbo.january_2017 as jan
    WHERE jan.series_id IN (
    SELECT ser.series_id
    from dbo.series as ser
    where ser.data_type_code =7)
) AS result
WHERE result.industry_name IS NOT NULL
ORDER BY result.[value] DESC
SELECT AVG([value]) as Total_weekly_payroll_prod_Nonsup
from dbo.january_2017
WHERE series_id IN(
    select a.series_id
from dbo.series as a
WHERE a.data_type_code=82)
--1838753220
SELECT SUM(j.value) as Total_weekly_payroll_prod_Nonsup_employees
FROM dbo.january_2017 AS j
WHERE series_id IN(
    SELECT s.series_id
FROM dbo.series AS s
WHERE s.data_type_code=82)
SELECT Round(SUM(value),0) as production_employee_count
from dbo.january_2017
WHERE series_id IN(
    select a.series_id
from dbo.series as a
WHERE a.data_type_code=6)
select *
from LaborStatisticsDB.dbo.january_2017