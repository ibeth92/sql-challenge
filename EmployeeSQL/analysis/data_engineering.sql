CREATE TABLE depts
	(dept_no VARCHAR(4),
	dept_name VARCHAR(20),
PRIMARY KEY(dept_no));
	
CREATE TABLE titles
	(title_id VARCHAR(5),
	 title VARCHAR(20),
PRIMARY KEY(title_id));

CREATE TABLE employees
	(emp_no INT,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(15),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date DATE,
PRIMARY KEY(emp_no),
FOREIGN KEY(emp_title_id) REFERENCES titles(title_id));
	
CREATE TABLE deptemp
	(emp_no INT,
	dept_no VARCHAR(30),
PRIMARY KEY(emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) REFERENCES depts(dept_no));

CREATE TABLE managers
	( dept_no VARCHAR(4),
	 emp_no INT,
PRIMARY KEY(emp_no, dept_no),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) REFERENCES depts(dept_no));

CREATE TABLE salaries
	(emp_no INT, 
	salary INT,
PRIMARY KEY(emp_no, salary),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no));