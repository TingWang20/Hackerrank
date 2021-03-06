-- Q1 Revising Aggregations - The Count Function
-- MySql
SELECT COUNT(NAME) FROM CITY
WHERE POPULATION>100000

-- Q2 Revising Aggregations - The Sum Function
-- MySql
SELECT SUM(POPULATION) FROM CITY
WHERE DISTRICT='CALIFORNIA'

-- Q3 Revising Aggregations - Averages
-- MySql
SELECT AVG(POPULATION) FROM CITY
WHERE DISTRICT='CALIFORNIA'

-- Q4 Average Population
-- MySql
SELECT ROUND(AVG(POPULATION)) FROM CITY

-- Q5 Japan Population
-- MySql
SELECT SUM(POPULATION) FROM CITY
WHERE COUNTRYCODE='JPN'

-- Q6 Population Density Difference
-- MySql
SELECT (MAX(POPULATION) - MIN(POPULATION)) FROM CITY

-- Q7 The Blunder
-- MySql
-- REPLACE(),CEIL/CEILING() FUNCTIONS
SELECT CEILING((AVG(SALARY) - AVG(REPLACE(SALARY,0,''))))
FROM EMPLOYEES

-- Q8 Top Earners
-- MySql
SELECT (MONTHS * SALARY) AS EARNING, COUNT(*)
FROM EMPLOYEE
GROUP BY EARNING
ORDER BY EARNING DESC 
LIMIT 1 --limits the returned row count to only 1.

-- Q9 Weather Observation Station 2
-- MySql
SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2) FROM STATION

-- Q10 Weather Observation Station 13
-- MySql
SELECT ROUND(SUM(LAT_N),4) FROM STATION
WHERE LAT_N>38.7880 AND LAT_N < 137.2345

-- Q11 Weather Observation Station 14
-- MySql
SELECT ROUND(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345

-- Q12 Weather Observation Station 15
-- MySql
-- WAY ONE
SELECT ROUND(LONG_W,4) FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N <137.2345)
-- WAY TWO
SELECT ROUND(LONG_W,4) FROM STATION
WHERE LAT_N<137.2345
GROUP BY LAT_N
LIMIT 1

-- Q13 Weather Observation Station 16
-- MySql
SELECT ROUND(MIN(LAT_N),4) FROM STATION
WHERE LAT_N>38.7780

-- Q14 Weather Observation Station 17
-- MySql
-- WAY ONE
SELECT ROUND(LONG_W,4) FROM STATION
WHERE LAT_N=(SELECT MIN(LAT_N) FROM STATION WHERE LAT_N>38.7780)
-- WAY TWO
SELECT ROUND(LONG_W,4) FROM STATION
WHERE LAT_N>38.7780
ORDER BY LAT_N ASC
LIMIT 1

-- Q15 Weather Observation Station 18 - Manhattan Distance 
-- MySql
-- CARE YOUR BRACKETS
SELECT ROUND((MAX(LONG_W) - MIN(LONG_W) + MAX(LAT_N) - MIN(LAT_N)),4) FROM STATION

-- Q16 Weather Observation Station 19 - Euclidean Distance
-- MySql
SELECT ROUND(sqrt(power(Max(LONG_W)-Min(LONG_W),2) + power(MAX(LAT_N) - MIN(LAT_N),2)),4)
FROM STATION

-- Q17 Weather Observation Station 20
-- MySql
-- Solution one
SELECT t.lat FROM 
(SELECT ROUND(LAT_N,4) as lat,
ROW_NUMBER() over(order by LAT_N ASC) AS row_num
FROM  STATION
order by row_num ) t
where t.row_num = CEILING((SELECT COUNT(*)+1 FROM STATION s)/2)
-- solution two
SELECT t.lat FROM 
(SELECT ROUND(LAT_N,4) as lat,
ROW_NUMBER() over(order by LAT_N ASC) AS row_num
FROM  STATION
order by row_num ) t
where 
t.row_num = (SELECT 
	CASE WHEN MOD(COUNT(*),2)=0 THEN ROUND(COUNT(*)/2 + 1) else round((COUNT(*)+1)/2) End 
	FROM STATION s 
	)
