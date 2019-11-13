--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT  emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM Salaries AS s
INNER JOIN Employees AS e ON
e.emp_no = s.emp_no;

--2. Employees hired in 1986
SELECT first_name, last_name, hire_date 
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
   departments.dept_no,
   departments.dept_name,
   Employees.emp_no,
   Employees.Last_Name,
   Employees.First_Name,
   Dept_Manager.from_date,
   Dept_Manager.to_date
FROM departments 
INNER JOIN Dept_Manager ON Dept_Manager.dept_no = departments.dept_no
INNER JOIN Employees ON Employees.emp_no = Dept_Manager.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name  >> employees
--department name >> dept_emp
SELECT
   e.emp_no,
   e.Last_Name,
   e.First_Name,
   d.dept_name,
FROM Employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no;  
ORDER BY e.emp_no; 

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM Employees 
WHERE First_Name = 'Hercules'  AND Last_Name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
   e.emp_no,
   e.Last_Name,
   e.First_Name,
   d.dept_name,
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
   e.emp_no,
   e.Last_Name,
   e.First_Name,
   d.dept_name,
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name = 'Development' 
OR dp.dept_name = 'Sales';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT Last_Name, COUNT(Last_Name) as last 
FROM Employees
GROUP BY Last_Name
ORDER BY last DESC;