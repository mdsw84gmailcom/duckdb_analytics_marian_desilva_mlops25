-- test transformation employment type before create 
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

-- test transformation of company size before create
SELECT DISTINCT
    company_size,
    CASE
        WHEN company_size = 'S' THEN 'Small'
        WHEN company_size = 'M' THEN 'Medium'
        WHEN company_size = 'L' THEN 'Large'
        ELSE company_size
    END AS company_size_clean
FROM
    salaries_raw;