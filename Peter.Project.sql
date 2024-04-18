--- SQL project:

-- All the steps would be mentioned as below on what all queries have been performed and what are their functions
-- We are creating a database for legion corporation in which employee details and project would be mentioned

-- To create a database:

create database Legion_Corporation

-- To enable the database after reopening SQL we need to use the below queries:

use Legion_Corporation

-- Creating a table in the database:

create table Employees(E_id int primary key,First_name char(20),Last_name char(20),Designation char(30),
Department char(20),Salary money,DOJ date)

-- Inserting Values into the table:

insert into Employees values(111,'Arthur','Morgan','A.I Designer','Technology',500000,
'12-Jan-2018')

-- To insert multiple values:

insert into Employees values(112,'Dutch','Van-der Linde','Chief-Consultant','Marketing',600000,
'12-Jan-2018'),(113,'Hosea','Mathew','Digital Marketing Specialist','Marketing',550000,
'10-August-2018'),(114,'John','Marston','Chief tester','Technology',490000,
'10-August-2018'),(115,'Susan','Grimshaw','H.R Head','Human Resource',510000,
'1-Feb-2019'),(116,'Lenny','Summers','Sales Specialist','Sales',400000,
'31-March-2019'),(117,'Charles','Smith','Chief-Sales-Specialist','Sales',450000,
'20-April-2019'),(118,'Sean','Mcguire','Sales Consultant','Sales',350000,
'2-June-2019'),(119,'Bill','Williamson','Recruiter','Human Resource',360000,
'4-Jan-2019'),(120,'Karen','Linston','Recruiter','Human Resourse',350000,
'5-Feb-2019')

--- Updating a record:

update Employees set Department='Human Resource' where E_id=120  -- Spelling of Human resource is wrong

-- To display the entire table:

select * from Employees    -- * is used for all columns

-- To display selected columns and where clause:

select First_name,Last_name from Employees where Department='Marketing'

-- To remove the table permanently  from the database:
drop table Employees

-- To Remove the database permanently:
drop database Legion_Corporation

-- Creating more tables and inserting values:

create table Project_Apple(E_id int primary key,First_name char(20),Last_name char(20),
Department char(30),Country char(20))

insert into Project_Apple values(112,'Arthur','Morgan','Technology','USA'),
(113,'John','Marston','Technology','USA'),(117,'Charles','Smith','Sales','Canada')

select * from Project_Apple

create table Project_Microsoft(E_id int primary key,First_name char(20),Last_name char(20),
Department char(30),Country char(20))

insert into Project_Microsoft values(112,'Dutch','Van-der Linde','Marketing','UK'),
(113,'Hosea','Mathew','Marketing','Scotland'),(115,'Susan','Grimshaw','Sales','Luxembourg'),
(117,'Charles','Smith','Sales','Canada'),(116,'Lenny','Summers','Sales','Scotland')

-- using update again as Susan is supposed to be in H.R not sales:

update Project_Microsoft set Department='Human Resource' where E_id=115 

select * from Project_Microsoft

create table Project_Google(E_id int primary key,First_name char(20),Last_name char(20),
Department char(30),Country char(20))

insert into Project_Google values(118,'Sean','Mcguire','Sales','Switzerland'),
(119,'Bill','Williamson','Human Resource','Various Countries'),(120,'Karen','Linston','Human Resource','Germany'),
(114,'John','Marston','Technology','USA'),(116,'Lenny','Summers','Sales','Scotland')

select * from Project_Google

-- Adding another column in the table employee

alter table Employees
add Status char(20)

select * from Employees

insert into Employees values(121,'Micah','Bell','Consultant','Any Department',300000,
'13-March-2020','Resigned')


-- Using joins: 

-- Inner Join:

select Employees.E_Id,Employees.First_Name,Employees.Last_Name from Employees
inner join Project_Apple on Employees.E_id=Project_Apple.E_id

select Project_Apple.E_id,Project_Apple.First_name,Project_Apple.Department from Project_Apple
inner join Project_Google on Project_Apple.E_id=Project_Google.E_id

-- Using Left Join:

select Employees.E_Id,Employees.First_Name,Employees.Last_Name,Employees.Department
from Employees left join Project_Apple on Employees.E_Id=Project_Apple.E_id

select Project_Google.First_name,Project_Google.Last_name from Project_Google left join
Project_Microsoft on Project_Google.E_id=Project_Microsoft.E_id


-- Right Join:

select Project_Microsoft.First_name,Project_Microsoft.Country
from Project_Microsoft right join Project_Apple 
on Project_Microsoft.E_id=Project_Apple.E_id

-- Full Outer Join:

select Employees.e_id,Employees.First_name from Employees full join Project_Microsoft 
on Employees.E_id=Project_Microsoft.E_id

select Project_Apple.First_name,Project_Apple.Last_name,Project_Apple.Department from Project_Apple
full join Project_Google on Project_Apple.E_id=Project_Google.E_id


-- Using aggregate functions 

select max(Salary) as 'Highest Paid Salary in the co.' from Employees

select min(Salary) as 'Lowest Paid Salary in the co.' from Employees

select Avg(Salary) as 'The Average.' from Employees

select count(First_Name) as 'Total Employees' from Employees

select Sum(Salary) as 'Total Salary being paid' from Employees

-- Using Like Keywords:

select * from Employees where First_name like 'a%'

select * from Employees where First_name like '_u_c_%'

select * from Project_Microsoft where First_name like '%s'

-- Using in and not in 

select * from Employees where department in('sales','Human resource')

select * from Employees where department  not in('sales','Human resource')

-- Concateneting values in SQL:

select 'Arthur ' + ' Morgan' as 'Employee of the Year'

-- Creating range and relation operators:

-- range operator

select * from Employees where Salary between 300000 and 500000

select * from Employees where Salary  not between 300000 and 500000

-- Relation Operator:

select * from Employees where Salary>=400000

select * from Employees where Salary<500000

-- Using Check constraints:

Create table Criteria(Recruitment_id int,Name char(20),Experience int check(Experience>=3),
Age int check(Age>=18))

insert into Criteria values(001,'James',4,23)   -- This will take as it meets the Condition

insert into Criteria values(002,'Howelett',2,23) -- When one conditon does not meet error will come

insert into Criteria values(003,'Joshua',10,43)

-- Creating View 

-- We shall create 3 views:

create view[Top Notch Employees] as    
select First_name,Last_name
from employees 
where Salary>=500000

select * from [Top Notch Employees]

create view[The Bringer of Income] as    
select First_name,Last_name
from employees 
where department in('sales','Human resource')

select * from [The Bringer of Income]

create view[The Techno Lords] as    
select First_name,Last_name
from employees
where department in('Technology')

select * from [The Techno Lords]













