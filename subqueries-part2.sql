-- Find departments whose average salary is greater than the company-wide average salary.
select department_name
from departments
where department_id IN
(select department_id
from employees_join
group by department_id
having avg(salary) > (select avg(salary) from employees_join));

-- sol with joins

select d.department_name
from departments d
inner join employees_join e
on d.department_id = e.department_id
group by d.department_name
having avg(e.salary) > (
	select avg(salary)
    from employees_join
);

-- Find departments whose maximum salary is greater than the overall average salary.

select department_name
from departments
where department_id in
	(select department_id
	from employees_join 
	group by department_id
    having max(salary) > (
		select max(salary)
        from employees_join
        )
);

-- Find the second highest salary.

select max(salary) from employees_join where salary < (select max(salary) from employees_join);

-- Find the employee(s) having the second highest salary.

select emp_name, salary from employees_join where salary < (select max(salary) from employees_join)
order by salary desc
limit 1;

-- Find the third highest salary.

SELECT MAX(salary) AS third_highest_salary
FROM employees_join
WHERE salary < (
    SELECT MAX(salary)
    FROM employees_join
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees_join
    )
);

-- correlated subqueries

-- Find employees whose salary is greater than the average salary of their own department.

select department_id, emp_name, salary
from employees_join e1
where salary >
(select avg(salary)
from employees_join e2
where e2.department_id = e1.department_id
);

-- Find employees whose salary is the highest in their department.

SELECT emp_name,
       department_id,
       salary
FROM employees_join e1
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees_join e2
    WHERE e2.department_id = e1.department_id
);

-- Find employees whose salary is below their department average.

SELECT emp_name,
       department_id,
       salary
FROM employees_join e1
WHERE salary <
(
    SELECT avg(salary)
    FROM employees_join e2
    WHERE e2.department_id = e1.department_id
);

-- Find departments that have no employees.

SELECT d.department_name
FROM employees_join e
right JOIN departments d
ON e.department_id = d.department_id
WHERE e.emp_id IS NULL;

-- subquery

SELECT department_name
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees_join
    WHERE department_id IS NOT NULL
);

-- Try using a subquery instead of a JOIN.

-- Find employees working in departments that have more than 2 employees.

select emp_name
from employees_join
where department_id IN 
( select department_id
from employees_join
group by department_id
having count(*) > 2
);


-- Find the department(s) with the highest average salary.

select d.department_name, avg(e.salary) as AVG_SAL
from employees_join e
inner join departments d
on d.department_id = e.department_id
group by d.department_name
order by AVG_SAL DESC
limit 1;







-- (Not just one row—think about ties.)