--Run below query to list the following details of each employee: 
	--employee number
	--last name
	--first name
	--gender
	--salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
JOIN employees AS e ON
e.emp_no = s.emp_no;

--Run below query to list employees who were hired in 1986
SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Run below query to list the manager of each department with: 
	--department number
	--department name
	--the manager's employee number
	--last name
	--first name
	--start date 
	--end date
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
JOIN departments AS d ON
d.dept_no = dm.dept_no
JOIN employees AS e ON
dm.emp_no = e.emp_no;	

--Run below query to list the department of each employee with:
	--employee number
	--last name
	--first name
	--department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON
e.emp_no = de.emp_no
JOIN departments AS d ON
de.dept_no = d.dept_no;

--Run below query to list all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Run below query to list all employees in the Sales department with:
	--employee number
	--last name
	--first name
	--department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON
e.emp_no = de.emp_no
JOIN departments AS d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--Run below query to list all employees in the Sales and Development departments with: 
	--employee number
	--last name
	--first name
	--department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON
e.emp_no = de.emp_no
JOIN departments AS d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';	

--Run below query to list the frequency count of employee last names in descending order
SELECT last_name, COUNT(last_name) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;
