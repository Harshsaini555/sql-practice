-- Display every employee with ROW_NUMBER().
-- Display every employee with RANK().
-- Display every employee with DENSE_RANK().
-- Find the 2nd highest salary using DENSE_RANK().
-- Find the 3rd highest salary using DENSE_RANK().

-- Function	              Meaning
-- ROW_NUMBER()	          Give every row a unique number
-- RANK()	              Same rank for ties, skip numbers
-- DENSE_RANK()	          Same rank for ties, no gaps
-- PARTITION BY	          Restart calculation for each group
-- LEAD()	              Look at the next row
-- LAG()	              Look at the previous row

select emp_name,salary,department_id, row_number() over(order by salary desc) as row_num
from employees_join;

select emp_name, salary department_id , rank() over(order by salary desc) as rnk
from employees_join;

select salary from
(
	select salary,
    dense_rank() over(order by salary desc) as rnk
    from employees_join
) t
where rnk = 10;

-- Rank employees within each department.
-- Find the highest-paid employee in each department.
-- Find the top 2 highest-paid employees in each department.
-- Find the lowest-paid employee in each department.
-- Find the second highest-paid employee in each department

select emp_name, salary,
	   department_id,
       dense_rank() over(
       partition by department_id
       order by salary desc
       ) as rn
from employees_join;