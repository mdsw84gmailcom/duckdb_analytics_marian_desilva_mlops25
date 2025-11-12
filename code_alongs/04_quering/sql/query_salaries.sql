SELECT * FROM data_jobs;

-- case intensive in SQL
-- by convention UPPERCASE for SQL commands
-- lowercase for columns
SELECT * FROM data_jobs LIMIT 5;


-- offset 3
SELECT * FROM data_jobs OFFSET 3 LIMIT 5;

-- pick out a few columns
SELECT
    work_year,
    experience_level,
    job_title,
    salary_in_usd,
    company_size
FROM
    data_jobs;


-- gives every columns except for those special
SELECT 
    * EXCLUDE (work_year, job_title)
FROM
    data_jobs;

