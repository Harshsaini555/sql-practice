-- Show employees from Delhi AND salary greater than 70000.

select emp_name, salary from employees where city = 'Delhi' && salary > 70000;

Find employees whose names start with 'P'.

select * from employees where emp_name Like 'P%';

-- Find employees whose names end with 'a'.
select * from employees where emp_name Like '%a';

-- Find employees whose names contain 'an'.
select * from employees where emp_name Like '%an%';

-- Show employees whose salary is between 50000 and 80000.
select * from employees where salary between 50000 and 80000;

-- Show employees whose age is between 25 and 30.
select * from employees where age between 25 and 30;

-- Show employees from Delhi, Mumbai, and Pune.
select * from employees where city IN('Delhi', 'Mumbai', 'Pune');

-- Display all employees sorted by salary in ascending order.
select * from employees order by salary asc;

-- Display the top 5 highest-paid employees.
select * from employees order by salary DESC limit 5;

-- Show the names, salary, and city of employees who:
-- belong to IT department
-- salary > 70000
-- city is Delhi OR Mumbai
-- sort by salary descending
select emp_name,salary,city
from employees 
where department = 'IT' 
AND salary > 70000 
AND city = 'Delhi' or city ='Mumbai' 
order by salary desc;