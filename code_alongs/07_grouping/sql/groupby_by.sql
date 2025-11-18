-- top 10 most popular food searches
SELECT
    food,
    SUM(number_of_searches) AS total_searches
FROM
    cleaned_food
GROUP BY
    food;

SELECT
    food,
    SUM(number_of_searches) AS total_searches
FROM
    cleaned_food
GROUP BY
    food
ORDER BY
    total_searches DESC
LIMIT
    10;


-- total searches by year
-- filter on number of searches
SELECT
    year,
    SUM(number_of_searches) AS total_searches
FROM
    cleaned_food
GROUP BY
    year
ORDER BY
    total_searches DESC;

SELECT 
    year,
    SUM(number_of_searches) AS total_searches
FROM cleaned_food
GROUP BY year
HAVING 
    total_searches > 400_000
ORDER BY year; 


-- can group by several columns
/* 
works like this:
groups by food and year
for this group there are 52 rows
take the sum of these 52 rows
 */
SELECT 
    food, 
    year, 
    SUM(number_of_searches) AS total_searches
FROM cleaned_food
GROUP BY
    food, year
ORDER BY food, year;


SELECT 
    food, 
    year, 
    SUM(number_of_searches) AS total_searches
FROM cleaned_food
GROUP BY
    food, year
HAVING food in ('pizza', 'sushi')
ORDER BY food, year;

