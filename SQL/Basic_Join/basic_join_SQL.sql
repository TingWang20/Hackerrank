-- Q1 Population Census
-- MySql
-- SOLUTION 1 - JOIN
SELECT SUM(CITY.POPULATION) FROM CITY
INNER JOIN COUNTRY
ON CITY.COUNTRYCODE=COUNTRY.CODE
WHERE CONTINENT='ASIA'
-- SOLUTION 2 - subquery method.
SELECT SUM(CITY.POPULATION) FROM CITY,COUNTRY
WHERE CITY.COUNTRYCODE=COUNTRY.CODE AND CONTINENT='ASIA'
-- SOLUTION 3 - subquery method.
SELECT SUM(CITY.POPULATION) FROM CITY
WHERE CITY.COUNTRYCODE IN (SELECT CODE FROM COUNTRY WHERE CONTINENT='ASIA')

-- Q2 African Cities
-- MYSQL
-- SOLUTION 1 - JOIN
SELECT CITY.NAME FROM CITY
JOIN COUNTRY
ON CITY.COUNTRYCODE=COUNTRY.CODE
WHERE CONTINENT='AFRICA'
-- SOLUTION 2 - QUERY
SELECT CITY.NAME FROM CITY,COUNTRY
WHERE CITY.COUNTRYCODE=COUNTRY.CODE AND CONTINENT='AFRICA'
-- SOLUTION 3 -QUERY
SELECT CITY.NAME FROM CITY
WHERE CITY.COUNTRYCODE IN (SELECT CODE FROM COUNTRY WHERE CONTINENT='AFRICA')

-- Q3 Average Population of Each Continent
-- MYSQL
-- SOLUTION 1 - INNER JOIN
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) 
FROM CITY
INNER JOIN COUNTRY 
ON CITY.COUNTRYCODE=COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT
-- SOLUTION 2 - BASIC QUERY
SELECT COUNTRY.CONTINENT,FLOOR(AVG(CITY.POPULATION)) FROM COUNTRY,CITY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT

-- Q4 The Report
-- MYSQL
-- SOLUTION 1
SELECT IF(Grades.GRADE<8,NULL,Students.NAME),Grades.GRADE,Students.Marks
FROM Students 
INNER JOIN Grades
WHERE Students.Marks BETWEEN Grades.MIN_MARK AND Grades.MAX_MARK
ORDER BY Grades.GRADE DESC, Students.NAME
-- SOLUTION 2
SELECT CASE
    WHEN G.GRADE>=8 THEN S.NAME ELSE 'NULL' END AS NAMEORNULL,
    G.GRADE, S.Marks
FROM Students S
INNER JOIN Grades G
ON S.Marks BETWEEN MIN_MARK AND MAX_MARK
ORDER BY G.GRADE DESC, NAMEORNULL ASC

-- Q5 Top Competitors
-- MYSQL
-- SOLUTION 1
SELECT H.HACKER_ID, H.NAME
FROM SUBMISSIONS S
JOIN CHALLENGES C ON S.CHALLENGE_ID=C.CHALLENGE_ID
JOIN DIFFICULTY D ON C.DIFFICULTY_LEVEL=D.DIFFICULTY_LEVEL
JOIN HACKERS H ON S.HACKER_ID = H.HACKER_ID
WHERE S.SCORE=D.SCORE AND C.DIFFICULTY_LEVEL=D.DIFFICULTY_LEVEL
GROUP BY H.HACKER_ID,H.NAME
HAVING COUNT(S.HACKER_ID)>1
ORDER BY COUNT(S.HACKER_ID>1) DESC, S.HACKER_ID ASC

-- Q6 Ollivander's Inventory
-- MYSQL
SELECT W.ID, WP.AGE, W.COINS_NEEDED, W.POWER
FROM WANDS AS W 
INNER JOIN WANDS_PROPERTY AS WP
ON W.CODE = WP.CODE
WHERE WP.IS_EVIL=0 AND W.COINS_NEEDED=(SELECT MIN(COINS_NEEDED) FROM WANDS W1
                                        JOIN WANDS_PROPERTY WP1
                                        ON W1.CODE=WP1.CODE
                                        WHERE WP.AGE=WP1.AGE AND W.POWER=W1.POWER)
ORDER BY  W.POWER DESC, WP.AGE DESC

-- Q7 Challenges
-- mysql
/*分组限定: 
1-输出challenges次数最多的学生; 
2-如果有两位同学的challenge次数相同,并且这个次数都小于最大的challenge次数, 那么这些学生就不需要print出来(所以那么不同的次数就要数出来)
先找出challenge次数，对这个次数分组。分组后的内容就是challenge次数相同的个数。
比如有49, 38, 49, 30几种challenge次数，对其分组后，则为49-2, 38-1, 30-1。
我们需要的就是重复个数为1的challenge次数(求challenge次数为1的)
*/
SELECT H.HACKER_ID, H.NAME, COUNT(C.HACKER_ID) as c_count
FROM Hackers H
INNER JOIN Challenges C
ON H.hacker_id = C.hacker_id 
GROUP BY h.hacker_id, h.name
HAVING c_count = (
    SELECT MAX(temp.cnt) 
    FROM 
        (SELECT COUNT(c2.hacker_id) as cnt from challenges c2 
        group by c2.hacker_id 
        ORDER by c2.hacker_id) as temp
)
OR c_count IN (
    SELECT temp2.c3_cnt from 
        (SELECT COUNT(c3.challenge_id) as c3_cnt from challenges c3 
        group by c3.hacker_id ) as temp2
    GROUP BY temp2.c3_cnt 
    HAVING COUNT(temp2.c3_cnt)=1
)
ORDER BY c_count DESC, c.hacker_id 

-- Q8 Contest Leaderboard
-- MYSQL
select h.hacker_id, h.name, sum(score) as total_score
from Hackers h 
inner join
-- select each id's max score for different challenge
(select hacker_id, max(score) as score from Submissions 
group by challenge_id, hacker_id) max_score 

on h.hacker_id = max_score.hacker_id 

group by h.hacker_id, h.name
having total_score > 0
order by total_score desc, h.hacker_id asc
