/* 
Based on the EDA, I want to do the following

- id -> food
- remove googleTopic
- value -> number_of_searches
- week_id -> week column and year column

Very good to SELECT before doing the transformation

 */
SELECT
    id AS food,
    week_id AS week,
    SUBSTRING(week, 1, 4) AS year,
    value as number_of_searches
FROM
    food;

CREATE TABLE
    IF NOT EXISTS cleaned_food AS (
        SELECT
            id AS food,
            week_id AS week,
            SUBSTRING(week, 1, 4) AS year,
            value as number_of_searches
        FROM
            food
    );