-- finds the joke that we want to update
-- use select first safeguard
SELECT * FROM funny_jokes WHERE id = 7;


UPDATE
    funny_jokes
SET 
    rating = 10
WHERE id = 7;