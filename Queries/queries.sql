-- Creating tables for PH-EmployeeDB
CREATE TABLE departments
		(dept_no VARCHAR(4) NOT NULL,
		dept_name VARCHAR(40) NOT NULL, 
		PRIMARY KEY (dept_no),
		 UNIQUE (dept_name)
		 );
		 
DROP TABLE emplyees		 
CREATE TABLE employees
		(emp_no int,
		birth_date	date NOT NULL,
		first_name	VARCHAR NOT NULL,
		last_name	VARCHAR NOT NULL,
		gender	VARCHAR NOT NULL,
		hire_date	DATE NOT NULL,
		PRIMARY KEY (emp_no)
		);
		
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

DROP TABLE if exists Titles;

CREATE TABLE Titles (
  emp_no INT NOT NULL,
  title VARCHAR(20) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no,title,from_date)
);



CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR (5) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),		
  PRIMARY KEY (emp_no,dept_no)
);

DROP TABLE if exists dept_emp;

select *
from public.titles

select *
from public.departments

select *
from public.dept_emp

select *
from public.dept_manager

select *
from public.employees

select *
from public.salaries


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT *
FROM retirement_info;