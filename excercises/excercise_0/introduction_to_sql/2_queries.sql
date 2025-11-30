-- a) all exercise
SELECT
    *
FROM
    course_content
WHERE
    content_type = 'exercise';

-- b) all lectures
SELECT
    *
FROM
    course_content
WHERE
    content_type = 'lecture';

-- c) select all records for week 48(week3)
SELECT
    *
FROM
    course_content
WHERE
    week = 3;

-- d) select all records for week 47-49
SELECT
    *
FROM
    course_content
WHERE
    week BETWEEN 2 AND 4;

-- e) how many lectures are there?
SELECT
    COUNT(*) AS lecture_count
FROM
    course_content
WHERE
    content_type = 'lecture';

-- f) how many other content are there?
SELECT
    COUNT(*) AS other_content
FROM
    course_content
WHERE
    content_type <> 'lecture';

-- g) which are the unique content types in this table?
SELECT DISTINCT
    content_type
FROM
    course_content;

-- h) Delete the row and insert the same row back to table.
DELETE FROM course_content
WHERE
    week = 1
    AND content_type = 'lecture';

INSERT INTO
    course_content
VALUES
    (
        'intro, query, ingest csv, CLI, table, select, filtering',
        1,
        'lecture'
    );

-- i) sorting the weeks in ascending order
SELECT
    *
FROM
    course_content
ORDER BY
    week ASC;

-- j) list all content grouped by week
SELECT
    week,
    STRING_AGG (content, ', ') AS week_contents
FROM
    course_content
GROUP BY
    week
ORDER BY
    week;

-- count how many contents exist for each content type
SELECT
    content_type,
    COUNT(*) AS total_items
FROM
    course_content
GROUP BY
    content_type
ORDER BY
    total_items DESC;