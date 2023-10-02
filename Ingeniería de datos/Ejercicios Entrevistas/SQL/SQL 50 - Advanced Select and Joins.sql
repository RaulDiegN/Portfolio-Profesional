-- Write a solution to report the ids and the names of all managers, 
-- the number of employees who report directly to them, 
-- and the average age of the reports rounded to the nearest integer.

SELECT a.employee_id, a.name, COUNT(*) reports_count, CEILING(AVG(b.age)) average_age
FROM Employees a
INNER JOIN Employees B
ON b.reports_to = a.employee_id
GROUP BY a.employee_id, a.name
ORDER BY employee_id;

-- Write a solution to report all the employees with their primary department. 
-- For employees who belong to one department, report their only department.

SELECT employee_id,department_id from Employee
group by employee_id
having COUNT(employee_id)=1 
UNION 
SELECT employee_id,department_id from Employee
where primary_flag='Y';


-- Report for every three line segments whether they can form a triangle.


SELECT x, y, z, 
  CASE WHEN (x+y>z) AND (x+z>y) AND (y+z>x) THEN 'Yes'
  ELSE 'No' END triangle
FROM Triangle;