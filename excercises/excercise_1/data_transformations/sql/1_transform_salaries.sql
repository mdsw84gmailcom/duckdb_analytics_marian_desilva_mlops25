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

-- test SEK converting (yearly)
SELECT
    salary_in_usd,
    salary_in_usd * 11 AS salary_annual_sek
FROM
    salaries_raw
LIMIT
    10;

-- create transformed table
DROP TABLE IF EXISTS cleaned_salaries;

CREATE TABLE
    cleaned_salaries AS
SELECT
    experience_level,
    employment_type,
    job_title,
    salary_in_usd,
    remote_ratio,
    company_size
FROM
    salaries_raw;

-- add new columns
ALTER TABLE cleaned_salaries
ADD COLUMN employment_type_clean TEXT;

UPDATE cleaned_salaries
SET
    employment_type_clean = CASE
        WHEN employment_type = 'CT' THEN 'Contract'
        WHEN employment_type = 'FL' THEN 'Freelance'
        WHEN employment_type = 'PT' THEN 'Part time'
        WHEN employment_type = 'FT' THEN 'Full time'
    END;

ALTER TABLE cleaned_salaries
ADD COLUMN company_size_clean TEXT;

UPDATE cleaned_salaries
SET
    company_size_clean = CASE
        WHEN company_size = 'S' THEN 'Small'
        WHEN company_size = 'M' THEN 'Medium'
        WHEN company_size = 'L' THEN 'Large'
    END;

-- year salary
ALTER TABLE cleaned_salaries
ADD COLUMN salary_annual_sek DOUBLE;

UPDATE cleaned_salaries
SET
    salary_annual_sek = salary_in_usd * 11;

-- monthly salary
ALTER TABLE cleaned_salaries
ADD COLUMN salary_monthly_sek DOUBLE;

UPDATE cleaned_salaries
SET
    salary_monthly_sek = salary_annual_sek / 12;

ALTER TABLE cleaned_salaries
ADD COLUMN salary_level TEXT;

UPDATE cleaned_salaries
SET
    salary_level = CASE
        WHEN salary_monthly_sek < 30000 THEN 'low'
        WHEN salary_monthly_sek < 55000 THEN 'medium'
        WHEN salary_monthly_sek < 90000 THEN 'high'
        ELSE 'insanely_high'
    END;

-- clean standardsin job title
ALTER TABLE cleaned_salaries
ADD COLUMN job_title_clean TEXT;

UPDATE cleaned_salaries
SET
    job_title_clean = LOWER(job_title);

-- is remote
ALTER TABLE cleaned_salaries
ADD COLUMN is_remote BOOLEAN;

UPDATE cleaned_salaries
SET
    is_remote = remote_ratio = 100;