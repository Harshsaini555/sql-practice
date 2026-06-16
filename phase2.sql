-- Aggregate Functions + GROUP BY + HAVING
-- What You'll Learn
-- Aggregate Functions
COUNT()
SUM()
AVG()
MAX()
MIN()

-- Examples:

SELECT COUNT(*) FROM employees;

SELECT AVG(salary) FROM employees;

SELECT MAX(salary) FROM employees;
GROUP BY

-- Used when you want results per category.

-- Example:

SELECT department, COUNT(*)
FROM employees
GROUP BY department;

Output:

-- department	count
-- IT	6
-- HR	3
-- Finance	3
-- Marketing	3

HAVING

-- WHERE filters rows before grouping.

-- HAVING filters groups after grouping.

Example:

SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- Where filters rows

select count(*) from employees;

select SUM(salary) from employees;

select max(salary) - min(salary) from employees;

select department,avg(salary)
from employees
group by department;

-- Find the highest salary in each department.

select department,max(salary)
from employees
group by department;

-- Find total salary paid in each department.

select department,sum(salary)
from employees
group by department;

-- Count employees in each city.

select city,count(*)
from employees
group by city;

-- Find average age in each department.

select department,avg(age)
from employees
group by department;

-- Show departments having more than 3 employees.

select department,count(*)
from employees
group by department
having count(*) > 3;

-- Show departments whose average salary is greater than 70000.

select department,avg(salary)
from employees
group by department
having avg(salary) > 70000;

-- Show cities having at least 2 employees.

select city,count(*)
from employees
group by city
having count(*) > 2;

-- Show departments where maximum salary exceeds 85000

select department,max(salary) as max_salary
from employees
group by department
having max(salary) > 85000;

-- Find the department with the highest average salary.

select department,avg(salary) as avg_salary
from employees
group by department
order by avg(salary) desc
limit 1;

-- Find the city having the maximum number of employees.

select city, count(*) as total_employees
from employees
group by city
order by count(*) desc
limit 1;