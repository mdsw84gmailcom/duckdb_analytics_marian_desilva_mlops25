-- checkmark for glossaries wich we have learnt
SELECT
    *
FROM
    database.duckdb
WHERE
    id IN (3, 6, 7);

-- with this we can check glossaries we've learnt 
UPDATE database.duckdb
SET
    learnt = TRUE
WHERE
    id IN (3, 6, 7);