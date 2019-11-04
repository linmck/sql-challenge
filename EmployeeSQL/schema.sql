-- Create Employee table
CREATE TABLE employees (
	emp_no INT NOT NULL UNIQUE,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

-- Create Titles table
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(100) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, title, from_date, to_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create Salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary MONEY NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create Departments table
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL UNIQUE,
	dept_name VARCHAR(100),
	PRIMARY KEY (dept_no)
);

-- Create Department Manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create Department Employee table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);