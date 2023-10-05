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


-- Find all numbers that appear at least three times consecutively.

SELECT DISTINCT a.num ConsecutiveNums
FROM Logs a
INNER JOIN Logs b ON a.id = b.id+1
INNER JOIN Logs c ON a.id = c.id+2
WHERE a.num = b.num and b.num = c.num;


-- Write a solution to find the prices of all products on 2019-08-16. 
-- Assume the price of all products before any change is 10.

WITH cte AS
(SELECT *, RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS r 
FROM Products
WHERE change_date<= '2019-08-16')

SELECT product_id, new_price AS price
FROM cte
WHERE r = 1
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM cte);

-- Write a solution to find the person_name of the last person that can fit on the bus without 
-- exceeding the weight limit. The test cases are generated such that the first person does not 
-- exceed the weight limit.

WITH CTE AS (
    SELECT 
        turn, person_name, weight,
        SUM(weight) OVER(ORDER BY turn ASC) AS tot_weight 
    FROM Queue
    ORDER BY turn
)

SELECT person_name
FROM CTE
WHERE tot_weight <= 1000
ORDER BY tot_weight DESC
LIMIT 1;

-- Write a solution to calculate the number of bank accounts for each salary category. 
-- The salary categories are:

/*
  . "Low Salary": All the salaries strictly less than $20000.
  - "Average Salary": All the salaries in the inclusive range [$20000, $50000].
  - "High Salary": All the salaries strictly greater than $50000.

The result table must contain all three categories. If there are no accounts in a category, return 0. */

SELECT "Low Salary" category, COUNT(*) accounts_count
FROM Accounts
WHERE income < 20000

UNION

SELECT "Average Salary" category, COUNT(*) accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000

UNION

SELECT "High Salary" category, COUNT(*) accounts_count
FROM Accounts
WHERE income > 50000;



