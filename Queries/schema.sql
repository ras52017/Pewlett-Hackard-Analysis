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


CREATE TABLE Titles (
  emp_no INT NOT NULL,
  title INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no,title,from_date)
);



CREATE TABLE dept_emp (
  dept_no INT NOT NULL,
  emp_no INT NOT NULL, 
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),		
  PRIMARY KEY (dept_no)
);