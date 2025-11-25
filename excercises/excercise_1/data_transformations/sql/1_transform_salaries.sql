-- test transformation before create 
SELECT DISTINCT
    employment_type,
    CASE
        WHEN employment_type = 'CT' THEN 'Contract'
        WHEN employment_type = 'FL' THEN 'Freelance'
        WHEN employment_type = 'PT' THEN 'Part time'
        WHEN employment_type = 'FT' THEN 'Full time'
        ELSE employment_type
    END AS employment_type_clean
FROM
    salaries_raw;