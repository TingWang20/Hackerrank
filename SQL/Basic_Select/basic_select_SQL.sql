-- 01 Revising the Select Query I
-- MySql
select * from city
where CountryCode='USA' and population > 100000

-- 02 Revising the Select Query II
-- MySql
select name from city
where CountryCode='USA' and population>120000

-- 03 Select All
-- MySql
select * from city

-- 04 Select By ID
-- MySql
select * from city
where id='1661'

-- 05 Japanese Cities' Attributes
-- MySql
select * from city
where COUNTRYCODE='JPN'

-- 06 Japanese Cities' Names
-- Mysql
select name from city
where countrycode='JPN'

-- 07 Weather Observation Station 1
-- MySql
select city,state from station

-- 08 Weather Observation Station 3
-- MySql
select distinct city from station
where mod(id,2)=0
order by city

-- 09 Weather Observation Station 4
-- MySql
select (count(city) - count(distinct city)) from STATION

-- 10 Weather Observation Station 5
-- MySql
(select city,length(city) from STATION
order by length(city) asc,city limit 1)

union All

(select city, length(city) from STATION
order by length(city) desc,city limit 1
)

-- 11 Weather Observation Station 6
-- MySql
-- Answer 1
SELECT DISTINCT(CITY) 
FROM STATION 
WHERE SUBSTR(CITY,1,1) IN ('a','e','i','o','u')
-- Answer 2
select distinct city 
from STATION
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%'
-- Answer 3
select distinct city from STATION
where city REGEXP '^[aeiou]'
-- Answer 4
SELECT DISTINCT CITY
FROM STATION
WHERE CITY RLIKE '^[aeiou]'

-- 12 Weather Observation Station 7
-- MySql
-- Answer 1
select distinct city 
from STATION
where SUBSTR(city,-1,1) in ('a','e','i','o','u')
-- Answer 2
select distinct(city)
from STATION
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u'
-- Answer 3
SELECT DISTINCT CITY
FROM STATION
WHERE CITY RLIKE '[aeiou]$'

-- 13 Weather Observation Station 8
-- MySql answer 1
select distinct city 
from STATION
where (city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%')
and (city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u')
-- MySql answer 2
select distinct city
from STATION
where city REGEXP '^[aeiou].*[aeiou]$'
-- MS SQL Server
select distinct city
from Station
where city like '[aeiou]%[aeiou]'

-- 14 Weather Observation Station 9
-- MySql answer 1
SELECT DISTINCT(CITY) 
FROM STATION 
WHERE SUBSTR(CITY,1,1) NOT IN ('a','e','i','o','u')
-- MySql answer 2
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[^aeiou]'
-- MySql answer 3
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiou]'
-- MySql answer 4
select distinct city
from station
where upper(substr(city,1,1)) not in ('A','E','I','O','U') and lower(substr(city,1,1)) not in ('a','e','i','o','u');

-- 15 Weather Observation Station 10
-- MySql answer 1
select distinct city 
from STATION
where SUBSTR(city,-1,1) not in ('a','e','i','o','u')
-- MySql answer 2 (regular expression)
select distinct city from Station
WHERE CITY NOT REGEXP '[aeiou]$'
-- MySql answer 3
select distinct city from Station
WHERE CITY REGEXP '[^aeiou]$'

-- 16 Weather Observation Station 11
-- MySql answer 1
SELECT DISTINCT(CITY) 
FROM STATION 
WHERE SUBSTR(CITY,1,1) NOT IN ('a','e','i','o','u') OR SUBSTR(CITY,-1,1) NOT IN ('a','e','i','o','u')
-- MySql answer 2
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou]|[^aeiou]$'

-- 17 Weather Observation Station 12
-- MySql answer 1
SELECT DISTINCT(CITY) 
FROM STATION 
WHERE SUBSTR(CITY,1,1) NOT IN ('a','e','i','o','u') AND SUBSTR(CITY,-1,1) NOT IN ('a','e','i','o','u')
-- MySql answer 2
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$'
-- MS SQL
select distinct city
from station
where city like '[^aeiou]%' and city like '%[^aeiou]'

-- 18 Higher Than 75 Marks
-- Mysql
select name from STUDENTS
where Marks>75
order by substr(name,length(name)-2,3),ID asc

-- 19 Employee Names
-- MySql
select name from Employee
order by name

-- 20 Employee Salaries
-- MySql
select name from Employee
where salary>2000 and months <10
order by employee_id asc







