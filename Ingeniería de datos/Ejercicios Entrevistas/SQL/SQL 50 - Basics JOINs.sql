-- Write a solution to show the unique ID of each user, 
-- If a user does not have a unique ID replace just show null

SELECT unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;

-- Write a solution to report the product_name, year, and price 
-- for each sale_id in the Sales table.

SELECT p.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id;

-- Write a solution to find the IDs of the users who visited 
-- without making any transactions and the number of times they made these types of visits.

SELECT customer_id, COUNT(*) count_no_trans
FROM Visits a
LEFT JOIN Transactions b
ON a.visit_id = b.visit_id
WHERE transaction_id is NULL
GROUP BY customer_id
ORDER BY count_no_trans;

-- Find all dates' Id with higher temperatures compared to its previous dates (yesterday)

SELECT id
FROM Weather a
LEFT JOIN (
  SELECT DATE_ADD(recordDate, interval 1 DAY) yesterday , temperature
  FROM Weather
) b ON a.recordDate = b.yesterday
WHERE a.temperature > b.temperature;

-- Write a solution to find the average time each machine takes to complete a process.

SELECT a.machine_id, ROUND(AVG(b.timestamp - a.timestamp),3) processing_time
FROM Activity a
LEFT JOIN Activity b
ON a.machine_id = b.machine_id AND a.process_id = b.process_id
WHERE a.activity_type = 'start' AND b.activity_type='end'
GROUP BY a.machine_id;

-- Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000

SELECT name, bonus
FROM Employee a
LEFT JOIN Bonus b
ON a.empId = b.empId
WHERE bonus < 1000 OR bonus is null


-- Write a solution to find the number of times each student attended each exam.

SELECT a.student_id, a.student_name, b.subject_name, IFNULL(c.attended_exams, 0) attended_exams
FROM Students a
CROSS JOIN Subjects b
LEFT JOIN 
  (SELECT a.student_id, a.student_name, c.subject_name, COUNT(*) attended_exams
  FROM Students a
  LEFT JOIN Examinations b
  ON a.student_id = b.student_id
  LEFT JOIN Subjects c
  ON b.subject_name = c.subject_name
  GROUP BY  a.student_id, a.student_name,c.subject_name) c
ON a.student_id = c.student_id AND b.subject_name = c.subject_name
ORDER BY  a.student_id, b.subject_name;

-- Write a solution to find managers with at least five direct reports.

SELECT a.name
FROM Employee a
LEFT JOIN (
  SELECT a.managerId, COUNT(*)
  FROM Employee a
  LEFT JOIN Employee b
  ON a.managerId = b.id
  GROUP BY a.managerId
  HAVING COUNT(*) >= 5
  ) b
ON a.id = b.managerId
WHERE b.managerId is not null;

-- Write an SQL query to find the confirmation rate of each user

SELECT DISTINCT a.user_id, ROUND(IFNULL(confirmed/total, 0),2) confirmation_rate
FROM Signups a
LEFT JOIN (
  SELECT user_id, COUNT(*) confirmed
  FROM Confirmations
  WHERE action = 'confirmed'
  GROUP BY user_id
) b
ON a.user_id = b.user_id
LEFT JOIN (
  SELECT user_id, COUNT(*) total
  FROM Confirmations
  GROUP BY user_id
) c
ON a.user_id = c.user_id
ORDER BY confirmation_rate;
