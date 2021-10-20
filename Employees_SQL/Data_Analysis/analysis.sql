-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no AS Employee_Number, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
JOIN Salaries 
	ON Employees.emp_no = Salaries.emp_no
LIMIT (10);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees 
WHERE Employees.hire_date > '1986-1-1'::date 
AND Employees.hire_date < '1987-1-1'::date
LIMIT(10);

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Departments.dept_no, Departments.dept_name, 
	   Employees.emp_no, Employees.last_name, 
	   Employees.first_name
FROM Employees
JOIN Dept_managers
	ON Employees.emp_no=Dept_managers.emp_no
JOIN Departments
	ON Departments.dept_no=Dept_managers.dept_no
LIMIT(10);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name 
FROM Employees
JOIN Dept_emp
	ON (Employees.emp_no = Dept_emp.emp_no)
JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no)
LIMIT(10);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT Employees.first_name, Employees.last_name, Employees.sex 
FROM Employees
WHERE first_name = 'Hercules' 
AND last_name like 'B%'
LIMIT(10);
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name 
FROM Employees
JOIN Dept_emp
	ON (Employees.emp_no = Dept_emp.emp_no)
JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no)
		WHERE Departments.dept_name='Sales'
LIMIT(10);

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name 
FROM Employees
JOIN Dept_emp
	ON (Employees.emp_no = Dept_emp.emp_no)
JOIN Departments
	ON (Departments.dept_no = Dept_emp.dept_no)
		WHERE Departments.dept_name='Sales' OR Departments.dept_name='Development'
LIMIT(10);

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT Employees.last_name, Count (*)
FROM Employees
GROUP BY Employees.last_name
ORDER BY Count (*) DESC;