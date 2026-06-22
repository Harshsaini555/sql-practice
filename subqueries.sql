-- Find employees whose salary is greater than the average salary of all employees.
select * from employees_join where salary > (select avg(salary) from employees_join);

-- Find the employee(s) earning the highest salary.

select * from employees_join where salary >= (select max(salary) from employees_join);

-- Find employees whose salary is less than the average salary.

select * from employees_join where salary < (select avg(salary) from employees_join);

-- Find employees who earn exactly the average salary.

select * from employees_join where salary = (select avg(salary) from employees_join);

-- Find all employees working in the IT department without using JOIN.

select emp_name from employees_join where department_id = (select department_id from departments where department_name = 'IT');

-- Find all employees working in the Finance department without using JOIN.

select emp_name from employees_join where department_id = (select department_id from departments where department_name = 'Finance');

-- Find employees whose department is either IT or HR using a subquery

select emp_name from employees_join where department_id IN (select department_id from departments where department_name IN('IT','Finance'));
-- when subquery returns multiple rows then use IN

-- Find employees who are not in the Marketing department using a subquery.

select emp_name from employees_join where department_id NOT IN (select department_id from departments where department_name = 'Marketing');

-- when subquery returns multiple rows then use NOT IN and IN