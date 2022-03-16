-- Q1 Type of Triangle
-- MySql 
-- Notice, first decide the three sides can form the triangle or not.
SELECT CASE 
WHEN A+B<=C OR A+C<=B OR B+C<=A THEN 'Not A Triangle'
WHEN A=B AND B=C THEN 'Equilateral'
WHEN A=B OR B=C OR A=C THEN 'Isosceles'
ELSE 'Scalene'
END
FROM TRIANGLES


-- Q2 The PADS
-- MySql
-- notice the space with the content of the Concat function
SELECT Concat(Name,'(',substr(OCCUPATION,1,1),')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT Concat('There are a total of ',count(OCCUPATION),' ',lower(OCCUPATION),'s.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY count(Occupation), Occupation;

-- Q3 Occupations
-- Oracle
SELECT Doctor, Professor, Singer, Actor FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rn, name, occupation FROM occupations) 
PIVOT 
(MAX(name) FOR occupation IN ('Doctor' as Doctor,'Professor' as Professor, 'Singer' as Singer, 'Actor' as Actor)) 
ORDER BY rn;

-- Q4 Binary Tree Nodes
-- MySql
-- First search root
-- If any of the nodes in column 'N' are in Parent column 'P' it will be treated as an inner node.
SELECT CASE
WHEN P IS NULL THEN CONCAT(N,' Root')
WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N,' Inner')
ELSE CONCAT(N,' Leaf')
END
FROM BST
ORDER BY N ASC

-- New Companies
-- MySql
SELECT C.COMPANY_CODE, C.FOUNDER, 
COUNT(DISTINCT L.LEAD_MANAGER_CODE),
COUNT(DISTINCT S.SENIOR_MANAGER_CODE),
COUNT(DISTINCT M.MANAGER_CODE),
COUNT(DISTINCT E.EMPLOYEE_CODE)
FROM COMPANY C,Lead_Manager L, SENIOR_MANAGER S,MANAGER M,  EMPLOYEE E
WHERE C.COMPANY_CODE=L.COMPANY_CODE 
AND L.LEAD_MANAGER_CODE=S.LEAD_MANAGER_CODE
AND S.SENIOR_MANAGER_CODE=M.SENIOR_MANAGER_CODE
AND M.MANAGER_CODE=E.MANAGER_CODE
GROUP BY C.COMPANY_CODE,C.FOUNDER
ORDER BY C.COMPANY_CODE ASC
