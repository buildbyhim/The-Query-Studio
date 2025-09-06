-- show each employee eith the salaty of the previous row (order by salary)
SELECT e.first_name, e.salary, 
     LAG(e.salary, 1) OVER (ORDER BY e.salary DESC) AS prev_salary 
     FROM employees e;
     
-- show each employee with the salary of the next row(order by salary)
 SELECT e.first_name, e.salary, 
      LEAD(e.salary, 1) OVER (ORDER BY e.salary DESC ) AS next_salary 
      FROM employees e;


-- Calculate difference compared to the previous employee's salary 
SELECT e.first_name, e.salary, 
     e.salary - LAG(e.salary) OVER (ORDER BY e.salary DESC) AS diff_from_prev 
     FROM employees e 

-- days between hires using LAG
SELECT e.first_name, e.hire_date,
e.hire_date - LAG(e.hire_date) OVER (ORDER BY e.hire_date) AS  days_since_prev 
FROM employees e;

-- Track next higher salary inside each department
SELECT e.first_name, e.department, e.salary,
       LEAD(e.salary) OVER (PARTITION BY e.department ORDER BY e.salary) AS next_higher_salary
FROM employees e;

-- If salary > previous highest salary, mark as "New Record"
SELECT e.first_name, e.salary,
       CASE WHEN e.salary > LAG(e.salary) OVER (ORDER BY e.salary) THEN 'New Record'
            ELSE 'No Record'
       END AS record_status
FROM employees e;










