--create database SchoolSystem

--Relation names should be modified !
create table Schools(
school_number int identity primary key,
name varchar(50) unique not null,
general_information varchar(1000),
type varchar(20) not null,
main_language varchar(20),
mission varchar(1000),
vision varchar(1000),
address varchar(1000),
fees real,
constraint type_checker check(type in('National', 'International')))

create table School_Emails(
school_number int,
email varchar(100),
primary key(school_number, email),
foreign key(school_number) references Schools on delete cascade)

create table School_Phone_Numbers(
school_number int,
phone_number varchar(20),
primary key(school_number, phone_number),
foreign key(school_number) references Schools on delete cascade)

create table Elementary_Schools(
school_number int primary key, 
foreign key(school_number) references Schools on delete cascade)

create table  Elementary_Supplies(
school_number int,
supply varchar(50),
primary key(school_number, supply),
foreign key(school_number) references Elementary_Schools on delete cascade)

create table Middle_Schools(
school_number int primary key, 
foreign key(school_number) references Schools on delete cascade)


create table High_Schools(
school_number int primary key,
foreign key(school_number) references Schools on delete cascade)

create table Clubs(
school_number int,
name varchar(50),
purpose varchar(1000),
primary key(school_Number, name),
foreign key(school_Number) references High_Schools on delete cascade)

create table Employees(
employee_number int identity primary key,
first_name varchar(20) not null,
middle_Name varchar(20) not null,
last_name varchar(20) not null,
birthdate date,
email varchar(100),
username varchar(20),
password varchar(20),
address varchar(100),
gender varchar(10),
salary real,
school_number int,
foreign key(school_number) references Schools on delete set null,
constraint gender_checker check(gender in('Male', 'Female')))

create unique nonclustered index EmployeeEmail 
on Employees(email)
where email is not null

create unique nonclustered index EmployeeUsername
on Employees(username)
where username is not null


create table Teachers(
employee_number int primary key,
hire_date date not null,
experience_years as (year(CURRENT_TIMESTAMP) - year(hire_date)),
foreign key(employee_number) references Employees on delete cascade)

create table Administrators(
employee_number int primary key,
foreign key(employee_number) references Employees on delete cascade)

--Superviosion check on insertion as teacher
create table Supervisors(
employee_number int primary key,
foreign key(employee_number) references Teachers on delete cascade)
--Constraint: Supervisor is a predicate-defined Relation:Teacher.Experience_years > 15

--Superviosion check on insertion as teacher
create table Nonsupervisors(
employee_number int,
supervisor_employee_number int,
primary key(employee_number),
foreign key(employee_number) references Teachers(employee_number) on delete cascade,
foreign key(supervisor_employee_number) references Supervisors)
--Constraint: Nonsupervisor is a predicate-defined Relation:Teacher.Experience_years <= 15

create table Parents(
username varchar(20) primary key,
password varchar(20) not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
home_number varchar(20),
address varchar(100),
email varchar(100))

create unique nonclustered index ParentEmail 
on Parents(email)
where email is not null


create table Parent_Cell_Numbers(
username varchar(20),
mobile_number varchar(20) not null,
primary key(username, mobile_number),
foreign key(username) references Parents on delete cascade)

--How to relate Child to parent??
create table Children(
ssn int primary key, 
name varchar(50) not null, 
birth_date date not null, 
age as (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)), 
gender varchar(10),
constraint gender_check check(gender in('Male', 'Female')))

--Same as Employee

create table Enrolled(
ssn int primary key NULL, 
username varchar(20), 
password varchar(20), 
school_number int, 
grade int,
foreign key(ssn) references Children on delete cascade,
foreign key(school_number) references Schools on delete set null)

create unique nonclustered index EnrolledUsername
on Enrolled(username)
where username is not null

create table Courses(
code varchar(10) primary key, 
name varchar(50) not null, 
description varchar(1000))

--This table is to be added in the schema (new)
create table Courses_taught_by_Teachers(
cid varchar(10),
teacher_number int ,
primary key(cid,teacher_number),
foreign key(teacher_number) references Teachers on update cascade ON DELETE Cascade,
foreign key(cid) references Courses on update cascade On delete cascade
)
--this table u need to insert new foreign key into it as u have inserted the above one 
--I added the primary key of Courses_taught_by_Teachers as foreign key instead of referencing teachers and courses
create table Students_taught_by_Teachers(
ssn int, 
cid varchar(10), 
teacher_number int,
primary key(ssn, cid),
foreign key(ssn) references Enrolled on delete cascade,
foreign key(cid,teacher_number) references Courses_taught_by_Teachers
)

