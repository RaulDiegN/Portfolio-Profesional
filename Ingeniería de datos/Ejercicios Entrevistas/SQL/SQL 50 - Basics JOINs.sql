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

