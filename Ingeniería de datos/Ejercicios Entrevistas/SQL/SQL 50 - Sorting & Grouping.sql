-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

SELECT DISTINCT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id


-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively.
-- A user was active on someday if they made at least one activity on that day

SELECT activity_date as day, COUNT( DISTINCT user_id) AS active_users
FROM Activity
WHERE datediff('2019-07-27', activity_date) < 30 AND activity_date <= '2019-07-27'
GROUP BY activity_date

-- Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

SELECT DISTINCT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
  SELECT product_id, MIN(year)
  FROM Sales
  GROUP BY product_id
)

-- Write a solution to find all the classes that have at least five students.

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5

-- Write a solution that will, for each user, return the number of followers.

SELECT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- Find the largest single number. If there is no single number, report null

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS unique_numbers;


-- Write a solution to report the customer ids from the Customer table that bought 
-- all the products in the Product table.

SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(Distinct product_key) = (SELECT COUNT( Distinct product_key) FROM Product);