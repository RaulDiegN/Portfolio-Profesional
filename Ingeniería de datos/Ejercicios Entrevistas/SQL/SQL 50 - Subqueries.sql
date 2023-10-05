-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager 
-- left the company. When a manager leaves the company, their information is deleted from 
-- the Employees table, but the reports still have their manager_id set to the manager that left.


SELECT employee_id
FROM Employees 
WHERE salary < 30000 and manager_id not in (SELECT employee_id FROM Employees)
ORDER BY employee_id;


-- Write a solution to swap the seat id of every two consecutive students. If the number 
-- of students is odd, the id of the last student is not swapped.

SELECT id, 
COALESCE(CASE WHEN id % 2 = 0 THEN LAG(student) OVER() ELSE LEAD(student) OVER() END, student) AS student
from Seat;
