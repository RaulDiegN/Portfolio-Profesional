-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

SELECT *
FROM Cinema
WHERE MOD(id,2) <> 0 and description <> 'boring'
ORDER BY rating DESC;


