--Subqueries
SELECT *
FROM ( 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

--CTE
WITH january_jobs AS(--CTE definition starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)--CTE end

SELECT *
FROM january_jobs;

--Tim ten cac cong ty ma khong yeu cau bang cap(Chỉ trả về tên công ty)

SELECT name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
) ;

-- Tim công ty có nhiều việc làm nhâts
-- Tổng số việc làm được đăng của mỗi công ty dựa trên company_id(job_posting_fact)
-- Trả về tổng số lượng công việc cùng với tên công ty-company_name(company_dim)
WITH company_job_count AS(
SELECT 
    company_id,
    COUNT(*) as total_jobs
FROM job_postings_fact
GROUP BY company_id
) 

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC

