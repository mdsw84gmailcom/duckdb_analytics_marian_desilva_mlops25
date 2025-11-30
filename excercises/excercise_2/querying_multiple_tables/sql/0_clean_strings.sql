CREATE SCHEMA IF NOT EXISTS staging;

CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE
    IF NOT EXISTS staging.sql_terms_raw AS
SELECT
    *
FROM
    read_csv_auto ('data/sql_terms.csv');

-- explore data
SELECT
    *
FROM
    staging.sql_terms_raw
LIMIT
    10;

CREATE
OR REPLACE TABLE refined.sql_terms_clean AS
SELECT
    -- Standardize SQL term (trim + lowercase)
    LOWER(TRIM(word)) AS term_clean,
    -- Clean description (trim + collapse multiple spaces into one)
    REGEXP_REPLACE (TRIM(description), '\\s+', ' ') AS description_clean,
    -- Clean example (remove leading and trailing whitespace)
    TRIM(example) AS example_clean
FROM
    staging.sql_terms_raw;

-- Find all terms containing the word "join"
SELECT
    *
FROM
    refined.sql_terms_clean
WHERE
    term_clean LIKE '%join%';

-- Find descriptions that mention the word "table"
SELECT
    *
FROM
    refined.sql_terms_clean
WHERE
    description_clean ILIKE '%table%';

-- Find examples containing a WHERE clause
SELECT
    *
FROM
    refined.sql_terms_clean
WHERE
    example_clean ILIKE '%where%';