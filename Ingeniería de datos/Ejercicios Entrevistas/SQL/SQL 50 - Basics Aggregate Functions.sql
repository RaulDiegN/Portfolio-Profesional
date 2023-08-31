-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring"

SELECT *
FROM Cinema
WHERE MOD(id,2) <> 0 and description <> 'boring'
ORDER BY rating DESC;


-- Write an SQL query to find the average selling price for each product. average_price should be rounded to 2 decimal places.

SELECT a.product_id, ROUND(SUM(units*price)/SUM(units),2) average_price
FROM Prices a
INNER JOIN UnitsSold b
ON a.product_id = b.product_id
WHERE b.purchase_date >= a.start_date AND b.purchase_date <= a.end_date
GROUP BY a.product_id;

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

SELECT a.project_id, ROUND(AVG(experience_years),2) average_years
FROM Project a
LEFT JOIN Employee b
ON a.employee_id = b.employee_id
GROUP BY a.project_id;