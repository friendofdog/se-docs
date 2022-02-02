-- get all employees ordered by salary, ascending
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary ASC;

-- get all unique salary values by job
SELECT DISTINCT job_id, salary
FROM employees
ORDER BY job_id, salary DESC;

-- get all employees, sorted & paginated, page 2
SELECT first_name, last_name
FROM employees
ORDER BY last_name
LIMIT 5 OFFSET 5;

-- get second highest-paid employee(s)
SELECT first_name, last_name, salary
FROM employees
WHERE salary=(
  SELECT DISTINCT salary
  FROM employees
  ORDER BY salary DESC
  LIMIT 1 OFFSET 1
);

-- get second highest-paid employee(s) (FETCH OFFSET)
SELECT first_name, last_name, salary 
FROM employees
WHERE salary=(
  SELECT DISTINCT salary
  FROM employees
  ORDER BY salary DESC
  FETCH NEXT 1 ROW ONLY
  OFFSET 1 ROW
);

-- get employees with names second letter is 'o'
SELECT first_name, last_name, salary 
FROM employees
WHERE first_name LIKE '_o%';

-- get employees whose salary is >= than everyone's in dept ID 8
SELECT first_name, last_name, salary 
FROM employees
WHERE salary >= ALL (
  SELECT salary
  FROM employees
  WHERE department_id=8
)
ORDER BY salary ASC;

-- get employees whose salary is < than anyone's in dept ID 8
SELECT first_name, last_name, salary 
FROM employees
WHERE salary < ANY (
  SELECT salary
  FROM employees
  WHERE department_id=8
)
ORDER BY salary ASC;

-- get name of employees in Administration dept
SELECT first_name, last_name
FROM employees
WHERE department_id in (
  SELECT department_id FROM departments
  WHERE department_name='Administration'
);

-- get average salary by manager id
SELECT first_name, last_name, manager_id,
AVG(salary) OVER (PARTITION BY manager_id) as avg_salary
FROM employees;

-- get employees who have dependents
SELECT first_name, last_name FROM employees e
WHERE EXISTS (
  SELECT 1 FROM dependents d
  WHERE d.employee_id = e.employee_id
);

-- get employees with salary code
SELECT first_name, last_name,
CASE
  WHEN salary > 10000 THEN 'abc'
  ELSE 'def'
END salary_code
FROM employees e;

-- get employees belonging to dept IDs 1,2,3
SELECT first_name, last_name, e.department_id, department_name
FROM employees e
  INNER JOIN departments d
  ON d.department_id = e.department_id
WHERE e.department_id IN (1,2,3);

-- get underpaid employees
SELECT first_name, last_name, salary, e.job_id, j.job_id, j.job_title, j.min_salary
FROM employees e
  INNER JOIN jobs j
  ON j.min_salary > e.salary
WHERE e.job_id = j.job_id;

-- get name, title, dept of everyone with salary > 10000
SELECT e.first_name, e.last_name, j.job_title, d.department_name
FROM employees e
  INNER JOIN jobs j ON j.job_id = e.job_id
  INNER JOIN departments d ON d.department_id = e.department_id
WHERE e.salary > 10000;

-- get region, country, address, city
SELECT r.region_name, c.country_name, l.street_address, l.city
FROM regions r
  LEFT JOIN countries c ON c.region_id = r.region_id
  LEFT JOIN locations l ON l.country_id = c.country_id
WHERE c.country_id IN ('US', 'UK', 'CN');
