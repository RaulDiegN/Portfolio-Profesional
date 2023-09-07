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

-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

SELECT a.contest_id, 
    ROUND(COUNT(a.user_id)/
                (Select COUNT(*)FROM Users)*100,2) percentage
FROM Register a
LEFT JOIN Users b
ON a.user_id = b.user_id
GROUP BY a.contest_id
ORDER BY percentage DESC, a.contest_id ASC;


-- We define query quality as:
--    The average of the ratio between query rating and its position.
-- We also define poor query percentage as:
--    The percentage of all queries with rating less than 3.
-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

SELECT a.query_name, ROUND(AVG(rating/a.position),2) quality, 
    IFNULL(ROUND(number_ranting_minus_3 / COUNT(*) * 100,2),0) poor_query_percentage
FROM Queries a
LEFT JOIN (
  SELECT query_name, COUNT(*) number_ranting_minus_3
  FROM Queries
  WHERE rating < 3
  GROUP BY query_name
) b
ON a.query_name = b.query_name
GROUP BY a.query_name;


-- Write an SQL query to find for each month and country, the number of transactions 
-- and their total amount, the number of approved transactions and their total amount.
SELECT  DATE_FORMAT(trans_date, '%Y-%m') as month, country, COUNT(id) as trans_count, 
SUM(CASE WHEN state = 'approved' then 1 else 0 END) as approved_count, SUM(amount) as trans_total_amount, 
SUM(CASE WHEN state = 'approved' then amount else 0 END) as approved_total_amount
FROM Transactions
GROUP BY month, country

-- Write a solution to find the percentage of immediate orders in the first orders of all customers, 
-- rounded to 2 decimal places.

SELECT (COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE NULL END) / COUNT(delivery_id))*100 AS immediate_percentage
FROM Delivery;

-- Write a solution to report the fraction of players that logged in again on the day after 
-- the day they first logged in, rounded to 2 decimal places. In other words, you need to count 
-- the number of players that logged in for at least two consecutive days starting from their first 
-- login date, then divide that number by the total number of players.

