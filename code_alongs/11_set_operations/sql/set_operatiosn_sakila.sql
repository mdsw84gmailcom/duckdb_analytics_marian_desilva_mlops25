-- check customer
SELECT
    'customers' as type,
    c.first_name,
    c.last_name
FROM
    customer c;

-- check actor
SELECT
    'actor' as type,
    c.first_name,
    c.last_name
FROM
    actor a;

-- select all customers and all actors starting with A in firstname
SELECT
    'customers' as type,
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name ILIKE 'a%'
UNION
SELECT
    'actor' as type,
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.first_name ILIKE 'a%';

-- find all overlapping names between actors and customers
SELECT
    c.first_name,
    c.last_name
FROM
    customer c
INTERSECT
SELECT
    a.first_name,
    a.last_name
FROM
    actor a;

-- find all initials JD in both customer and actor 
SELECT
    'customer' AS type,
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'J%'
    AND c.last_name LIKE 'D%'
UNION ALL
SELECT
    'actor' AS type,
    a.first_name,
    a.last_name
FROM
    actor a
WHERE
    a.first_name LIKE 'J%'
    AND a.last_name LIKE 'D%';