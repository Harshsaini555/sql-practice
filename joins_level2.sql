-- Display each department and the number of employees in it.

select d.department_name, count(e.emp_name) as emp_count
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name;

-- Display each department and its average salary.

select d.department_name, avg(e.salary) as avg_salary
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name;

-- Display each department and its highest salary.

select d.department_name, max(e.salary) as max_salary
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name;

-- Display each department and total salary paid in that department.

select d.department_name, sum(e.salary) as total
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name;

-- Show departments having more than 2 employees.

select d.department_name, count(e.emp_name) as emp_count
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name
having count(e.emp_name) > 2;

-- Show departments whose average salary is greater than 65000.

select d.department_name, avg(e.salary) as avg_salary
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name
having avg(e.salary) > 65000;

-- Show departments whose total salary exceeds 200000.

select d.department_name, sum(e.salary) as total
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name
having sum(e.salary) > 200000;

-- Find the department with the highest average salary.


select d.department_name, avg(e.salary) as avg_salary
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name
order by avg(e.salary) desc
limit 1; 

-- Find the department having the maximum number of employees.

select d.department_name, count(e.emp_id)
from employees_join e
inner join departments d
on e.department_id = d.department_id
group by d.department_name
order by count(e.emp_id) desc
limit 1;

-- Display all departments, including those with zero employees.

select d.department_name
from employees_join e
right join departments d
on d.department_id = e.department_id
group by d.department_name;


