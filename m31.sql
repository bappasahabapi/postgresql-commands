--                          TODO:01
--*  -> 01. Foreign Key Constraint And Data Integrity <-

-- we have two table 
--!                         employee table
-- Each employee belongs to a department 

SELECT * FROM Employee;
CREATE Table Employee(
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(255) NOT NULL,
    departmentId INT,

    CONSTRAINT  fk_constraint_dept
         FOREIGN KEY (departmentId) 
         REFERENCES Department(deptId)
);

INSERT INTO Employee VALUES(1,'bappa',1);





--!                         department table
-- Each department has many employees
SELECT * FROM Department;

CREATE Table Department(
    deptId SERIAL PRIMARY KEY,
    deptName VARCHAR(255)
);

INSERT INTO Department VALUES(1,'CSE');




--                      TODO:02
--*  -> 02.  Updation And Deletion  <-

CREATE Table courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_date DATE
);

SELECT * FROM courses;

INSERT INTO
    courses(course_name, description, published_date)
VALUES
    ('cse','computer science','2023-08-12'),
    ('eee','electric science','2022-08-14'),
    ('bba','business science',NULL),
    ('ase',NULL,NULL),
    ('postgres','post science','2019-08-02');
-- update database table row
UPDATE courses
SET 
course_name='update',
description ='update this part'
-- WHERE course_id=4;
-- WHERE course_id>4;
WHERE course_id=1 OR course_id=4;

--! Delete

DELETE FROM courses
WHERE course_id=5;



--                      TODO:03
--*  ->           03. SELECT Basic <-

