create database Aaru;
use Aaru;
create table employers (s_no INT auto_increment primary key, ename varchar(40), designation varchar(40), location varchar(40),Gender enum('Male','Female'), Emp_id int unique, phn_num int unique, salary int, department varchar(50), Join_Date date);
INSERT INTO employers (ename, designation, location, Gender, Emp_id, phn_num, salary, department, Join_date) VALUES
('Buhari', 'Director', 'Melapalayam', 'Male', 001, 65789487, 100000, 'Executive', '2020-02-02'),
('Meeran', 'Director', 'Nehru colony', 'Male', 002, 8656587, 85000, 'Executive', '2020-02-02'),
('Tariq', 'Manager', 'Melapalayam', 'Male', 003, 97868448, 50000, 'Executive', '2020-02-02'),
('Meharaj', 'Manager', 'Karungulam', 'Male', 004, 97845126, 50000, 'Executive', '2020-04-08'),
('Kumar', 'Supplier', 'Tharuvai', 'Male', 005, 78963158, 35000, 'Delivery', '2020-06-24'),
('Murugan', 'Supplier', 'araikulam', 'Male', 006, 68912457, 30000, 'Delivery', '2020-12-25'),
('Sakira', 'Supplier', 'KTC Nagar', 'Female', 007, 67523547, 30000, 'Delivery', '2020-12-31'),
('Kumar', 'Supplier', 'Tharuvai', 'Male', 008, 78543159, 30000, 'Delivery', '2020-02-02'),
('Raja', 'Supplier', 'Tharuvai', 'Male', 009, 84562175, 25000, 'Delivery', '2021-05-01'),
('Madhu', 'Operator', 'Madurai', 'Female', 010, 95478125, 30000, 'Production', '2020-03-05'),
('Riyaz', 'Operator', 'Kuruchi', 'Male', 011, 95478123, 28000, 'Production', '2020-08-23'),
('Hasim', 'Filler', 'KTC Nagar', 'Male', 012, 69478966, 29000, 'Production', '2020-03-25'),
('Jenifer', 'Quality Checker', 'araikulam', 'Female', 013, 96844458, 20000, 'Quality', '2021-05-08'),
('Chanthu', 'Quality Checker', 'Melapalayam', 'Female', 014, 78966548, 15000, 'Quality', '2021-12-14'),
('Keerthana', 'Security', 'Karungulam', 'Female', 015, 96476321, 10000, 'Security', '2021-03-06'),
('Sabeer', 'Security', 'Melapalayam', 'Male', 016, 63214945, 10000, 'Security', '2021-03-10');
Select * from Employers;
CREATE TABLE Products (prd_id INT, prd_name VARCHAR(40), emp_id INT, FOREIGN KEY (emp_id) REFERENCES Employers(Emp_id), Delivery_loc VARCHAR(40), delivery_date DATE);
insert into products values
(201, 'Mini Bottle', 008, 'Melapalayam', '2022-02-25'),
(203, 'Can', 008, 'Tharuvai', '2022-02-28'),
(201, 'mini bottle', 006, 'Kuruchi', '2022-05-01'),
(203, 'Can', 005, 'KTC', '2022-03-01'),
(203, 'Can', 006, 'Nellai', '2022-03-08'),
(201, 'mini bottle', 009, 'KTC', '2022-04-02');
select * from products;
-- update
UPDATE Employers SET salary = 26000 WHERE Emp_id = 009;
-- where
SELECT * FROM Employers WHERE salary > 50000;
-- sum
SELECT SUM(salary) AS total_salary FROM Employers;
-- avg
SELECT AVG(salary) AS avg_salary FROM Employers;
-- order by
SELECT * FROM Employers ORDER BY salary DESC;
-- group by
SELECT department, SUM(salary) AS total_salary FROM Employers GROUP BY department;
-- inner join
SELECT e.ename, e.department, p.prd_name, p.delivery_loc FROM Employers e INNER JOIN Products p ON e.Emp_id = p.emp_id;
-- left join
SELECT e.ename, e.department, p.prd_name, p.delivery_loc FROM Employers e LEFT JOIN Products p ON e.Emp_id = p.emp_id;
-- right join
SELECT e.ename, e.department, p.prd_name, p.delivery_loc FROM Employers e RIGHT JOIN Products p ON e.Emp_id = p.emp_id;
-- sub query
SELECT * FROM Employers WHERE salary > (SELECT AVG(salary) FROM Employers);
-- Minimum
SELECT min(salary) as 'minimum salary' from employers;
-- maximum
Select max(salary) as 'maximum salary' from employers;
-- count
select count(emp_id) from products;
-- Upper Case
select ucase(ename) as Upper_case from employers;
-- lower case
select Lcase(ename) as Lower_case from employers;
-- to find character length
select ename, char_length(ename) from employers;
 -- Concat and format
 select ename, concat('Rs.',format(salary,0)) as Salary from employers;
-- left
select ename , left(designation,4) from employers;
-- right
select ename , right(designation,4) from employers;
-- Date Refference
select now(); # to get date n time
select Date(now()); # to get only date
select curdate(); # to get approximate current date when there are many dates
select date_format(curdate(),'%d/%m/%y'); # to get desired date format
select datediff(curdate(),'2024-01-15'); # to get number of days
-- Interval
select date_add(curdate(),interval 1 day) Aft_1_day;
select date_add(curdate(),interval 15 day) 15_days;  
select date_add(curdate(),interval 1 week);
select date_add(curdate(),interval 3 year);
-- Having
select salary from employers group by salary having max(salary) >= 10000;
