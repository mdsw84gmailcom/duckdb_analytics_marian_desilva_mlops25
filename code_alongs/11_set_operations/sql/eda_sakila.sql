DESC;

-- 1000 films
FROM
    film;

DESC TABLE film;

SELECT DISTINCT
    rating
FROM
    film;

-- why do we have so many rows here, while films only have 1000 rows
-- 5462 > 1000 films -> actors can play ≥ 1 film
FROM
    film_actor;

-- ex insight
-- actor_id 1 -> Penelope Guiness
-- plays in movies: academy dinosaur, anoconda confessions, ...
FROM
    actor;

-- bridge table between film and category
-- it holds film_id and category_id
FROM
    film_category;

FROM
    category;

-- alias, ett kortare sätt att göra alias utan AS
SELECT
    *
FROM
    customer c;

SELECT
    'customer' AS type,
    c.first_name || ' ' || c.last_name AS name
FROM
    customer c;

-- all customers firstname starting with B
SELECT
    'customer' AS type,
    c.first_name || ' ' || c.last_name AS name
FROM
    customer c
WHERE
    c.first_name ILIKE 'b%';

-- continue with your EDA, there is a lot of things to explore