--ALTER TABLE table_name
--ADD column_name datatype;
--RENAME COLUMN column_name TO new_name;
--ALTER COLUMN column_name TYPE datatype;
--DROP COLUMN column_name;


--ADD
ALTER TABLE job_applied
ADD contact VARCHAR(50);

SELECT * FROM job_applied;

--RENAME
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;


--ALTER COLUMN
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

-- LENH DUOI SE KHONG CHAY DUOC VI KHONG CO SU LIEN
-- QUAN GIUA 2 kieu du lieu moi va cu
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE INT;

--DROP COLUMN
ALTER TABLE job_applied
DROP COLUMN contact_name;

