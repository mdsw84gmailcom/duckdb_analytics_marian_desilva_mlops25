-- ingest CSV file into a table
CREATE TABLE
    IF NOT EXISTS hemnet AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/hemnet.csv')
    );