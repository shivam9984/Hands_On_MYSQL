-- SQL joins

--Inner join : Returns rows where both tables have same value on comparing column

-- Query : Write a query that return subway_name, country_code and country_name
SELECT s.subway_name,
       s.city,
       c.country 
FROM subway_system s
INNER JOIN country c
ON s.country_code = c.country_code

-- Outer join : Two types of outer join right_outer_join  and left_outer_join
-- Right Outer join: Return all rows of right table and rows which match on comparison column on left table
-- Left Outer join: Return all rows of left table and rows which match on comparison column on right table

SELECT c.country,
       s.subway_name,
       s.city,
FROM subway_system s
RIGHT OUTER JOIN country c
ON s.country_code = c.country_code


SELECT s.subway_name,
       s.city,
       c.country 
FROM subway_system s
LEFT OUTER JOIN country c
ON s.country_code = c.country_code



-- Natural join : Returns rows that are matching  against the comparison column value without explicitly defines on command

SELECT * 
FROM subway_system s 
NATURAL JOIN  country c;

-- Self joins : Sometimes it is beneficial to join table to itself 

SELECT e1.employee_name AS Employee , e2.manager_id AS Manager
FROM employees e1 
LEFT OUTER JOIN employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_name








