SELECT
job_title_short AS title,
job_location AS location,
job_posted_date::DATE AS date

 FROM job_postings_fact
 LIMIT 100;

 SELECT
job_title_short AS title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date

 FROM job_postings_fact
 LIMIT 5;

 SELECT
job_title_short AS title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
EXTRACT(MONTH FROM job_posted_date) AS date_month,
EXTRACT(YEAR FROM job_posted_date) AS date_year

 FROM job_postings_fact
 LIMIT 5;

 --Đếm xem có bao nhiêu công việc đƯợc đăng theo từng tháng
 SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
WHERE 
    job_title_short ='Data Analyst'
GROUP BY 
    month
ORDER BY job_posted_count;
