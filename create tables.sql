      
-- Create a Departments table
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE  departments (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Create a Titles table
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE  titles (
    title_id CHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

-- Create a Employees table
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE  employees (
    emp_no INT PRIMARY KEY,
    emp_title CHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY(emp_title) REFERENCES titles(title_id)
);

-- Create a Department Employee table
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE  dept_emp (
    emp_no INT NOT NULL,
	dept_no CHAR(4) NOT NULL,
    PRIMARY KEY(emp_no,dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- Create a Department Manager table
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE  dept_manager (
    dept_no CHAR(4) NOT NULL,
	emp_no INT NOT NULL,
    PRIMARY KEY(dept_no,emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

-- Create a Salaries table
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE  salaries (
    emp_no INT NOT NULL,
	salaries INT NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

