CREATE DATABASE employe;

USE employe;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M','F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
    REFERENCES Location(location_id)
);

ALTER TABLE Employees
ADD email VARCHAR(255);

ALTER TABLE Employees
MODIFY designation VARCHAR(150);

ALTER TABLE Employees
DROP COLUMN age;

ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

RENAME TABLE Departments TO Departments_Info;

RENAME TABLE Location TO Locations;

TRUNCATE TABLE Employees;

DROP TABLE Employees;
DROP DATABASE employee;

DROP DATABASE IF EXISTS employe;

CREATE DATABASE employe;

USE employe;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
        NOT NULL UNIQUE
);

CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30)
        NOT NULL UNIQUE
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,

    employee_name VARCHAR(50) NOT NULL,

    gender ENUM('M','F'),

    age INT CHECK (age >= 18),

    hire_date DATE DEFAULT (CURRENT_DATE),

    designation VARCHAR(100),

    department_id INT,

    location_id INT,

    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
    REFERENCES Location(location_id)
);

SHOW DATABASES;

USE employe;

SHOW TABLES;
DESC Departments;

DESC Location;

DESC Employees;
INSERT INTO Departments
(department_name)
VALUES ('HR'), ('IT'), ('Finance');

INSERT INTO Location (location)
VALUES ('Kochi'), ('Kollam'), ('Trivandrum');

INSERT INTO Employees
(employee_name, gender, age, designation,
 department_id, location_id, salary)
VALUES
('Arun', 'M', 25, 'Manager', 1, 1, 35000.00),
('Anu', 'F', 28, 'Developer', 2, 2, 40000.00),
('Rahul', 'M', 30, 'Accountant', 3, 3, 45000.00);

SELECT * FROM Employees;

SELECT DISTINCT salary 
FROM Employees;

SELECT age AS Employee_Age, salary AS Employee_Salary 
FROM Employees;

SELECT * 
FROM Employees 
WHERE salary > 50000 
  AND hire_date < '2016-01-01';
  
  
UPDATE Employees 
SET designation = 'Data Scientist' 
WHERE designation IS NULL OR designation = '';

SELECT * 
FROM Employees 
ORDER BY department_id ASC, salary DESC;

SELECT * 
FROM Employees 
WHERE YEAR(hire_date) = 2018 
LIMIT 5;

SELECT SUM(e.salary) AS Total_Finance_Salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS Minimum_Age 
FROM Employees;

SELECT location, MAX(salary) AS Max_Salary 
FROM Employees 
GROUP BY location;

SELECT designation, AVG(salary) AS Average_Salary 
FROM Employees 
WHERE designation LIKE '%Analyst%' 
GROUP BY designation;

SELECT department_id, COUNT(*) AS Employee_Count 
FROM Employees 
GROUP BY department_id 
HAVING COUNT(*) < 3;

SELECT location 
FROM Employees 
WHERE gender = 'Female' 
GROUP BY location 
HAVING AVG(age) < 30;

SELECT e.employee_name, e.designation, d.department_name 
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;

SELECT d.department_name, COUNT(e.employee_id) AS Total_Employees 
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;

SELECT l.location_name, e.employee_name 
FROM Employees e
RIGHT JOIN Locations l ON e.location_id = l.location_id;


