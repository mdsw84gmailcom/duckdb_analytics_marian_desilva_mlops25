-- b) The column order_id is the unique identifier of an order. How many unique orders are in the data?
SELECT
    COUNT(DISTINCT order_id) AS unique_orders
FROM
    bike_data;

-- c) A unique order can involve multiple products. The column product_id is the unique identifier of a product. How many unique products are in the data?
SELECT
    COUNT(DISTINCT product_id) AS unique_products
FROM
    bike_data;

-- d) For the product with product_name Surly Straggler - 2016, how many customers have ordered it? How much is the total sales value coming from these orders?
SELECT
    COUNT(DISTINCT customer_id) AS customer_count,
    SUM(list_price) AS total_sales_value
FROM
    bike_data
WHERE
    product_name = 'Surly Straggler - 2016';

-- e) How many customers are coming from these cities: San Angelo, Orchard Park and Merrick?
SELECT
    customer_city,
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    bike_data
WHERE
    customer_city IN ('San Angelo', 'Orchard Park', 'Merrick')
GROUP BY
    customer_city;

-- f) Create a new column manager_name using the information below:
SELECT
    *,
    CASE
        WHEN manager_id = 1 THEN 'Amy Andersson'
        WHEN manager_id = 2 THEN 'Bill Berg'
        WHEN manager_id = 5 THEN 'Cathy Larsson'
        WHEN manager_id = 7 THEN 'Davis Lam'
        ELSE NULL
    END AS manager_name
FROM
    bike_data;