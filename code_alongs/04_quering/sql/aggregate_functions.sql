-- descreptive statistics with aggregation.sql
-- AS to make alias for the column
SELECT 
    MIN(salary_in_usd) AS min_salary,
    MEDIAN(salary_in_usd) AS mean_salary_usd,
    AVG(salary_in_usd) AS median_salary_usd,
    MAX(salary_in_usd) AS max_salary_usd
FROM
    data_jobs;