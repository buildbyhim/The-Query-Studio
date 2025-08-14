-- Get each employee with their division from the departments table
SELECT e.first_name,
       e.last_name,
       e.department,
       d.division
FROM employees e
INNER JOIN departments d
    ON e.department = d.department;

-- Join employees → departments → regions
-- This gives employee division and country in one query
SELECT e.first_name,
       e.last_name,
       d.division,
       r.country
FROM employees e
INNER JOIN departments d
    ON e.department = d.department
INNER JOIN regions r
    ON r.region = r.region;

-- Only employees in the Electronics division who are in the United States
SELECT e.first_name,
       e.last_name,
       d.division,
       r.country
FROM employees e
INNER JOIN departments d
    ON e.department = d.department
INNER JOIN regions r
    ON r.region = r.region
WHERE d.division = 'Electronics'
  AND r.country = 'United States';

-- Show all departments and any matching employees
SELECT d.department,
       d.division,
       e.first_name,
       e.last_name
FROM departments d
LEFT JOIN employees e
    ON d.department = e.department
ORDER BY d.department;


-- Show all regions and any matching employees
SELECT r.region,
       r.country,
       e.first_name,
       e.last_name
FROM employees e
RIGHT JOIN regions r
    ON r.region = r.region
ORDER BY r.region;

-- Show all department and employee combinations, even if unmatched
SELECT d.department,
       e.first_name,
       e.last_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department = d.department
ORDER BY d.department;

-- Count employees per department, showing departments with zero employees
SELECT d.department,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department = e.department
GROUP BY d.department
ORDER BY employee_count DESC;

-- Match departments and employees, flag missing data
SELECT d.department,
       e.first_name,
       CASE 
           WHEN e.first_name IS NULL THEN 'No Employee Assigned'
           ELSE 'Has Employee'
       END AS status
FROM employees e
FULL OUTER JOIN departments d
    ON e.department = d.department;

-- Join departments and regions, classify as Domestic vs International
SELECT e.first_name,
       e.last_name,
       d.division,
       r.country,
       CASE
           WHEN r.country = 'United States' THEN 'Domestic'
           ELSE 'International'
       END AS market_type
FROM employees e
LEFT JOIN departments d
    ON e.department = d.department
LEFT JOIN regions r
    ON r.region = r.region;




























































































