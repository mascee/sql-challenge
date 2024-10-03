-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
--Atered after exporting.
DROP TABLE IF EXISTS "dept_emp" CASCADE;
DROP TABLE IF EXISTS "dept_manager" CASCADE;
DROP TABLE IF EXISTS "salaries" CASCADE;
DROP TABLE IF EXISTS "employees" CASCADE;
DROP TABLE IF EXISTS "titles" CASCADE;
DROP TABLE IF EXISTS "departments" CASCADE;


CREATE TABLE "departments" (
    "dept_no" VARCHAR PRIMARY KEY,
    "dept_name" VARCHAR NOT NULL
);
SELECT * FROM departments;

CREATE TABLE "titles" (
    "title_id" VARCHAR PRIMARY KEY,
    "title" VARCHAR NOT NULL
);

SELECT * FROM titles;


CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "title_id" VARCHAR NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_employees_title_id" FOREIGN KEY ("title_id") REFERENCES "titles" ("title_id")
);
SELECT * FROM employees;


CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

SELECT * FROM dept_emp;


CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);
SELECT * FROM dept_manager;


CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);
SELECT * FROM salaries;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    employee.emp_no,
    employee.last_name,
    employee.first_name,
    employee.sex,
    salary.salary
FROM 
    employees AS employee
JOIN 
    salaries AS salary ON employee.emp_no = salary.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
    employees.last_name,
    employees.first_name
FROM 
    dept_manager
JOIN 
    departments ON dept_manager.dept_no = departments.dept_no
JOIN 
    employees ON dept_manager.emp_no = employees.emp_no;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    dept_emp.dept_no,
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM 
    dept_emp
JOIN 
    employees ON dept_emp.emp_no = employees.emp_no
JOIN 
    departments ON dept_emp.dept_no = departments.dept_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' 
    AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	dept_emp.emp_no,
    employees.last_name,
    employees.first_name,
	'Sales' AS department_name
FROM
	dept_emp
JOIN
    employees ON dept_emp.emp_no = employees.emp_no
WHERE
    dept_emp.dept_no = 'd007';
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    dept_emp.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
FROM
    dept_emp
JOIN
    employees ON dept_emp.emp_no = employees.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE
    dept_emp.dept_no IN ('d007', 'd005');
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	last_name,
	COUNT (*) AS frequency
FROM
	employees
GROUP BY
	last_name
ORDER BY
	frequency DESC;
	