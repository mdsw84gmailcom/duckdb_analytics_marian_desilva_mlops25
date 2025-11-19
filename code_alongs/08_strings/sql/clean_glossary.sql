CREATE SCHEMA IF NOT EXISTS refined;

-- do from select first to see how it looks like then create table
SELECT
    UPPER(TRIM(sql_word)) AS sql_word,
    REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
    REGEXP_REPLACE (TRIM(example), ' +', ' ', 'g') AS example,
FROM
    staging.sql_glossary;

CREATE TABLE
    IF NOT EXISTS refined.sql_glossary AS (
        SELECT
            UPPER(TRIM(sql_word)) AS sql_word,
            REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS description,
            REGEXP_REPLACE (TRIM(example), ' +', ' ', 'g') AS example,
        FROM
            staging.sql_glossary
    );

-- TOOD for the reader do more cleaning