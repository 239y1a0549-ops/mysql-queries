USE mydb;
CREATE TABLE employee (
    eid INT,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    salary INT NULL,
    dept VARCHAR(20),
    doj DATE
);
 INSERT INTO employee (eid, fname, lname, age, salary, dept, doj) VALUES
(1, 'rajeev', 'sukla', 23, 12000, '.net', '2011-10-23'),
(2, 'sowmya', 'kumari', 23, 19000, 'db', '2010-11-13'),
(3, 'kishore', 'kumar', 27, 36000, 'android', '2011-10-16'),
(4, 'abimanyu', 'biswal', 22, NULL, 'android', '2010-02-20'),
(5, 'soni', 'kumar', 24, 21800, '.net', '2009-06-21'),
(6, 'anu', '_singh', 22, 12000, 'db', '2010-10-23'),
(7, '_dinesh', 'moh%anty', 23, 15000, '.net', '2009-08-26'),
(8, 'nishala', '_kumari', 22, 18000, 'db', '2008-07-19'),
(1, 'rajeev', 'sukla', 23, 12000, '.net', '2011-10-23');

select * from employee order by salary desc  limit 5;
select * from employee order by salary asc  limit 5;
select salary  from employee where age >= 23;
select salary from employee where  salary between '22'and '24';
select age from employee where  age between '22'and '24';
select distinct lname from employee;
SELECT COUNT(*) AS 'result'  FROM employee;
SELECT COUNT(*) AS 'result'  FROM employee where dept='.net';
select dept from employee group by dept;
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee WHERE dept = 'db');
CREATE TABLE patient (
    pid INT,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    bg VARCHAR(10)
);
INSERT INTO patient (pid, fname, lname, age, bg) VALUES
(1, 'madhava', 'reddy', 45, 'o+ve'),
(2, 'abhinav', 'bandra', 45, 'o-ve'),
(4, 'hari', 'kiran', 60, 'b-ve'),
(3, 'madhava', 'kiran', 52, 'o+ve'),
(5, 'veena', 'kumari', 42, NULL),
(6, 'k_iran', 'kumar', 39, 'b-ve'),
(2, 'abhinav', 'bandra', 45, 'o-ve'),
(7, 'mahes%h', 'nambootri', 36, 'b+ve'),
(8, 'rahul', 'kumar', 46, 'b-ve'),
(9, 'bharat', 'kumar', 56, 'b-ve');
select * from  patient;
SELECT CONCAT(fname, lname, ' bg is ', bg, ' and he/she is from india') FROM patient;
select CONCAT(fname,lname,'age is ',age) FROM patient;
select fname,lname,age from patient limit 3;
select fname from patient where age>45;
select distinct fname from patient;
SELECT COUNT(*) AS total  FROM patient;
SELECT COUNT(bg) AS bg FROM patient;

SELECT SUM(age) AS total FROM patient;
SELECT AVG(age) AS average FROM patient;
SELECT MIN(age) AS youngest FROM patient;
SELECT MAX(age) AS oldest FROM patient;
SELECT bg, COUNT(*) AS count FROM patient GROUP BY bg;
select max(age) as 'max age',bg from patient group by bg;
select lname, MIN(age) from patient group by bg,lname;
SELECT bg, MAX(age) AS 'max age'FROM patient GROUP BY bg HAVING MAX(age) > 40;
select p1.* from patient p1 where 3=(select count(distinct(p2.pid)) from patient p2 where p2.age> p1.age)