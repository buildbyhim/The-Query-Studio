-- Classify departments into Main Categories
SELECT department,
       CASE
           WHEN department IN ('Clothing', 'Children Clothing') THEN 'Apparel'
           WHEN department IN ('Grocery') THEN 'Food'
           WHEN department IN ('Computers', 'Phones & Tablets', 'Device Repair') THEN 'Electronics'
           WHEN department IN ('Books', 'Games', 'Music', 'Movies') THEN 'Media & Entertainment'
           ELSE 'Other'
       END AS main_category
FROM employees;

-- Identify if a department mainly sells physical or digital goods
SELECT department,
       CASE
           WHEN department IN ('Movies', 'Music', 'Games') THEN 'Digital'
           ELSE 'Physical'
       END AS product_type
FROM employees;

-- Add tags for seasonal departments
SELECT department,
       CASE
           WHEN department IN ('Garden', 'Camping & Fishing', 'Sports') THEN 'Seasonal Outdoor'
           ELSE 'All-Year'
       END AS seasonal_tag
FROM employees;

-- Mark departments for special holiday deals
SELECT department,
       CASE
           WHEN department IN ('Toys', 'Children Clothing', 'Jewelry', 'Beauty', 'Cosmetics') 
                THEN 'Holiday Promo'
           ELSE 'Regular'
       END AS promo_status
FROM employees;

-- Group all health-related departments
SELECT department,
       CASE
           WHEN department IN ('Vitamins', 'Pharmacy', 'First Aid') THEN 'Health & Wellness'
           ELSE 'Non-Health'
       END AS health_category
FROM employees;

-- Assign restocking priority based on demand
SELECT department,
       CASE
           WHEN department IN ('Grocery', 'Pharmacy', 'First Aid') THEN 'High Priority'
           WHEN department IN ('Clothing', 'Computers', 'Phones & Tablets') THEN 'Medium Priority'
           ELSE 'Low Priority'
       END AS restock_priority
FROM employees;

-- Assign different tax rates to departments
SELECT department,
       CASE
           WHEN department IN ('Grocery', 'Pharmacy', 'First Aid') THEN '0% Tax'
           WHEN department IN ('Books', 'Movies', 'Music', 'Games') THEN '5% Tax'
           ELSE '10% Tax'
       END AS tax_rate
FROM employees;

-- Assign commission rates based on department profit margin
SELECT department,
       CASE
           WHEN department IN ('Jewelry', 'Beauty', 'Cosmetics') THEN '15% Commission'
           WHEN department IN ('Computers', 'Phones & Tablets', 'Device Repair') THEN '10% Commission'
           ELSE '5% Commission'
       END AS commission_rate
FROM employees;

-- Flag departments that require specialized product knowledge
SELECT department,
       CASE
           WHEN department IN ('Computers', 'Device Repair', 'Automotive', 'Tools') THEN 'Special Training Required'
           ELSE 'General Staff OK'
       END AS training_requirement
FROM employees;

-- Order departments by predefined business importance
SELECT department
FROM employees
ORDER BY CASE
             WHEN department = 'Grocery' THEN 1
             WHEN department = 'Pharmacy' THEN 2
             WHEN department = 'Computers' THEN 3
             WHEN department = 'Clothing' THEN 4
             ELSE 5
         END;

-- Select employees with 'Medium' salary (100,000–150,000) after classifying salaries into Low, Medium, and High
WITH employees AS (
    SELECT *, 
           CASE 
                WHEN salary < 100000 THEN 'Low'
                WHEN salary BETWEEN 100000 AND 150000 THEN 'Medium'
                ELSE 'High'
           END AS sal_payments_status
    FROM employees 
    INNER JOIN regions
        ON employees.region_id = regions.region_id
)
SELECT *
FROM employees
WHERE sal_payments_status = 'Medium';



























































