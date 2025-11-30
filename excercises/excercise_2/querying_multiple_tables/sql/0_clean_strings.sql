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