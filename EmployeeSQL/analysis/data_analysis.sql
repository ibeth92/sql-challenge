--DATA ANALYSIS 
--1. List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
	ON e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986
--Use EXTRACT() to extract year from date
SELECT e.last_name, e.first_name, e.hire_date
FROM employees AS e
	WHERE EXTRACT(year FROM	hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
--Use JOIN() 
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name,	e.first_name
FROM employees AS e
INNER JOIN managers AS dm 
	ON dm.emp_no = e.emp_no
INNER JOIN depts AS d 
	ON d.dept_no = dm.dept_no
	WHERE dm.emp_no = e.emp_no AND dm.dept_no = d.dept_no
	ORDER BY e,emp_no;
	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name,	d.dept_name
FROM employees AS e
INNER JOIN deptemp AS de ON de.emp_no = e.emp_no
INNER JOIN depts AS d ON d.dept_no = de.dept_no
	WHERE 1=1
	ORDER by 2,3;
	
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT e.first_name, e.last_name,	e.sex
FROM employees AS e
	WHERE e.first_name = 'Hercules' AND e.last_name >='B' AND last_name <'C';
	
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN deptemp AS de ON de.emp_no = e.emp_no
INNER JOIN depts AS d ON d.dept_no = de.dept_no
	WHERE d.dept_name =	'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e. last_name, 	e.first_name,	d.dept_name
FROM employees e
INNER JOIN deptemp de ON de.emp_no = e.emp_no
INNER JOIN depts d ON d.dept_no = de.dept_no
	WHERE d.dept_name IN 	('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT e.last_name,
	COUNT(*)
FROM employees e
	GROUP BY e.last_name
	ORDER BY 2 DESC;
