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


