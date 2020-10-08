-- -- Creating Employees Table: 
-- CREATE TABLE employees(emp_no INT NOT NULL, 
-- 					   emp_title_id VARCHAR NOT NULL,
-- 					   birth_date date Not Null,
-- 					   first_name VARCHAR NOT NULL,
-- 					   last_name VARCHAR NOT NULL,
-- 					   sex VARCHAR NOT NULL,
-- 					   hire_date date,
-- 					   PRIMARY KEY(emp_no,emp_title_id));
					   
-- -- Creating Departments Table:

-- CREATE TABLE departments(dept_no VARCHAR PRIMARY KEY NOT NULL,
-- 						 dept_name VARCHAR NOT NULL);
-- Creating Department_Employees Table: 

-- CREATE TABLE dept_emp(emp_no INT NOT NULL,
-- 					 dept_no VARCHAR NOT NULL,
-- 					 emp_title_id VARCHAR NOT NULL,
-- 					 FOREIGN KEY (emp_no,emp_title_id) REFERENCES employees (emp_no,emp_title_id),
-- 					 FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
-- 					 PRIMARY KEY (emp_no, dept_no));
					 
-- --Creating Department_Manager Table:
-- CREATE TABLE dept_manager(dept_no VARCHAR NOT NULL,
-- 						 emp_no INT NOT NULL,
-- 						 emp_title_id VARCHAR NOT NULL,
-- 						 FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
-- 					 	 FOREIGN KEY (emp_no,emp_title_id) REFERENCES employees (emp_no,emp_title_id),
-- 						 PRIMARY KEY (dept_no,emp_no));
						 
-- -- Creating Salaries Table:						
-- CREATE TABLE salaries (emp_no INT PRIMARY KEY NOT NULL,
-- 					   emp_title_id VARCHAR(5) NOT NULL,
-- 					   FOREIGN KEY (emp_no, emp_title_id) REFERENCES employees(emp_no, emp_title_id),
-- 					   salary INT);


-- -- Creating Titles Table:	
-- CREATE TABLE titles(emp_title_id  VARCHAR NOT NULL,
-- 					title VARCHAR NOT NULL, 
-- 					emp_no INT NOT NULL,
-- 					FOREIGN KEY (emp_no,emp_title_id) REFERENCES employees(emp_no,emp_title_id),
-- 					PRIMARY KEY (emp_title_id, title));


-- ALTER TABLE dept_emp DROP column emp_title_id;
-- ALTER TABLE salaries DROP column emp_title_id;
-- ALTER TABLE dept_manager DROP column emp_title_id;
-- ALTER TABLE titles DROP column emp_no;

-- SELECT employees.emp_no as Employe_number,employees.last_name, employees.first_name,employees.sex,
-- salaries.salary FROM employees
-- JOIN salaries ON employees.emp_no=salaries.emp_no
-- LIMIT(10);


SELECT first_name,last_name,hire_date FROM employees 
WHERE hire_date > '01-01-1986' and hire_date < '01-01-1987'
LIMIT(10)

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
FROM dept_manager
JOIN employees
ON dept_manager.emp_no=employees.emp_no
JOIN departments 
ON dept_manager.dept_no=departments.dept_no
LIMIT(10)

SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees 
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no

SELECT first_name,last_name,sex FROM employees 
WHERE first_name='Hercules' and last_name like 'B%'
LIMIT(10)

SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees 
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales'
LIMIT 10

SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM employees 
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development'

SELECT employees.last_name,COUNT(*)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(*) DESC;
