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

