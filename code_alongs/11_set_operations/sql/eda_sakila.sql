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