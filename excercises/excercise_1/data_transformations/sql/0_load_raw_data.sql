CREATE TABLE
    IF NOT EXISTS salaries_raw AS
SELECT
    *
FROM
    read_csv_auto ('data/salaries.csv')