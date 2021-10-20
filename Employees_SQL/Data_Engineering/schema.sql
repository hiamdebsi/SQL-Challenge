-- Data Engineering 

-- Create the table for the Title Data 
CREATE TABLE Titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

-- Create the table for the Employees Data
CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- Create the table for the Salaries Data
CREATE TABLE Salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create the table for the Departments Data
CREATE TABLE Departments (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30)
);

-- Create the table for the Department Managers Data
CREATE TABLE Dept_managers (
	dept_no VARCHAR(30),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Create the table for the Department Employees Data
CREATE TABLE Dept_emp (
	emp_no INT,
	dept_no VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
