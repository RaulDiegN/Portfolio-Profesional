
-- Find the ids of products that are both low fat and recyclable

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable='Y';


-- Find the names of the customer that are not referred by the customer with id = 2

SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id is NULL;

-- Write a solution to find the name, population, and area of the big countries.

SELECT name, population, area
FROM World
WHERE population >= 25000000  OR area >= 3000000 ;

-- Find all the authors that viewed at least one of their own articles

SELECT DISTINCT author_id id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;


-- find the IDs of the invalid tweets. 
-- The tweet is invalid if the number of characters used in the content 
-- of the tweet is strictly greater than 15

SELECT DISTINCT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
