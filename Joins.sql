CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing'),
(5,'Sales');

CREATE TABLE employees_join (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    department_id INT
);

INSERT INTO employees_join VALUES
(101,'Harsh',70000,'Delhi',1),
(102,'Rahul',45000,'Mumbai',2),
(103,'Priya',80000,'Delhi',1),
(104,'Ankit',60000,'Pune',3),
(105,'Neha',50000,'Delhi',2),
(106,'Rohan',90000,'Bangalore',1),
(107,'Simran',55000,'Chandigarh',4),
(108,'Karan',75000,'Mumbai',3),
(109,'Aman',65000,'Pune',1),
(110,'Pooja',58000,'Delhi',4),
(111,'Deepak',48000,'Bangalore',NULL);

-- Display employee name and department name.

select e.emp_name,d.department_name
from employees_join e
inner join departments d
on e.department_id = d.department_id;

-- Display all employee details with department names.

select e.*, d.department_name
from employees_join e
left join departments d
on e.department_id = d.department_id;

-- Display employees whose department is IT.

SELECT e.*, d.department_name
FROM employees_join e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';

-- Display employees whose department is HR.

SELECT e.*, d.department_name
FROM employees_join e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'HR';

-- Display employee names and salaries whose department is Finance.

select e.emp_name, e.salary, d.department_name
from employees_join e
inner join departments d
on e.department_id = d.department_id and d.department_name = 'Finance';

-- Display all employees including those without departments.

select e.emp_name,d.department_name
from employees_join e
left join departments d
on e.department_id = d.department_id;

-- Find employees whose department is NULL.

select e.emp_name,d.department_name
from employees_join e
left join departments d
on e.department_id = d.department_id
where d.department_id IS NULL;

-- Display all departments including departments without employees.

select e.emp_name,d.department_name
from employees_join e
right join departments d
on e.department_id = d.department_id;

-- Find departments having no employees

SELECT d.department_name
FROM employees_join e
RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE e.emp_id IS NULL;

-- Display employee name, department name and salary sorted by salary descending.

select e.emp_name, e.salary ,d.department_name
from employees_join e
inner join departments d
on e.department_id = d.department_id
order by salary desc;