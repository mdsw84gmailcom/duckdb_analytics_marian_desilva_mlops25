-- a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.
SELECT
    COUNT(*)
FROM
    cleaned_salaries
WHERE
    job_title = 'Data Engineer';

-- b) Count number of unique job titles in total.
SELECT
    COUNT(DISTINCT job_title)
FROM
    cleaned_salaries;

-- c) Find out how many jobs that goes into each salary level.
SELECT
    salary_level,
    COUNT(*) AS count
FROM
    cleaned_salaries
GROUP BY
    salary_level
ORDER BY
    count DESC;

-- d) Find out the median and mean salaries for each seniority levels.
SELECT
    experience_level_clean,
    MEDIAN (salary_monthly_sek) AS median_salary,
    AVG(salary_monthly_sek) AS mean_salary
FROM
    cleaned_salaries
GROUP BY
    experience_level_clean
ORDER BY
    median_salary DESC;

-- e) Find out the top earning job titles based on their median salaries and how much they earn.
SELECT
    job_title,
    MEDIAN (salary_monthly_sek) AS median_salary
FROM
    cleaned_salaries
GROUP BY
    job_title
ORDER BY
    median_salary DESC
LIMIT
    10;

-- f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.
SELECT
    remote_ratio,
    COUNT(*) * 100.0 / (
        SELECT
            COUNT(*)
        FROM
            cleaned_salaries
    ) AS percentage
FROM
    cleaned_salaries
GROUP BY
    remote_ratio
ORDER BY
    remote_ratio DESC;

-- g) Pick out a job title of interest and figure out if company size affects the salary. Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.
-- h) Feel free to explore other things