DROP TABLE departments;

CREATE TABLE departments (
    dept_no VARCHAR(100) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);
SELECT * FROM departments;

DROP TABLE dept_emp;
CREATE TABLE dept_emp(
	emp_no INTEGER PRIMARY KEY,
	dept_no VARCHAR(100)
	--FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_emp;


DROP TABLE dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR(100),
    emp_no INTEGER,
    --PRIMARY KEY (dept_no, emp_no),
    --FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    --FOREIGN KEY (emp_no) REFERENCES dept_emp (emp_no)
);

SELECT * FROM dept_manager;


DROP TABLE employees;
CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(100) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(50),
	sex VARCHAR(30),
	hire_date DATE

);

SELECT * FROM employees;

DROP TABLE salaries;
CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER,
	--PRIMARY KEY (emp_no, salary)
);

SELECT * FROM salaries;

DROP TABLE titles;
CREATE TABLE titles(
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(50)
);

SELECT * FROM salaries;