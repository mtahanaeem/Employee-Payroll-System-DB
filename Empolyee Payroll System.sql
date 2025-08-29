-- Drop and Create the Database
DROP DATABASE IF EXISTS EMPLOYEE_PAYROLL_MANAGEMENT;
CREATE DATABASE EMPLOYEE_PAYROLL_MANAGEMENT;
USE EMPLOYEE_PAYROLL_MANAGEMENT; -- Employees Table
CREATE TABLE employees (
emp_id INT PRIMARY KEY AUTO_INCREMENT, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL, dob DATE NOT NULL, gender ENUM('Male', 'Female', 'Other') NOT NULL, phone VARCHAR(15) NOT NULL UNIQUE, email VARCHAR(100) NOT NULL UNIQUE, address VARCHAR(55) NOT NULL, department VARCHAR(50) NOT NULL, designation VARCHAR(50) NOT NULL, hire_date DATE NOT NULL, status ENUM('Active', 'Inactive', 'Terminated') DEFAULT 'Active' );-- Salary Structure Table
CREATE TABLE salary_structure (
salary_id INT PRIMARY KEY AUTO_INCREMENT, emp_id INT NOT NULL, basic_salary DECIMAL(10, 2) NOT NULL, hra DECIMAL(10, 2) NOT NULL, da DECIMAL(10, 2) NOT NULL, other_allowances DECIMAL(10, 2) NOT NULL, fixed_deductions DECIMAL(10, 2) DEFAULT 0.00, FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ONDELETECASCADE
);-- Deductions Table
CREATE TABLE deductions (
deduction_id INT PRIMARY KEY AUTO_INCREMENT, emp_id INT NOT NULL, month_year VARCHAR(7) NOT NULL, -- Format: 'YYYY-MM' reason VARCHAR(100) NOT NULL, amount DECIMAL(10, 2) NOT NULL, FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ONDELETECASCADE, UNIQUE(emp_id, month_year, reason)
);-- Attendance Table
CREATE TABLE attendance (
attendance_id INT PRIMARY KEY AUTO_INCREMENT,
emp_id INT NOT NULL, date DATE NOT NULL, status ENUM('Present', 'Absent', 'Leave', 'Half-day') NOT NULL, FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ONDELETECASCADE, UNIQUE(emp_id, date)
);-- Leaves Table
CREATE TABLE leaves (
leave_id INT PRIMARY KEY AUTO_INCREMENT, emp_id INT NOT NULL, leave_date DATE NOT NULL, leave_type ENUM('Paid', 'Sick', 'Casual', 'Unpaid') NOT NULL, leave_status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending', remarks VARCHAR(55), FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ONDELETECASCADE, UNIQUE(emp_id, leave_date)
);-- Payroll Table
CREATE TABLE payroll (
payroll_id INT PRIMARY KEY AUTO_INCREMENT, emp_id INT NOT NULL, month_year VARCHAR(7) NOT NULL, -- 'YYYY-MM' payment_date DATE, payment_status ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid', FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ONDELETECASCADE, UNIQUE(emp_id, month_year)
);
INSERT INTO employees (first_name, last_name, dob, gender, phone, email, address, department, designation, hire_date, status) VALUES
('John', 'Doe', '1985-04-23', 'Male', '9876543210', 'john.doe@example.com', '123 MainSt, CityA', 'Engineering', 'Engineer', '2015-06-01', 'Active'), ('Jane', 'Smith', '1990-03-12', 'Female', '9876543211', 'jane.smith@example.com', '456Elm St, CityB', 'HR', 'Manager', '2017-01-15', 'Active'), ('Robert', 'Brown', '1982-11-30', 'Male', '9876543212', 'robert.brown@example.com',
'789 Oak St, CityC', 'Finance', 'Analyst', '2018-04-20', 'Inactive'), ('Emily', 'Clark', '1995-07-19', 'Female', '9876543213', 'emily.clark@example.com',
'321 Pine St, CityD', 'Sales', 'Executive', '2019-08-10', 'Active'), ('Michael', 'Davis', '1978-05-15', 'Male', '9876543214', 'michael.davis@example.com',
'654 Cedar St, CityE', 'Marketing', 'Manager', '2013-10-05', 'Terminated'), ('Linda', 'Garcia', '1988-12-01', 'Female', '9876543215', 'linda.garcia@example.com',
'789 Birch St, CityF', 'Engineering', 'Engineer', '2016-11-11', 'Active'), ('William', 'Martinez', '1992-06-21', 'Male', '9876543216', 'william.m@example.com',
'159 Maple St, CityG', 'Finance', 'Clerk', '2020-03-17', 'Active'),
('Patricia', 'Rodriguez', '1983-02-02', 'Female', '9876543217',
'patricia.r@example.com', '753 Willow St, CityH', 'HR', 'Executive', '2014-12-25',
'Inactive'), ('James', 'Lopez', '1991-09-18', 'Male', '9876543218', 'james.lopez@example.com',
'951 Ash St, CityI', 'Sales', 'Analyst', '2021-06-20', 'Active'), ('Barbara', 'Wilson', '1987-08-08', 'Female', '9876543219', 'barbara.w@example.com',
'456 Fir St, CityJ', 'Marketing', 'Clerk', '2012-05-02', 'Terminated'), ('Kevin', 'Lee', '1986-10-10', 'Male', '9876543220', 'kevin.lee@example.com', '111Redwood St, CityK', 'Engineering', 'Engineer', '2017-07-23', 'Active'), ('Susan', 'Hall', '1993-11-11', 'Female', '9876543221', 'susan.hall@example.com', '222Juniper St, CityL', 'Finance', 'Analyst', '2018-09-14', 'Active'), ('Brian', 'Allen', '1989-01-05', 'Male', '9876543222', 'brian.allen@example.com', '333Dogwood St, CityM', 'Sales', 'Executive', '2019-10-30', 'Inactive'), ('Nancy', 'Young', '1994-04-04', 'Female', '9876543223', 'nancy.young@example.com',
'444 Magnolia St, CityN', 'HR', 'Manager', '2020-01-10', 'Active'), ('George', 'King', '1980-12-25', 'Male', '9876543224', 'george.king@example.com',
'555 Chestnut St, CityO', 'Marketing', 'Executive', '2011-03-20', 'Terminated'), ('Donna', 'Wright', '1985-07-17', 'Female', '9876543225',
'donna.wright@example.com', '666 Sequoia St, CityP', 'Finance', 'Clerk', '2015-04-18',
'Active'), ('Edward', 'Scott', '1979-09-09', 'Male', '9876543226', 'edward.scott@example.com',
'777 Beech St, CityQ', 'Engineering', 'Manager', '2010-07-01', 'Inactive'), ('Lisa', 'Green', '1990-05-30', 'Female', '9876543227', 'lisa.green@example.com', '888Linden St, CityR', 'HR', 'Clerk', '2016-02-12', 'Active'), ('Mark', 'Adams', '1996-03-14', 'Male', '9876543228', 'mark.adams@example.com',
'999 Poplar St, CityS', 'Sales', 'Engineer', '2021-09-01', 'Active'), ('Karen', 'Nelson', '1984-06-06', 'Female', '9876543229', 'karen.nelson@example.com',
'123 Sycamore St, CityT', 'Marketing', 'Analyst', '2013-08-09', 'Inactive');
INSERT INTO salary_structure (emp_id, basic_salary, hra, da, other_allowances, fixed_deductions) VALUES
(1, 50000.00, 1000.00, 5000.00, 2000.00, 1000.00), (2, 60000.00, 2000.00, 6000.00, 2500.00, 1200.00), (3, 48000.00, 9500.00, 4000.00, 1800.00, 800.00), (4, 60000.00, 12000.00, 7000.00, 3000.00, 1500.00), (5, 45000.00, 9000.00, 3500.00, 1500.00, 900.00), (6, 47000.00, 9200.00, 3800.00, 1600.00, 1000.00), (7, 62000.00, 12500.00, 7500.00, 3200.00, 2000.00), (8, 53000.00, 10500.00, 6200.00, 2200.00, 1300.00), (9, 49000.00, 9700.00, 4100.00, 1900.00, 950.00), (10, 46000.00, 9100.00, 3700.00, 1700.00, 870.00), (11, 51000.00, 10200.00, 5200.00, 2100.00, 1000.00), (12, 58000.00, 11600.00, 6900.00, 2800.00, 1400.00), (13, 49500.00, 9850.00, 4150.00, 1950.00, 980.00), (14, 63000.00, 12800.00, 7700.00, 3300.00, 1600.00), (15, 44000.00, 8800.00, 3400.00, 1400.00, 850.00), (16, 52000.00, 10400.00, 5300.00, 2300.00, 1100.00), (17, 48000.00, 9600.00, 4000.00, 1800.00, 950.00), (18, 56000.00, 11200.00, 6400.00, 2700.00, 1300.00), (19, 47000.00, 9400.00, 3900.00, 1600.00, 900.00),
(20, 59000.00, 11800.00, 7100.00, 2900.00, 1500.00);
INSERT INTO deductions (emp_id, month_year, reason, amount) VALUES
(1, '2024-01', 'Late coming', 500.00), (2, '2024-01', 'Misconduct', 1000.00), (3, '2024-02', 'Leave without notice', 700.00), (4, '2024-02', 'Late coming', 300.00), (5, '2024-03', 'Others', 450.00), (6, '2024-03', 'Late coming', 200.00), (7, '2024-04', 'Misconduct', 900.00), (8, '2024-04', 'Leave without notice', 600.00), (9, '2024-05', 'Others', 500.00), (10, '2024-05', 'Late coming', 400.00), (11, '2024-06', 'Late coming', 350.00), (12, '2024-06', 'Leave without notice', 800.00), (13, '2024-07', 'Misconduct', 950.00), (14, '2024-07', 'Others', 300.00), (15, '2024-08', 'Leave without notice', 700.00), (16, '2024-08', 'Late coming', 250.00), (17, '2024-09', 'Others', 450.00), (18, '2024-09', 'Leave without notice', 620.00), (19, '2024-10', 'Late coming', 300.00), (20, '2024-10', 'Others', 400.00);
INSERT INTO attendance (emp_id, date, status) VALUES
(1, '2024-05-01', 'Present'), (2, '2024-05-01', 'Absent'), (3, '2024-05-01', 'Leave'), (4, '2024-05-01', 'Half-day'), (5, '2024-05-02', 'Present'), (6, '2024-05-02', 'Present'), (7, '2024-05-02', 'Absent'), (8, '2024-05-03', 'Leave'), (9, '2024-05-03', 'Present'), (10, '2024-05-03', 'Present'), (11, '2024-05-04', 'Half-day'), (12, '2024-05-04', 'Present'), (13, '2024-05-04', 'Absent'), (14, '2024-05-05', 'Leave'), (15, '2024-05-05', 'Present'), (16, '2024-05-05', 'Present'), (17, '2024-05-06', 'Half-day'), (18, '2024-05-06', 'Absent'), (19, '2024-05-06', 'Present'), (20, '2024-05-06', 'Leave');
INSERT INTO leaves (emp_id, leave_date, leave_type, leave_status, remarks)
VALUES
(1, '2024-04-01', 'Paid', 'Approved', 'Annual leave approved.'), (2, '2024-04-05', 'Sick', 'Pending', 'Fever reported.'),
(3, '2024-04-10', 'Casual', 'Rejected', 'Unverified reason.'), (4, '2024-04-15', 'Unpaid', 'Approved', 'Family emergency.'), (5, '2024-04-20', 'Paid', 'Approved', 'Annual holiday.'), (6, '2024-04-25', 'Sick', 'Pending', 'Medical leave applied.'), (7, '2024-04-26', 'Casual', 'Approved', 'Travel reason.'), (8, '2024-04-27', 'Unpaid', 'Rejected', 'No prior notice.'), (9, '2024-04-28', 'Paid', 'Pending', 'Vacation.'), (10, '2024-04-29', 'Sick', 'Approved', 'Doctor certified.'), (11, '2024-04-30', 'Casual', 'Rejected', 'Unsupported reason.'), (12, '2024-05-01', 'Unpaid', 'Pending', 'Last minute notice.'), (13, '2024-05-02', 'Paid', 'Approved', 'Approved by HR.'), (14, '2024-05-03', 'Sick', 'Pending', 'Medical claim.'), (15, '2024-05-04', 'Casual', 'Approved', 'Short leave.'), (16, '2024-05-05', 'Unpaid', 'Rejected', 'HR declined.'), (17, '2024-05-06', 'Paid', 'Approved', 'Approved leave.'), (18, '2024-05-07', 'Sick', 'Pending', 'Sick report submitted.'), (19, '2024-05-08', 'Casual', 'Approved', 'Personal reason.'), (20, '2024-05-09', 'Unpaid', 'Rejected', 'Not valid.');
INSERT INTO payroll (emp_id, month_year, payment_date, payment_status)
VALUES
(1, '2024-04', '2024-05-01', 'Paid'), (2, '2024-04', '2024-05-01', 'Paid'), (3, '2024-04', '2024-05-01', 'Unpaid'), (4, '2024-04', '2024-05-01', 'Paid'), (5, '2024-04', '2024-05-01', 'Paid'), (6, '2024-04', '2024-05-01', 'Unpaid'), (7, '2024-04', '2024-05-01', 'Paid'), (8, '2024-04', '2024-05-01', 'Paid'), (9, '2024-04', '2024-05-01', 'Unpaid'), (10, '2024-04', '2024-05-01', 'Paid'), (11, '2024-04', '2024-05-01', 'Paid'), (12, '2024-04', '2024-05-01', 'Paid'), (13, '2024-04', '2024-05-01', 'Unpaid'), (14, '2024-04', '2024-05-01', 'Paid'), (15, '2024-04', '2024-05-01', 'Paid'), (16, '2024-04', '2024-05-01', 'Unpaid'), (17, '2024-04', '2024-05-01', 'Paid'), (18, '2024-04', '2024-05-01', 'Paid'), (19, '2024-04', '2024-05-01', 'Unpaid'), (20, '2024-04', '2024-05-01', 'Paid'); -- Date Functions
-- selecting paid employees where year= 2024 and month= 04
SELECT emp_id, month_year, payment_date, payment_status
FROM payroll
WHERE YEAR(payment_date) = 2024 AND MONTH(payment_date) = 5
AND payment_status = 'Paid';
-- selecting employees who will turn 40 in 2025
SELECT emp_id, first_name, last_name, dob
FROM employees
WHERE YEAR(CURDATE()) - YEAR(dob) = 40; -- Count attendence status according to MAY-2024
SELECT status, COUNT(*) AS total
FROM attendance
WHERE MONTH(date) = 5 AND YEAR(date) = 2024
GROUP BY status
ORDER BY status; -- employees who have not taken leave in APRIL 2024
SELECT e.emp_id, e.first_name, e.last_name
FROM employees e
WHERE e.emp_id NOT IN (
SELECT emp_id FROM leaves
WHERE MONTH(leave_date) = 4 AND YEAR(leave_date) = 2024
);-- Calculating Timespan of employees in comapny
SELECT emp_id,first_name,last_name,hire_date, TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_in_company, TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) % 12 AS
months_in_company
FROM employees; -- CALCULATED FIELDS
-- Gross salary for all employees
SELECT emp_id,(basic_salary + hra + da + other_allowances) AS gross_salary
FROM salary_structure; -- Total deductions for all employees
SELECT s.emp_id, MAX(s.fixed_deductions) + IFNULL(SUM(d.amount), 0) AStotal_deductions
FROM salary_structure s
INNER JOIN deductions d ON s.emp_id = d.emp_id
GROUP BY s.emp_id; -- Query for net salary for all employees
SELECT
e.emp_id, CONCAT(MAX(e.first_name), ' ', MAX(e.last_name)) AS full_name, (MAX(s.basic_salary) + MAX(s.hra) + MAX(s.da) + MAX(s.other_allowances))
AS gross_salary, MAX(s.fixed_deductions) + IFNULL(SUM(d.amount), 0) AS total_deductions, (MAX(s.basic_salary) + MAX(s.hra) + MAX(s.da) + MAX(s.other_allowances)
- MAX(s.fixed_deductions) - IFNULL(SUM(d.amount), 0)) AS net_salary
FROM employees e
JOIN salary_structure s ON e.emp_id = s.emp_id
LEFT JOIN deductions d ON e.emp_id = d.emp_id
GROUP BY e.emp_id; -- JOINS
-- Join employees data (emloyees) with payment status (payroll)
SELECT p.emp_id, e.first_name, p.month_year, p.payment_status
FROM payroll p
RIGHT JOIN employees e ON p.emp_id = e.emp_id; -- Top 5 most paid employees in company
SELECT e.emp_id, e.first_name, e.last_name, (s.basic_salary + s.hra + s.da + s.other_allowances - s.fixed_deductions) ASnet_pay
FROM employees e
JOIN salary_structure s ON e.emp_id = s.emp_id
ORDER BY net_pay DESC
LIMIT 5; -- Average salary of employees by designation
SELECT designation, AVG(basic_salary + hra + da + other_allowances - fixed_deductions) ASavg_salary
FROM employees e
JOIN salary_structure s ON e.emp_id = s.emp_id
GROUP BY designation; -- Query to check incomplete salary structure of employees
SELECT e.emp_id, e.first_name, e.last_name
FROM employees e
LEFT JOIN salary_structure s ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL; -- Query to select top 3 employees having most deductions in 1 year
SELECT e.emp_id, e.first_name, e.last_name, SUM(d.amount) AS top_3_deductions
FROM employees e
JOIN deductions d ON e.emp_id = d.emp_id
WHERE d.month_year BETWEEN '2024-01' AND '2024-12' GROUP BY e.emp_id
ORDER BY top_3_deductions DESC
LIMIT 3;