-- Get employees earning more than *any* Sports employee
SELECT first_name, salary
FROM employees
WHERE salary > ANY (
  SELECT salary FROM employees WHERE department = 'Sports'
);

-- Get employees earning more than *all* Vitamins employees
SELECT first_name, salary
FROM employees
WHERE salary > ALL (
  SELECT salary FROM employees WHERE department = 'Vitamins'
);

-- Get employees who work in same department as anyone from Kenya
SELECT first_name, department, country
FROM employees INNER JOIN regions ON employees.region_id = regions.region_id
WHERE department = ANY (
  SELECT department FROM employees WHERE country = 'Asia'
);

-- Get employees who are in a different department from *all* employees in 'Camping & Fishing'
SELECT first_name, department
FROM employees
WHERE department <> ALL (
  SELECT department FROM employees WHERE department = 'Camping & Fishing'
);

-- Match salary with any Books employee
SELECT first_name, salary
FROM employees
WHERE salary = ANY (
  SELECT salary FROM employees WHERE department = 'Books'
);

-- Employees earning less than every Computers employee
SELECT first_name, salary
FROM employees
WHERE salary < ALL (
  SELECT salary FROM employees WHERE department = 'Computers'
);

-- Employees with salary greater than *all* salaries in other departments
SELECT first_name, department, salary
FROM employees e
WHERE salary > ALL (
  SELECT salary FROM employees
  WHERE department <> e.department
);

-- Get employees whose department is NOT in a list from Sports and Garden
SELECT first_name, department
FROM employees
WHERE department <> ALL (
  SELECT department FROM employees WHERE department IN ('Sports', 'Garden')
);

-- Check if salary equals any of fixed values (just for logic clarity)
SELECT first_name, salary
FROM employees
WHERE salary = ANY (ARRAY[20000, 40000, 50000]);


-- Employees whose salary matches the *minimum* in any department
SELECT first_name, department, salary
FROM employees
WHERE salary = ANY (
  SELECT MIN(salary) FROM employees GROUP BY department
);




























