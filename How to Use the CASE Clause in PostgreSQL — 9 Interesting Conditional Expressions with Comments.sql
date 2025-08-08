-- Convert 'M' and 'F' into full words
SELECT first_name, gender,
  CASE gender
    WHEN 'M' THEN 'Male'
    WHEN 'F' THEN 'Female'
    ELSE 'Other'
  END AS gender_full
FROM employees;

-- Employees earning over 100K get a bonus
SELECT first_name, salary,
  CASE 
    WHEN salary > 100000 THEN 'Eligible'
    ELSE 'Not Eligible'
  END AS bonus_status
FROM employees;

-- Show onboarding year category
SELECT first_name, hire_date,
  CASE 
    WHEN EXTRACT(YEAR FROM hire_date) < 2006 THEN 'Veteran'
    WHEN EXTRACT(YEAR FROM hire_date) BETWEEN 2015 AND 2007 THEN 'Experienced'
    ELSE 'New Joiner'
  END AS employee_type
FROM employees;

-- Give departments friendly labels
SELECT department,
  CASE 
    WHEN department = 'sports' THEN 'Fitness Squad'
    WHEN department = 'furniture' THEN 'Comfort Creators'
    WHEN department = 'clothing' THEN 'Style Experts'
    ELSE 'Support Crew'
  END AS team_label
FROM employees;

-- Prioritize departments in custom order
SELECT first_name, department
FROM employees
ORDER BY 
  CASE department
    WHEN 'IT' THEN 1
    WHEN 'Finance' THEN 2
    ELSE 3
  END;

-- Flag employees earning above or below their department average
SELECT first_name, department, salary,
  CASE 
    WHEN salary > (
      SELECT AVG(salary) FROM employees e2 WHERE e2.department = e1.department
    ) THEN 'Above Average'
    ELSE 'Below Average'
  END AS salary_position
FROM employees e1;

-- Simple grading logic
SELECT first_name, salary,
  CASE 
    WHEN salary >= 120000 THEN 'A'
    WHEN salary >= 90000 THEN 'B'
    WHEN salary >= 60000 THEN 'C'
    ELSE 'D'
  END AS salary_grade
FROM employees;

-- Give salary raises based on department
UPDATE employees
SET salary = salary + 
  CASE 
    WHEN department = 'IT' THEN 5000
    WHEN department = 'HR' THEN 3000
    ELSE 1000
  END;

-- Add nested logic to further customize result
SELECT first_name, department, salary,
  CASE 
    WHEN department = 'Sales' THEN 
      CASE 
        WHEN salary > 100000 THEN 'Top Sales'
        ELSE 'Regular Sales'
      END
    ELSE 'Non-Sales Staff'
  END AS role_category
FROM employees;


























































