-- UC1
create database payroll_service;
show databases;
use payroll_service;

-- UC2
create table employee_payroll(
	empId int,
    empName varchar(25),
    salary int,
    startDate Date
);

-- UC3
insert into employee_payroll values(1, 'Brijesh', 32000, '2018-07-18');
insert into employee_payroll values(2, 'Rahul', 25000, '2019-07-24');
insert into employee_payroll values(3, 'Shreya', 18000, '2018-01-10');
insert into employee_payroll values(4, 'Dashwath', 32000, '2020-05-01');
insert into employee_payroll values(5, 'Anusha', 15000, '2017-07-18');

-- UC4
select * from employee_payroll;

-- UC5
select salary from employee_payroll 
where empName = 'Rahul';

select empName from employee_payroll
where startDate between cast('2018-07-18' as date) and date(now());

-- UC6
alter table employee_payroll add gender varchar(1);
update employee_payroll 
set gender = 'M'
where empName = 'Brijesh' or empName ='Rahul' or empName ='Dashwath'; 

update employee_payroll 
set gender = 'F'
where empName = 'Anusha' or empName ='Shreya'; 

-- UC7
select count(*) from employee_payroll 
where salary > 20000;
select avg(salary) from employee_payroll;
select max(salary) from employee_payroll;
select sum(Salary) from employee_payroll WHERE Gender = 'F' GROUP BY Gender;
select sum(Salary) from employee_payroll WHERE Gender = 'M' GROUP BY Gender;

select avg(Salary) from employee_payroll WHERE Gender = 'F' GROUP BY Gender;
select avg(Salary) from employee_payroll WHERE Gender = 'M' GROUP BY Gender;

select min(Salary) from employee_payroll WHERE Gender = 'F' GROUP BY Gender;
select min(Salary) from employee_payroll WHERE Gender = 'M' GROUP BY Gender;

select max(Salary) from employee_payroll WHERE Gender = 'F' GROUP BY Gender;
select max(Salary) from employee_payroll WHERE Gender = 'M' GROUP BY Gender;

select count(Salary) from employee_payroll WHERE Gender = 'F' GROUP BY Gender;
select count(Salary) from employee_payroll WHERE Gender = 'M' GROUP BY Gender;

select sum(salary), gender from employee_payroll
group by gender;

-- UC8
alter table employee_payroll add department varchar(20) not null;
alter table employee_payroll add phoneNumber varchar(20);
alter table employee_payroll add address varchar(30);

-- UC9
alter table employee_payroll add Basic_pay float after salary;
alter table employee_payroll add Deduction float after Basic_pay;
alter table employee_payroll add Taxable_pay float after Deduction;
alter table employee_payroll add Income_tax float after Taxable_pay;
alter table employee_payroll add Net_pay float after Income_tax;
desc employee_payroll;

-- UC10
update employee_payroll set department = 'Marketing' where empId=2;
insert into employee_payroll(empname,department,gender,Basic_pay,Deduction,Taxable_pay,Income_tax,Net_pay,startDate) values('Rahul', 'sales', 'M', 100000, 9000, 90000, 890000, 790000, '2019-12-11');
update employee_payroll set empId = 6 where department ='sales';
select * from employee_payroll where empname = 'Rahul';

-- UC11
create table Department(
department varchar(100) not null,
primary key(department)
);

insert into Department (department) values ('sales'),('Marketing');

select * from Department;

create table Employee (
id int, 
phone_num varchar(15),
address varchar(25),
gender char(1),
primary key(id));

insert into Employee(id,phone_num,address,gender) values
 (1,8289002022,'Bangalore','F'),
 (2,9878679890,'Mangalore','M');
 
 select * from Employee;
 
 -- UC12
 create table Emp_Department (empID int, Depart varchar(250) NOT NULL, FOREIGN KEY (empID) REFERENCES Employee (id),
 FOREIGN KEY (Depart) REFERENCES Department (department), PRIMARY KEY (empID, Depart));
 
 insert into Emp_Department (empID, Depart) VALUES 
 (1, 'Marketing'),
 (2, 'Sales');
 
 select * from Employee;
 
 select * from Emp_Department where Depart= 'Sales';