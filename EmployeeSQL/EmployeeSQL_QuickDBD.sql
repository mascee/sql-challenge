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


