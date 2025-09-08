-- Show total salary per division with grand total 
SELECT d.division, SUM(e.salary) AS total_salary
FROM employees e 
INNER JOIN departments d ON e.department = d.department
GROUP BY ROLLUP(d.division);

-- Salary totals per country + overall total
SELECT r.country, SUM(e.salary) AS total_salary
FROM employees e 
INNER JOIN regions r ON e.region_id = r.region_id 
GROUP BY ROLLUP(r.country);

-- Division subtotal department detail and grand total
SELECT d.division, e.department, SUM(e.salary) AS total_salary
FROM employees e 
JOIN departments d ON e.department = d.department 
GROUP BY ROLLUP(d.division, e.department);

-- Add flags to identify subtotal and total rows
SELECT 
  d.division,
  r.country,
  SUM(e.salary) AS total_salary,
  GROUPING(d.division) AS is_division_total,
  GROUPING(r.country) AS is_country_total
FROM employees e
JOIN departments d ON e.department = d.department
JOIN regions r ON e.region_id = r.region_id
GROUP BY CUBE(d.division, r.country);

-- Full breakdown across 3 dimensions
SELECT d.division, r.country, e.gender, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department = d.department
JOIN regions r ON e.region_id = r.region_id
GROUP BY CUBE(d.division, r.country, e.gender);





