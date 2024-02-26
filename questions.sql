-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME as WORKER_NAME FROM worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select UPPER(first_name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT(DEPARTMENT) FROM worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME, 1, 3) from worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
select position('b' in first_name) from worker where first_name = 'Amitabh';


-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select RTRIM(first_name) from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(first_name) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT(DEPARTMENT), length(DEPARTMENT) from worker;


-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

SELECT REPLACE(first_name, 'a', 'A') from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(first_name, ' ', last_name) as COMPLETE_NAME from worker;



-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * from worker ORDER BY first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * from worker ORDER BY first_name, department DESCl;


-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker where FIRST_NAME IN ('Vipul', 'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker where FIRST_NAME NOT IN ('Vipul', 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * from worker where DEPARTMENT LIKE 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM worker where FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where first_name LIKE '%a';


-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM worker where FIRST_NAME LIKE '______h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM worker where SALARY between 100000 AND 500000;


-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker WHERE EXTRACT(YEAR FROM joining_date) = 2014 AND EXTRACT(MONTH FROM joining_date) = 2;


-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT COUNT(department) from worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.

SELECT  CONCAT(FIRST_NAME, ' ', LAST_NAME) FROM worker where SALARY between 50000 and 100000

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT DEPARTMENT, COUNT(worker_id) as no_of_worker from worker group by department ORDER BY no_of_worker desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

-- This will join both the table.
SELECT * FROM worker as w INNER JOIN title as t on w.worker_id = t.worker_ref_id;
-- This will show the details of the manager.
SELECT * FROM worker as w INNER JOIN title as t on w.worker_id = t.worker_ref_id WHERE t.worker_title = 'Manager';
-- This will show the details of worker who is manager by removing the details of the title table colums
SELECT W.* FROM worker as w INNER JOIN title as t on w.worker_id = t.worker_ref_id WHERE t.worker_title = 'Manager';


-- Q-25. Write an SQL query to fetch number(more than 1) of same titles in the ORG of different types.
SELECT worker_title, count(*) FROM title group by worker_title HAVING COUNT(*) > 1;

-- Q-26. Write an SQL query to show only odd rows from the table.
SELECT * FROM worker WHERE MOD(WORKER_ID, 2) != 0;
SELECT * FROM worker WHERE MOD(WORKER_ID, 2) <> 0;


-- Q-27. Write an SQL query to show only even rows from the table.
SELECT * FROM worker WHERE MOD(WORKER_ID, 2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
-- Clones all the schema but not data
CREATE TABLE worker_clone LIKE worker;
--Insert all the data into the cloned table.
INSERT INTO worker_clone SELECT * FROM worker;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.
-- No intersect keyword in postgres
SELECT worker.* FROM Worker INNER JOIN worker_clone using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT worker.* FROM worker LEFT JOIN worker_clone USING(worker_id) WHERE worker_clone.worker_id IS NULL;

-- Q-31. Write an SQL query to show the current date and time. 
SELECT curdate();
SELECT now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary. 
SELECT * FROM worker ORDER BY salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table. 
SELECT * FROM worker ORDER BY salary desc LIMIT 4,1; -- Start from 4 and take 1. This will show the 5th salary. 

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword. 
-- Using co-related sub query. 

SELECT salary from worker w1
WHERE 4 = (
    SELECT COUNT(DISTINCT (w2.salary))
    FROM worker w2
    WHERE w2.salary >= w1.salary
);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT w1.* FROM worker w1, worker w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id;



