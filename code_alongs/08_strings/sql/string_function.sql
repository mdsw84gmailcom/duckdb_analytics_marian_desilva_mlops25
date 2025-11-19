/* sql_word
- leading and trailing spaces
- mix of upper and lowercases

TRIM() in SQL
python -> strip() # remove leading and trailing 
 */
SELECT
    sql_word,
    UPPER(TRIM(sql_word)) AS cleaned_word,
    LOWER(TRIM(sql_word)) AS cleaned_word_lower,
    'SQL command: ' || cleaned_word_lower AS concatenation
FROM
    staging.glossary;

-- leading and trailing space
-- > 1 space between some words
SELECT
    description,
    REPLACE (TRIM(description), '  ', ' ') AS cleaned_description,
    REGEXP_REPLACE (TRIM(description), ' +', ' ', 'g') AS regexp_clean
FROM
    staging.sql_glossary;

SELECT
    'hej på dig' AS s1,
    REVERSE (s1),
    'ni talar bra latin' AS p1,
    REVERSE (p1);

-- find the position of the first occurence of a substring
-- return zero if the substring is not found
SELECT
    description,
    instr (description, 'select') as select_position,
    select_position != 0 as about_select
FROM
    staging.sql_glossary;

-- concatenation
SELECT
    'fun' || ' joke'