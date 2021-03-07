-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON
employees.emp_no=salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SET datestyle = 'ISO,DMY';
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'


-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
	INNER JOIN departments ON 
	dept_manager.dept_no = departments.dept_no
	INNER JOIN employees ON
	employees.emp_no = dept_manager.emp_no


-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON
	departments.dept_no = dept_emp.dept_no
	
	
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
	FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%'


-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
	
	INNER JOIN departments ON 
	dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_no = 'd007'


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp_no
	
	INNER JOIN departments ON 
	dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name, COUNT (employees.last_name) AS count_last_name
FROM employees
GROUP BY employees.last_name
ORDER BY count_last_name DESC

-- My boss has just informed me that my employee number is 499942
SELECT *
FROM employees
WHERE employees.emp_no = 499942