create table Announcements(
date date, 
title varchar(50), 
type varchar(50), 
employee_number int, 
description varchar(1000),
primary key(date, title, type),
foreign key(employee_number) references Administrators)

--Hena e7na 7atena location demn el primary key 
create table Extra_Curricular_Activities(
school_number int, 
date date, 
type varchar(50), 
description varchar(1000), 
location varchar(50) NOT NULL,
teacher_number int, 
admin_number int, 
equipment varchar(1000),
primary key(school_number, date, type, location),
foreign key(school_number) references Schools on delete cascade,
foreign key(teacher_number) references Teachers  on update cascade,
foreign key(admin_number) references Administrators on update cascade)

create table Questions(
ssn int, 
question_number int IDENTITY,
course_code varchar(10), 
teacher_number int, 
content varchar(1500), 
answer varchar(2500),
primary key(ssn, question_number, course_code),
foreign key(ssn) references Enrolled on delete cascade on update cascade,
foreign key(course_code) references Courses,
foreign key(teacher_number) references Teachers on delete set null)

--not created yet
--must change content cannot be part of key

create table Reviews(
username varchar(20), 
number int identity,
content varchar(7000), 
school_number int,
primary key(username, number, school_number),
foreign key(username) references Parents,
foreign key(school_number) references Schools on delete cascade)

create table Assignments(
employee_number int, 
code varchar(10),
number int, 
posting_date date, 
content varchar(8000), 
due_date date,
primary key(employee_number, code, number),
foreign key(employee_number) references Teachers,
foreign key(code) references Courses on delete cascade)

create table Assign_Sol(
employee_number int, 
code varchar(10), 
number int, 
solution varchar(8000),
ssn int,
primary key(employee_number, code, number, ssn),
foreign key(employee_number, code, number) references Assignments on delete cascade,
foreign key(ssn) references Enrolled on delete cascade)

create table Reports(
ssn int, 
employee_number int, 
date date, 
comment varchar(2500),
reply varchar(2500), 
username varchar(20),
primary key(ssn, employee_number, date),
foreign key(ssn) references Enrolled on delete cascade,
foreign key(employee_number) references Teachers on delete cascade,
foreign key(username) references Parents on delete set null)
--Hena bardo nafs el moshkela en el location ba2et primary key
create table Activity_appliedForBy_Enrolled(
ssn int, 
school_number int, 
date date, 
type varchar(50),
location varchar(50),
primary key(ssn, school_number, date, type, location),
foreign key(school_number, date, type, location) references Extra_Curricular_Activities on delete cascade,
foreign key(ssn) references Enrolled on delete cascade)

create table Ratings(
username varchar(20), 
employee_number int,
ssn int, 
rating int,
primary key(username, employee_number, ssn),
foreign key(username) references Parents on delete cascade,
foreign key(employee_number) references Teachers on delete cascade,
foreign key(ssn) references Enrolled on delete cascade,
check (rating>=0 AND rating<=10))

create table School_Applications(
username varchar(20), 
school_number int, 
ssn int, 
status bit,
primary key(username, school_number, ssn),
foreign key(username) references Parents on delete no action,
foreign key(school_number) references Schools on delete cascade,
foreign key(ssn) references Children on delete cascade)

--This table is edited in schema !! 
create table Courses_taught_in_Schools(
school_number int, 
code varchar(10), 
grade int,
level varchar(20) NOT NULL ,
primary key(school_number, code),
foreign key(school_number) references Schools on delete cascade,
foreign key(code) references Courses on delete cascade,
constraint grade_check check( ( ( grade >=1 and grade <=6 ) and (level = 'Elementary') ) OR 
( ( grade >=7 and grade <=9 ) and (level = 'Middle') ) OR 
( ( grade >=10 and grade <=12 ) and (level = 'High') ) )
)

create table Assignment_Sol_graded_by_Teachers(
employee_number int, 
code varchar(10), 
number int, 
ssn int, 
mark real,
primary key(employee_number, code, number, ssn),
foreign key(employee_number, code, number, ssn) references Assign_Sol on delete cascade)

create table Clubs_joins_Enrolled(
school_number int, 
name varchar(50), 
ssn int,
primary key(school_number, name, ssn),
foreign key(school_number, name) references Clubs on delete cascade,
foreign key(ssn) references Enrolled on delete cascade)

create table Courses_Prerequisite_Courses(
course_code varchar(10), 
prerequisite_code varchar(10),
primary key(course_code, prerequisite_code),
foreign key(course_code) references Courses on delete cascade,
foreign key(prerequisite_code) references Courses on delete no action)

