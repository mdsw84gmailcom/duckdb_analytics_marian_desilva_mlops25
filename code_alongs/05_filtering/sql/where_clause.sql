SELECT
    COUNT(*)
FROM
    data_jobs;

-- filtering rows
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    salary_in_usd < 50000;

-- find entry levels jobs 
SELECT DISTINCT
    experience_level
FROM
    data_jobs;

SELECT
    *
FROM
    data_jobs
WHERE
    experience_level = 'EN';

-- find median salary for entry level jobs
SELECT
    MEDIAN (salary_in_usd) AS median_salary_usd,
    AVG(salary_in_usd) AS mean_salary_usd
FROM
    data_jobs
WHERE
    experience_level = 'EN';

-- find median salary for entry level jobs
SELECT
    MEDIAN (salary_in_usd) AS median_salary_usd,
    AVG(salary_in_usd) AS mean_salary_usd
FROM
    data_jobs
WHERE
    experience_level = 'MI';