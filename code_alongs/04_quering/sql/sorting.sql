-- sort descending by default
SELECT 
    * 
FROM 
    data_jobs 
ORDER BY 
    salary_in_usd;

-- sort descending 
SELECT 
    * 
FROM 
    data_jobs 
ORDER BY 
    salary_in_usd; DESC;

-- sort descending on salary_in_usd
-- and ascendingg on job_title
-- in ties for salary -> sort job_title
-- alphabetically
SELECT 
    * 
FROM 
    data_jobs 
ORDER BY 
    salary_in_usd DESC,
    job_title ASC;