CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date) = 1;

CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date) = 2;

CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date) = 3;


/*
LABEL new column as follows:
- 'ANYWHERE' jobs as 'Remote'
- 'New York, NY' as 'Local'
- Otherwise 'Onsite'
 */
SELECT 
job_title_short,
job_location,
CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
END AS localtion_category
FROM job_postings_fact;