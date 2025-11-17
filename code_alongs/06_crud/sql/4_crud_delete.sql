-- find the row with select first to make sure we delete correct one
SELECT
    *
FROM
    programming.python
WHERE
    id = 2;

DELETE FROM programming.python
WHERE
    id = 2;

SELECT
    *
FROM
    database.duckdb
WHERE
    id > 8;

DELETE FROM database.duckdb
WHERE
    id > 8;