CREATE TABLE IF NOT EXISTS departments (
    deptID SERIAL PRIMARY key,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS employees(
    empID SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    salary INTEGER NOT NULL,
    joiningDate DATE NOT NULL,
    deptID INTEGER NOT NULL,
    CONSTRAINT fk_deptID
        FOREIGN KEY(deptID)
        REFERENCES departments(deptID)

);


INSERT INTO departments 
VALUES
    (1,'IT'),
    (2,'HR'),
    (3,'MARKETING'),
    (4,'FINACE'),
    (5,'SALES');

INSERT INTO employees (name,email, salary, joiningDate, deptID)
VALUES
    ('appa','a@gmail.com',20000,'2023-08-12',1);
   
INSERT INTO employees(name, email, salary, joiningDate, deptID)
VALUES
    ('bappa', 'b@gmail.com', 22000, '2022-08-14', 1),
    ('cappa', 'c@gmail.com', 18000, '2022-08-14', 2),
    ('dappa', 'd@gmail.com', 25000, '2022-08-14', 2),
    ('eappa', 'e@gmail.com', 21000, '2019-08-02', 3),
    ('fappa', 'f@gmail.com', 23000, '2021-01-20', 5),
    ('gappa', 'g@gmail.com', 27000, '2023-03-05', 2),
    ('happa', 'h@gmail.com', 19000, '2023-02-15', 3),
    ('iappa', 'i@gmail.com', 24000, '2022-10-10', 1),
    ('jappa', 'j@gmail.com', 26000, '2023-01-10', 5),
    ('kappa', 'k@gmail.com', 20000, '2022-11-25', 5),
    ('lappa', 'l@gmail.com', 28000, '2021-07-12', 5),
    ('mappa', 'm@gmail.com', 30000, '2020-06-18', 3),
    ('nappa', 'n@gmail.com', 23000, '2019-09-05', 3),
    ('oappa', 'o@gmail.com', 21000, '2023-04-17', 1),
    ('pappa', 'p@gmail.com', 26000, '2022-08-20', 3),
    ('qappa', 'q@gmail.com', 22000, '2021-12-10', 3),
    ('rappa', 'r@gmail.com', 24000, '2020-05-22', 1),
    ('sappa', 's@gmail.com', 27000, '2019-11-15', 2),
    ('tappa', 't@gmail.com', 19000, '2023-03-25', 3),
    ('uappa', 'u@gmail.com', 25000, '2022-09-10', 1);

-------------------------------- 
SELECT * FROM departments;
SELECT * FROM employees;
SELECT 
    name,
    email,
    salary
FROM employees;

select * from employees
-- where salary > 25000;
-- where salary > 25000 and deptID=3;
where joiningDate > '2022-09-03';




--                      TODO:04
--*  ->           03. Limit And Offset <-

select * from employees
ORDER BY name ASC;

SELECT * FROM employees
ORDER BY name DEC;

SELECT * FROM employees
ORDER BY name 
ASC LIMIT 5;

SELECT * FROM employees
ORDER BY name 
ASC LIMIT 5 OFFSET 1;


--! find highest /2nd heghest salary
 SELECT * FROM employees
 ORDER BY salary DESC
 LIMIT 1;
 
 SELECT * FROM employees
 ORDER BY salary DESC
 LIMIT 3 ;

 --- find the 3rd heghest salary
 SELECT * FROM employees
 ORDER BY salary DESC
 LIMIT 1 OFFSET 2;


-- Active: 1691336670489@@127.0.0.1@5432@module_31@public
--                      TODO:05
--*  ->           More Select And Like Operator <-

--!             IN/ NOT IN/ BETWEEN / LIKE

SELECT * FROM employees WHERE empid IN(2,3,5);
SELECT * FROM employees WHERE empid NOT IN(2,3,5);
SELECT * FROM employees WHERE salary BETWEEN 25000 AND 30000;

--!              string searching (use LIKE)
SELECT * FROM employees WHERE name LIKE 'A%';
SELECT * FROM employees WHERE name LIKE 'a%';
SELECT * FROM employees WHERE name LIKE '%a'; --last character
SELECT * FROM employees WHERE name LIKE '%a%'; --

--!              specific position

SELECT * FROM employees WHERE name LIKE '_a%'; 


--                      TODO:06
--*  ->               joining         <-



-- joining

INSERT INTO department1(department_id, department_name)
VALUES
    (1, 'Human Resources'),
    (2, 'Marketing'),
    (3, 'Finance'),
    (4, 'Operations'),
    (5, 'Information Technology'),
    (6, 'Commerce');

INSERT INTO employee1(employee_id, full_name, department_id, job_role, manager_id)
VALUES
    (1, 'John Doe', 1, 'HR Manager', NULL),
    (2, 'Jane Smith', 1, 'HR Specialist', 1),
    (3, 'Michael Johnson', 2, 'Marketing Manager', NULL),
    (4, 'Emily Williams', 2, 'Marketing Coordinator', 3),
    (5, 'Robert Brown', 3, 'Finance Manager', NULL),
    (6, 'Jennifer Lee', 3, 'Financial Analyst', 5),
    (7, 'Christopher Davis', 4, 'Operations Manager', NULL),
    (8, 'Maria Rodriguez', 4, 'Operations Coordinator', 7),
    (9, 'James Martinez', 5, 'IT Manager', NULL),
    (10, 'Susan Wilson', 5, 'IT Specialist', 9),
    (11, 'Daniel Taylor', 1, 'HR Assistant', 2),
    (12, 'Lisa Anderson', 2, 'Marketing Assistant', 4),
    (13, 'Mark Thomas', 3, 'Finance Assistant', 6),
    (14, 'Karen Hernandez', 4, 'Operations Assistant', 8),
    (15, 'Matthew Walker', 5, 'IT Assistant', 10);

CREATE TABLE department1(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE employee1(
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    department_id INT,
    job_role VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES department1(department_id)
);


SELECT * FROM department1;
SELECT * FROM employee1;

-------------------------------- 
--!                 INNER JOIN
SELECT 
    full_name,
    job_role,
    department_name

FROM employee1 
-- JOIN department1 ON department1.department_id=employee1.department_id;
INNER JOIN department1 ON department1.department_id=employee1.department_id;

--                      TODO:07
--*  ->                More  joining         <-


--                      TODO:08
--*  ->              Aggregate Functions				      <-

-- Active: 1691336670489@@127.0.0.1@5432@module_31@public




--! 


SELECT * FROM department1 d 
INNER JOIN employee1 e 
ON e.department_id=d.department_id;


SELECT * from employees;

SELECT 
AVG(salary) AvarageSalary
FROM employees;
SELECT 
AVG(salary) AS AvarageSalary
FROM employees;

SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT sum(salary) FROM employees;

select deptid, avg(salary) from employees group by deptid;


select * from employees e
right join departments d on e.deptid=d.deptid;

select 
    d.name
from employees e
right join departments d on e.deptid=d.deptid
group by d.name;


select 
    d.name,
    avg(e.salary),
    sum(e.salary),
    max(e.salary),
    min(e.salary),
    count(*)
from employees e
full join departments d on e.deptid=d.deptid
group by d.name;
select 
    d.name,
    avg(e.salary),
    sum(e.salary),
    max(e.salary),
    min(e.salary),
    count(*)
from employees e
full join departments d on e.deptid=d.deptid
group by d.name having d.name='HR';
