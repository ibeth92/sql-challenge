--DATA ENGINEERING
--Use the information you have to create a table schema for each of the six CSV files
--Create table for titles.csv
CREATE TABLE titles(
	title_id VARCHAR(5),
	title VARCHAR(100) UNIQUE NOT NULL,
PRIMARY KEY(title_id)
);
--Create table for employees.csv
CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	sex VARCHAR(1),
	hire_date DATE,
PRIMARY KEY(emp_no),
FOREIGN KEY(emp_title_id) 
	REFERENCES titles(title_id)
);
--Create table for depts.csv
CREATE TABLE depts(
	dept_no VARCHAR(4),
	dept_name VARCHAR(100) UNIQUE NOT NULL,
PRIMARY KEY(dept_no)
);
--Create table for deptemp.csv
CREATE TABLE deptemp(
	emp_no INT,
	dept_no VARCHAR(4),
PRIMARY KEY(emp_no, dept_no),
FOREIGN KEY (emp_no) 
	REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) 
	REFERENCES depts(dept_no)
);
--Create table for managers.csv
CREATE TABLE managers(
	dept_no VARCHAR(4),
	emp_no INT,
PRIMARY KEY(emp_no, dept_no),
FOREIGN KEY(emp_no) 
	REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) 
	REFERENCES depts(dept_no)
);
--Create table for salaries.csv
CREATE TABLE salaries(
	emp_no INT, 
	salary INT,
PRIMARY KEY(emp_no, salary),
FOREIGN KEY(emp_no) 
	REFERENCES employees(emp_no)
);