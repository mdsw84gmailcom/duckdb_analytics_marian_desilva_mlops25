-- b) wildcard selection to checkout the data
SELECT
    *
FROM
    hemnet
LIMIT
    10;

-- c) Find out how many rows there are in the table
SELECT
    COUNT(*) AS total_rows
FROM
    hemnet;

-- d) Describe the table that you have ingested to see the columns and data types.
DESC hemnet;

-- e) Find out the 5 most expensive homes sold.
SELECT
    *
FROM
    hemnet
ORDER BY
    final_price DESC
LIMIT
    5;

-- f) Find out the 5 cheapest homes sold.
SELECT
    *
FROM
    hemnet
ORDER BY
    final_price ASC
LIMIT
    5;

-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.
SELECT
    MIN(final_price) AS min_price,
    AVG(final_price) AS mean_price,
    MEDIAN (final_price) AS median_price,
    MAX(final_price) AS max_price
FROM
    hemnet;

-- h) Find out statistics on minimum, mean, median and maximum prices of price per area.
SELECT
    MIN(price_per_area) AS min_price_per_area,
    AVG(price_per_area) AS mean_price_per_area,
    MEDIAN (price_per_area) AS median_price_per_area,
    MAX(price_per_area) AS max_price_per_area
FROM
    hemnet;

-- i) How many unique communes are represented in the dataset.
SELECT
    COUNT(DISTINCT commune) AS unique_communes
FROM
    hemnet;

-- j) How many percentage of homes cost more than 10 million?
SELECT
    100.0 * COUNT(*) FILTER (
        WHERE
            final_price > 10000000
    ) / COUNT(*) AS pct_over_10m
FROM
    hemnet;

-- k) Feel free to explore anything else you find interesting in this dataset.
-- Find the highest priced home in each commune
SELECT
    commune,
    MAX(final_price) AS max_price
FROM
    hemnet
GROUP BY
    commune
ORDER BY
    max_price DESC;

-- Calculate the average final price for each commune
SELECT
    commune,
    AVG(final_price) AS avg_price
FROM
    hemnet
GROUP BY
    commune
ORDER BY
    avg_price DESC;

-- Calculate the average price per area for each commune
SELECT
    commune,
    AVG(price_per_area) AS avg_price_per_area
FROM
    hemnet
GROUP BY
    commune
ORDER BY
    avg_price_per_area DESC;

-- Calculate the median final price for each commune
SELECT
    commune,
    MEDIAN (final_price) AS median_price
FROM
    hemnet
GROUP BY
    commune
ORDER BY
    median_price DESC;

-- Find the most common room count across all homes
SELECT
    rooms,
    COUNT(*) AS occurrences
FROM
    hemnet
GROUP BY
    rooms
ORDER BY
    occurrences DESC;

-- Show average price grouped by number of rooms
SELECT
    rooms,
    AVG(final_price) AS avg_price
FROM
    hemnet
GROUP BY
    rooms
ORDER BY
    rooms;

-- Find the 10 homes with the largest supplemental area
SELECT
    *
FROM
    hemnet
ORDER BY
    supplemental_area DESC
LIMIT
    10;