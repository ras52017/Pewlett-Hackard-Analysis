--Deliverable 1: The Number of Retiring Employees by Title (50 points)

--Create a SQL file in the Queries folder of your Pewlett-Hackard-Analysis GitHub folder, and name it
SELECT e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date 
--INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND t.to_date = '9999-01-01' 
ORDER BY e.emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01' 
ORDER BY emp_no, to_date DESC;



-- Write another query in the Employee_Database_challenge.sql file to retrieve
--the number of employees by their most recent job title who are about to retire.
SELECT COUNT(emp_no),title
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

--Deliverable 2: The Employees Eligible for the Mentorship Program (30 points)
SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,t.title,de.from_date,de.to_date
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no

--ORDER BY e.emp_no asc

--Use a DISTINCT ON statement to retrieve the first occurrence
--of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title

INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01' 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY emp_no;







SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title



--INTO mentorship_eligibilty1
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01' 
AND (e.birth_date BETWEEN '1952-01-01' AND '1965-12-31') 
ORDER BY emp_no;

SELECT Max(birth_date)
FROM mentorship_eligibilty1



