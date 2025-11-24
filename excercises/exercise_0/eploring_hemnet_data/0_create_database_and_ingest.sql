-- ingest CSV file into a table
CREATE TABLE
    IF NOT EXISTS hemnet AS (
        SELECT
            *
        FROM
            read_csv_auto (
                'exercises/exercise_0/exploring_hemnet_data/data/hemnet.csv'
            )
    );