--System Admin Stories
use SchoolSystem
go

--Story 1
create proc create_school
@name varchar(50), @general_information varchar(1000), @type varchar(20),
@main_language varchar(20), @mission varchar(1000), @vision varchar(1000), @address varchar(1000), @fees real, @email varchar(100), @phone_number varchar(20), 
@elementary bit, @middle bit, @high bit 
as
insert into Schools(name, general_information, type, main_language, mission, vision, address, fees)
values(@name, @general_information, @type, @main_language, @mission, @vision, @address, @fees)
declare @school_no int
set @school_no = SCOPE_IDENTITY() --scope_identity returns id of last inserted record in the table that's the scope of this procedure
insert into School_Phone_Numbers(school_number, phone_number)
values(@school_no, @phone_number)
insert into School_Emails(school_number, email)
values(@school_no, @email) 
if @elementary=1
insert into Elementary_Schools(school_number)
values(@school_no)
if @middle=1
insert into Middle_Schools(school_number)
values(@school_no)
if @high=1
insert into High_Schools(school_number)
values(@school_no)
go


create proc add_school_email
@school_number int, @email varchar(100)
as
declare @schoolExists int
set @schoolExists = (select count(*) from Schools where school_number=@school_number)
if @schoolExists > 0
insert into School_Emails(school_number, email)
values(@school_number, @email)
else
print'School does not exist'
go

create proc add_school_phone
@school_number varchar(20), @phone int
as
declare @schoolExists int
set @schoolExists = (select count(*) from Schools where school_number=@school_number)
if @schoolExists > 0
insert into School_Phone_Numbers(school_number, phone_number)
values(@school_number, @phone)
else
print'School does not exist'
go

--Story 2
--how to specify more than one prerequisite
create proc add_courses
@code varchar(10), @name varchar(50), @description varchar(1000)
as
insert into Courses(code, name, description)
values(@code, @name, @description)
go

create proc add_courses_to_schools
@code varchar(10), @school_number int, @level varchar(20), @grade int
 as
 declare @courseExists int =(select count(*) from Courses where code=@code)
 if(@courseExists > 0)
insert into Courses_taught_in_Schools(school_number, code, grade, level)
values(@school_number, @code, @grade, @level)
 go

create proc add_prerequisite
@code varchar(10), @prerequisite varchar(10)
as
declare @CourseExists int = (SELECT count(*) FROM Courses WHERE code = @code)
declare @PreExists int = (SELECT count(*) FROM Courses WHERE code = @prerequisite)
if (@CourseExists > 0) and (@PreExists > 0)
insert into Courses_Prerequisite_Courses(course_code, prerequisite_code)
values(@code, @prerequisite)
else
print('Course does not exist')
go

--Story 3
--how to get identity of last inserted employee //done
create proc add_admin
@first_name varchar(20), @middle_Name varchar(20), @last_name varchar(20), @birthdate date, @email varchar(100), @address varchar(100), @username varchar(20), 
@password varchar(20), @gender varchar(10), @school_name varchar(50)
as
declare @schoolExists int = (SELECT count(*) FROM Schools WHERE name = @school_name)
if (@schoolExists > 0)
begin
declare @school_type varchar(20), @school_no int
select @school_no = S.school_number, @school_type = S.type 
from Schools S
where S.name=@school_name
if (@school_type = 'national')
insert into Employees(first_name, middle_name, last_name, birthdate, email, address, username, password, gender, school_number, salary)
values(@first_name, @middle_name, @last_name, @birthdate, @email, @address, @username, @password, @gender, @school_no, 3000)
else
insert into Employees(first_name, middle_name, last_name, birthdate, email, address, username, password, gender, school_number, salary)
values(@first_name, @middle_name, @last_name, @birthdate, @email, @address, @username, @password, @gender, @school_no, 5000)
insert into Administrators(employee_number)
values(SCOPE_IDENTITY())
end
else
print 'School does not exist.'
go

--Story 4
--Remove with school_number for now!
--How to set usernames and passwords for this school personnel to null // done
create proc remove_school
@school_number int
as
Update Enrolled
set username=null, password=null
where school_number=@school_number
Update Employees
set username=null, password=null
where school_number=@school_number
delete Schools
from Schools
where school_number = @school_number
go

--Sytem user Stories


--story 1
create proc search_schools
@keyword varchar(1000)
as
declare @byName int =(select count(*) from Schools where @keyword=name)
if @byName>0
select *
from Schools
where name=@keyword
else
begin
declare @byAddress int =(select count(*) from Schools where @keyword=address)
if @byAddress>0
select *
from Schools
where address=@keyword
else
begin
declare @byType int =(select count(*) from Schools where @keyword=type) 
if @byType>0
select *
from Schools
where type=@keyword
else
print 'No school with supplied description'
end
end
go

--story 2
create proc show_Schools_by_levels
as
select *, 'high' as 'level'
from Schools, High_Schools
where Schools.school_number=High_Schools.school_number
select *, 'Middle' as 'level'
from Schools, Middle_Schools
where Schools.school_number=Middle_Schools.school_number
select *, 'Elementary' as 'level'
from Schools, Elementary_Schools
where Schools.school_number=Elementary_Schools.school_number
go


create proc show_School_info
@name varchar(50)
as
declare @school_number int
select @school_number=S.school_number
from Schools S
where S.name=@name
select *
from Schools S
where S.name=@name
select E.employee_number, E.first_name, E.middle_name, E.last_name, E.birthdate, E.email, E.username, E.gender
from Teachers T inner join Employees E on T.employee_number=E.employee_number
where E.school_number=@school_number
select *
from Reviews R
where R.school_number=@school_number
go
--Adminstrator Stories
--Here the procedure works as helper to let me get the school_number of the admin after he/she enters the id
CREATE PROC GetschoolNumberForAdmins
@input int , @output int output
AS
SELECT @output=E.school_number
FROM Administrators A inner join Employees E on E.employee_number=A.employee_number
WHERE @input = A.employee_number
go
--Story 1
--Here to view the teachers in the same school of  the administrator by entering administrator's school number

Create Proc ViewTeachersInMySchool
@admin_id int 
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
SELECT E.*,T.*
From Teachers T inner join Employees E on E.employee_number=T.employee_number
Where E.school_number=@school_number
go

--Here to assign the unique username and the password of specific teacher by entering his/her id
--exec AssignUsernameandPasswordforTeachers


CREATE PROC AssignUsernameandPasswordforTeachers
@username varchar(20) , @password varchar(20) , @teacher_id int ,@admin_id int
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
update Employees 
Set username = @username, password = @password
where employee_number= @teacher_id and school_number=@school_number
go

--It's kind of helper procedure to let me get the experience years of specific teacher by entering his/her id

CREATE PROC Getexpyears
@teacher_id int,
@years int output
AS 
SELECT @years= experience_years
From Teachers
where employee_number = @teacher_id
go

CREATE PROC GetschoolNumberForTeachers
@teacher_id int,
@school_number_teacher int output
AS
Select @school_number_teacher=E.school_number
from Employees E inner join Teachers T on T.employee_number=E.employee_number
where @teacher_id=T.employee_number
go

--Here Updating the teacher's salary whenever the exp. years are increased 
CREATE PROC UpdateTeacherSalary
 @teacher_id int,@admin_id int
 AS
 declare @school_number int
 exec GetschoolNumberForAdmins @admin_id , @school_number output
 declare @exp int
 exec Getexpyears @teacher_id, @exp output
 declare @school_number_teacher int
 exec GetschoolNumberForTeachers @teacher_id , @school_number_teacher output
 if(@school_number=@school_number_teacher)
 begin
 UPDATE Employees
 SET salary = 500 * @exp
 where @teacher_id = employee_number
 end
 else
 Print 'YOU are not authorized to update the salary'
 go

--Sotry 2
--Viewing the students' info who are in the same school as the administrator by entering admin_id only

CREATE PROC ViewStudentsinMySchool
@admin_id int
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
select E.*
FROM Enrolled E 
where E.school_number = @school_number
go

--Assigning usernames and passwords for specific student by entering his/her ssn 
CREATE PROC AssignUsernameandPasswordforStudents
@username varchar(20), @password varchar(20) , @id int, @admin_id int
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Enrolled
SET username = @username , password = @password 
where @id = ssn and school_number = @school_number
go
--Story3
--Here the admin adds more admins in his/her school

CREATE PROC AddMoreAdmins
@first_name varchar(20) , @middle_name varchar(20), @last_name varchar(20),@date date,@address varchar(100) , @email varchar(100),@username varchar(20),
@password varchar(20) , @gender varchar(10),@admin_id int
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
insert into Employees(first_name,middle_Name,last_name,birthdate,address,email,username,password,gender,school_number)
values(@first_name,@middle_name,@last_name,@date,@address,@email,@username,@password,@gender,@school_number)
insert into Administrators (employee_number)
values(SCOPE_IDENTITY())
go

--Stroy 4 
--Deleting Employees
CREATE PROC DeleteEmployees
@id int , @admin_id int
As
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
Delete from Employees
where employee_number=@id and school_number=@school_number
go

--Deleting students

Create Proc DeleteEnrolled
@ssn int, @admin_id int
AS
declare @school_number int, @count int
exec GetschoolNumberForAdmins @admin_id , @school_number output
Select @count=count(E.ssn)
from Children C inner join Enrolled E on C.ssn = E.ssn
Where E.ssn = @ssn and E.school_number = @school_number
if(@count>0)
begin
Delete from Enrolled 
where @ssn = ssn 
end
else
print 'Invalid Deletion'
go

--Story 5
--Editing the School's name
CREATE PROC EditSchoolName
@admin_id int , @name varchar(50)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET name = @name
where @school_number = school_number
go

--Editing the School's General Information
CREATE PROC EditSchoolInfo
@admin_id int , @text varchar(1000)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET general_information=@text
where @school_number = school_number
go

--Editing the School's type
CREATE PROC EditSchooltype
@admin_id int , @text varchar(20)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
if(@text='International' or @text='National')
begin
UPDATE Schools
SET type = @text
where @school_number = school_number
end
else
print 'Invalid type'
go

--Edit the School's language

CREATE PROC EditSchoolLanguage
@admin_id int , @text varchar(20)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET main_language = @text
where @school_number = school_number
go

--Edit the School's Mission
CREATE PROC EditSchoolMission
@admin_id int , @text varchar(1000)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET mission=@text
where @school_number = school_number
go
--Edit the  School's Vision
CREATE PROC EditSchoolVision
@admin_id int , @text varchar(1000)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET vision=@text
where @school_number = school_number
go

--Edit the SCHOOL'S ADDRESS
CREATE PROC EditSchoolAddress
@admin_id int , @text varchar(1000)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET address = @text
where @school_number = school_number
go

--Edit the fees of the school
CREATE PROC EditSchoolFees
@admin_id int , @fees real
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE Schools
SET fees=@fees
where @school_number = school_number
go

--Story 6
--Here the administrator posts the announcements
CREATE PROC PostAnnouncement
@date date,@title varchar(50) , @description varchar(1000) , @type varchar(50) , @admin_id int
As
insert into Announcements (date,title,description,type,employee_number)
values(@date,@title,@description,@type,@admin_id)
go

--Story 7
--Assigning the extra curricular activity to a certain teacher with all the activity's info, and here we double check that
--the teacher should be in the same school as the administrator
CREATE PROC CreateActivity
@date date,@location varchar(50) , @type varchar(50), @equipment varchar(1000) , @description varchar(1000) , @teacher_id int ,@admin_id int
AS
declare @school_number int , @school_teacher int
exec GetschoolNumberForAdmins @admin_id , @school_number output
exec GetschoolNumberForTeachers @teacher_id , @school_teacher output
if(@school_teacher = @school_number)
begin
insert into Extra_Curricular_Activities (date,location,type,equipment,description,teacher_number,admin_number,school_number)
values(@date,@location,@type,@equipment,@description,@teacher_id,@admin_id,@school_number)
end
else
begin
print 'You don''t have authority on this teacher'
end
go

--Story 8
--Change the teacher of specific activity
CREATE PROC ChangeTeacherActivity
@new_teacher_id int , @old_teacher_id int , @admin_number int , @location varchar(50),@date date , @type varchar(50)
AS
declare @school_number int
exec GetschoolNumberForAdmins @admin_number , @school_number output
UPDATE Extra_Curricular_Activities
SET teacher_number = @new_teacher_id
where location=@location and @admin_number=admin_number and type=@type and date = @date and @school_number=school_number
go

--Story 9
--Here we assign teacher to specific course and we double check whether the school of the admin includes the grade of the course assigned to the teacher or not
CREATE PROC AssignTeachersToCourses
@admin_id int , @teacher_id int , @ccode varchar(10) , @grade int
AS
declare @school_number int , @counter int , @school_teacher int
exec GetschoolNumberForAdmins @admin_id , @school_number output
exec GetschoolNumberForTeachers @teacher_id , @school_teacher output
SELECT @counter=count(*)
FROM Courses_taught_in_Schools C 
WHERE @grade = C.grade and @school_number = C.school_number
if(@counter > 0 and @school_number=@school_teacher)
begin 
insert into Courses_taught_by_Teachers (cid,teacher_number)
values(@ccode,@teacher_id)
end
else
print 'Your School doesn''t offer this grade !!'
go

--Story 10
--Here we make some teachers supervisors to other teachers, we also double check if the supervisor to be assigned is already a supervisor or not 

CREATE PROC AssignSupervisors
@supervisor_id int , @non_supervisor_id int 
AS
declare @is_Already_supervisor int
SELECT @is_Already_supervisor=count(*)
FROM Supervisors S
WHERE @supervisor_id = S.employee_number
if(@is_Already_supervisor = 0)
begin
Print 'Not Valid Supervisor id'
end
else
begin
insert into Nonsupervisors (employee_number,supervisor_employee_number)
values(@non_supervisor_id,@supervisor_id)
end
go

--Story 11
--Here we either accept the application or not for a specific Child (ssn) with the username of his/her parent
CREATE PROC AcceptOrRejectApplicationForm 
@ssn int , @username varchar(20) , @admin_id int , @reply bit
AS
declare @school_number int 
exec GetschoolNumberForAdmins @admin_id , @school_number output
UPDATE School_Applications
SET status = @reply
where @ssn = ssn and @username = username and @school_number=school_number 
go

--DROP PROC Teacher_Sign_Up
CREATE PROC Teacher_Sign_Up
@first_name VARCHAR(20), 
@middle_name VARCHAR(20), 
@last_name VARCHAR(20), 
@birthdate DATE, 
@email VARCHAR(100), 
@address VARCHAR(200), 
@gender VARCHAR(10),
@school_number INT,
@hire_date DATE
AS

IF(YEAR(current_TIMESTAMP)- YEAR(@hire_date) <= 15) 
BEGIN
INSERT INTO Employees (first_name, middle_Name, last_name, birthdate, email, gender, school_number)
VALUES (@first_name, @middle_name, @last_name, @birthdate, @email, @gender, @school_number)
DECLARE @id INT
SET @id = SCOPE_IDENTITY()
INSERT INTO Teachers (employee_number,hire_date)
VALUES (@id,@hire_date)
INSERT INTO Nonsupervisors(employee_number) 
VALUES(@id)
END
ELSE
BEGIN
INSERT INTO Employees (first_name, middle_Name, last_name, birthdate, email, gender, school_number)
VALUES (@first_name, @middle_name, @last_name, @birthdate, @email, @gender, @school_number)
DECLARE @id1 INT
SET @id1 = SCOPE_IDENTITY()
INSERT INTO Teachers (employee_number,hire_date)
VALUES (@id1,@hire_date)
INSERT INTO Supervisors(employee_number) 
VALUES(@id1)
END

--2 View a list of courses’ names I teach categorized by level and grade.
GO
--DROP PROC View_Courses
CREATE PROC View_Courses
@teacher_id INT
AS
SELECT GC.level, GC.grade, C.name
FROM Courses_taught_by_Teachers T INNER JOIN Courses C ON  (T.cid  = C.code) INNER JOIN Courses_taught_in_Schools  GC ON (C.code = GC.code)
WHERE T.teacher_number=@teacher_id
GROUP BY GC.level, GC.grade, C.name


--3 Post assignments for the course(s) I teach. Every assignment has a posting date, due date and content.
GO
--DROP PROC Post_Assignment
CREATE PROC Post_Assignment
@employee_number INT, @code VARCHAR(10), @number INT, @posting_date DATE, @content VARCHAR(5000), @due_date DATE
AS
INSERT INTO Assignments (employee_number,code ,number , posting_date , content, due_date)
VALUES (@employee_number, @code, @number, @posting_date, @content, @due_date)




--4 View the students’ solutions for the assignments I posted ordered by students’ ids.
GO
--DROP PROC View_Assignment_Solutions
CREATE PROC View_Assignment_Solutions
@teacher_id INT
AS
SELECT A.ssn, A.solution
FROM Assign_Sol A
WHERE A.employee_number = @teacher_id
ORDER BY A.ssn



--5 Grade the students’ solutions for the assignments I posted.
GO
--DROP PROC Grade_Assignment_Solutions
CREATE PROC Grade_Assignment_Solutions
@employee_number int, 
@code varchar(10), 
@number int, 
@ssn int, 
@mark real
AS
INSERT INTO  Assignment_Sol_graded_by_Teachers (employee_number, code, number, ssn, mark)
VALUES (@employee_number, @code, @number, @ssn, @mark )


-- 6 Delete assignments
GO
--DROP PROC Delete_Assignmnets
CREATE PROC Delete_Assignmnets
@employee_number INT, 
@code VARCHAR(10),
@number INT
AS
DELETE FROM Assignments 
WHERE employee_number = @employee_number AND code = @code AND number = @number




-- 7 Write monthly reports about every student I teach. A report is issued on a specific date to a specific student and contains my comment.
GO
--DROP PROC Write_Report
CREATE PROC Write_Report
@ssn INT, 
@employee_number INT, 
@date DATE, 
@comment VARCHAR(2500)
AS
DECLARE @counter int
SELECT @counter = COUNT(*) 
FROM Students_taught_by_Teachers
WHERE @employee_number = teacher_number AND ssn  =@ssn

IF(@counter>0)
INSERT INTO Reports(ssn, employee_number, date, comment)
VALUES(@ssn, @employee_number, @date, @comment)
ELSE
PRINT('Invalid Entry')



--8 View the questions asked by the students for each course I teach.
GO
--DROP PROC View_Questions
CREATE PROC View_Questions
@teacher_ID INT
AS
SELECT Q.content, CH.name, C.name
FROM Questions Q INNER JOIN Students_taught_by_Teachers T ON (T.teacher_number = Q.teacher_number) INNER JOIN Courses C	on (T.cid = C.code)
INNER JOIN Children CH ON (CH.ssn = Q.SSN) INNER JOIN  Enrolled E ON (E.ssn = CH.SSN)
WHERE Q.teacher_number = @teacher_ID


--9 Answer the questions asked by the students for each course I teach.
GO
--DROP PROC Answer_Question
CREATE PROC Answer_Question
@teacher_ID INT,
@ssn INT, 
@question_number INT,
@answer VARCHAR(2500)
AS
UPDATE Questions
SET answer = @answer
WHERE teacher_number= @teacher_ID AND ssn= @ssn AND question_number = @question_number


-- 10 View a list of students that i teach categorized by the grade and ordered by their name (first name and last name).
GO
--DROP PROC Students_Categorized
CREATE PROC Students_Categorized
@teacher_ID INT
AS
SELECT E.grade, C.name
FROM Students_taught_by_Teachers T INNER JOIN Enrolled  E ON (T.ssn = E.ssn) INNER JOIN Children C ON (E.ssn = C.ssn)
WHERE T.teacher_number = @teacher_ID
GROUP BY E.grade, C.name
ORDER BY C.name

-- 11 View a list of students that did not join any activity
GO
--DROP PROC Students_No_Activities
CREATE PROC Students_No_Activities
@teacher_ID INT
AS
SELECT C.*, E.*
FROM Children C  INNER JOIN Enrolled E ON (C.ssn = E.ssn) INNER JOIN Students_taught_by_Teachers T ON (T.ssn = E.ssn)
WHERE T.teacher_number = @teacher_ID AND NOT EXISTS 
(SELECT *
FROM Activity_appliedForBy_Enrolled A
WHERE A.ssn = C.ssn)

--12 Display the name of the high school student who is currently a member of the greatest number of clubs.
GO
--DROP PROC Student_Most_Clubs 
CREATE PROC Student_Most_Clubs 
@teacher_ID INT
AS
SELECT C.name, COUNT(CM.name) AS 'Number of Clubs'
FROM Children C  INNER JOIN Enrolled E ON (C.ssn = E.ssn) INNER JOIN High_Schools HS ON (E.school_number = HS.school_number)
INNER JOIN Clubs_joins_Enrolled CM ON(E.SSN = CM.ssn) INNER JOIN Students_taught_by_Teachers T ON (T.ssn = E.ssn)
WHERE T.teacher_number  = @teacher_ID
GROUP BY C.name
HAVING COUNT(CM.name) >= ALL
(SELECT COUNT(CM1.name)
FROM Children C1  INNER JOIN Enrolled E1 ON (C1.ssn = E1.ssn) INNER JOIN High_Schools HS1 ON (E1.school_number = HS1.school_number)
INNER JOIN Clubs_joins_Enrolled CM1 ON(E1.SSN = CM1.ssn) INNER JOIN Students_taught_by_Teachers T1 ON (T1.ssn = E1.ssn)
WHERE T1.teacher_number = @teacher_ID
GROUP BY C1.name)
go

--story (1) parent-sign-up
create proc sign_up_parent
@username varchar(20) , @password varchar(20) , @first_name varchar(20) , @last_name varchar(20) , @home_num varchar(20)
, @addrss varchar(20) , @mail varchar(20) , @mobile_number varchar (20)
as
insert into Parents (username , password , first_name , last_name , home_number , address , email)
values (@username , @password , @first_name , @last_name , @home_num , @addrss , @mail)
insert into Parent_Cell_Numbers (username , mobile_number)
values (@username , @mobile_number)
go
--story (2) apply for children 
create proc apply_for_child
@username varchar(20),@school_number int,@ssn int , @name varchar(20) , @birth_date datetime , @gender varchar(10)
as
insert into Children (ssn , name , birth_date , gender)
values (@ssn , @name , @birth_date , @gender) 
insert into School_Applications (username , school_number , ssn ) values (@username , @school_number , @ssn)
 go 

 --story (3) view schools that accept my children
create proc view_schools
 @username varchar(20)
 as
 select c.ssn, s.*
 from (((Parents p inner join School_Applications sa on p.username = sa.username) inner join Children c on sa.ssn = c.ssn) inner Join Schools s on sa.school_number = s.school_number)
 where sa.status =1 and p.username=@username
 order by c.ssn
 go
 
 -- story (4) enroll my child in one of the accepted school (no verifications for him/her)
 create proc enroll_without_verification
 @ssn int , @school_num int , @grade int
 as 
 declare @sco int
 if (@grade >=1 And @grade <=6)
 begin
 select @sco =count (*)
 From Elementary_Schools 
 where @school_num = school_number
 if (@sco > 0)
 insert into Enrolled (ssn , school_number , grade)
 values (@ssn , @school_num , @grade)
 end
 else  if (@grade >=7 And @grade <=9)
 begin
 select @sco =count (*)
 From middle_Schools 
 where @school_num = school_number
 if (@sco > 0)
 insert into Enrolled (ssn , school_number , grade)
 values (@ssn , @school_num , @grade)
 end
 else  if (@grade >=10 And @grade <=12)
 begin
 select @sco =count (*)
 From high_Schools 
 where @school_num = school_number
 if (@sco > 0)
 insert into Enrolled (ssn , school_number , grade)
 values (@ssn , @school_num , @grade)
 end
 go
 -- story (5) view reports written about children 
 create  proc view_report
 @username varchar(20) 
 as
 select  e.ssn,  r.employee_number , r.comment ,  r.date ,  r.reply 
 from Parents p inner join School_Applications sa on p.username = sa.username inner join Enrolled e on sa.ssn = e.ssn inner join Reports r on e.ssn = r.ssn inner join Teachers t on r.employee_number = t.employee_number 
 inner join Employees em on em.employee_number = t.employee_number
 WHERE @username = p.username
 go
 
 -- story (6) reply on reports 
 create proc reply_on_report
 @username varchar(20) ,@reply varchar (2500) , @ssn int , @emp_num int , @date date 
 as
 update Reports 
 set reply = @reply ,username = @username 
 where 
 Reports.date = @date and Reports.employee_number = @emp_num and Reports.ssn = @ssn 
 go
 
 -- story (7) view all schools of my children order by its name
 create proc schools_of_children
 @username varchar (20) 
 as
 select s.*
 from Parents p inner join School_Applications sa on p.username = sa.username inner join Enrolled e on sa.ssn = e.ssn inner join
 Schools s on e.school_number = s.school_number
 where p.username = @username and e.username is not null and e.password is not null
 order by s.name
 go

 -- story (8) View the announcements posted within the past 10 days about a school if one of my children is in it
create proc view_announcements
@username varchar (20) 
as
select a.*
 from Parents p inner join School_Applications sa on p.username = sa.username inner join Enrolled e on sa.ssn = e.ssn inner join
 Schools s on e.school_number = s.school_number inner join Employees em on em.school_number = s.school_number inner join
 Announcements a on a.employee_number = em.employee_number
 where p.username = @username and e.username is not null and e.password is not null and  year(CURRENT_TIMESTAMP)*365 + month(CURRENT_TIMESTAMP)*30 + day(CURRENT_TIMESTAMP) - (year(a.date)*365 + month(a.date)*30 + day(a.date)) <=10  
 go
 
 -- story (9) Rate any teacher that teaches my children.
 create proc rate
 @username varchar (20) , @ssn int , @employee_number int , @rate int
 as
 declare @c int 
 select @c = count (*)
 from Students_taught_by_Teachers 
 where ssn = @ssn and teacher_number = @employee_number
 if(@c >0)
 begin
 insert into Ratings (username , employee_number , ssn , rating ) 
 values (@username , @employee_number , @ssn , @rate )
 end
 else 
 print ' It is not your childs teacher ' 
 go

 -- story (10) Write reviews about my children’s school(s).
 create proc write_review 
 @username varchar(20) , @school_number int , @content varchar(8000) 
 as
 declare @c int
select @c = count (*)
From 
Parents p inner join School_Applications sa on p.username = sa.username inner join Enrolled e on sa.ssn = e.ssn inner join Schools s on e.school_number = s.school_number
where s.school_number = @school_number
group by s.school_number
 if(@c >0)
 begin
 insert into Reviews ( username , content , school_number) values (@username  ,@content , @school_number)
 end 
 else 
 print ' it is not your childs school '
   go
   
-- story (11) Delete a review that i have written.
create proc delete_review 
@username varchar(20) , @school_number int , @content varchar(8000) 
as
delete from Reviews where username = @username and content = @content and school_number = @school_number
go

-- story (12) calculate the overall rating of a teacher
create proc overall_rating
@employee_number int 
as
declare @avg real
declare @sum int
declare @total int
select @sum = sum(rating) , @total = count(*)
from Ratings where Ratings.employee_number = @employee_number
set @avg = @sum / @total 
print @avg
go
-- story (13) View the top 10 schools with the highest number of reviews or highest number of enrolled students This should exclude schools that my children are enrolled in.
create proc top_ten_schools_review
 @username varchar (20) 
 as
 declare @reviews int; 
 with temp as (
 select
   s.school_number ,  s.name ,  s.general_information ,s.type ,  s.main_language ,  s.mission ,  s.vision ,  s.address , s.fees
 from
 Schools s
 except
  select  s.school_number , s.name , s.general_information , s.type , s.main_language ,s.mission , s.vision ,  s.address ,  s.fees
 from School_Applications inner join Enrolled on School_Applications.school_number = Enrolled.school_number inner join Schools s on s.school_number = Enrolled.school_number
 where School_Applications.username = @username )  
select top  10 t.school_number , t.name , t.general_information
 , t.type , t.main_language ,  t.mission ,  t.vision ,  t.address , t.fees,    count (*)
 from temp t inner join Reviews r on t.school_number = r.school_number
 group by t.school_number , t.name , t.general_information
 , t.type , t.main_language ,  t.mission ,  t.vision ,  t.address , t.fees
  order by count(*)  desc
 go

 create proc top_ten_schools_enrolled

 @username varchar (20) 
 as
 declare @enrolled int ;
 with temp as (
 select
   s.school_number ,  s.name ,  s.general_information ,s.type ,  s.main_language ,  s.mission ,  s.vision ,  s.address , s.fees
 from
 Schools s
 except
  select  s.school_number , s.name , s.general_information , s.type , s.main_language ,s.mission , s.vision ,  s.address ,  s.fees
 from School_Applications inner join Enrolled on School_Applications.school_number = Enrolled.school_number inner join Schools s on s.school_number = Enrolled.school_number
 where School_Applications.username = @username )  
select top  10 
 t.school_number , t.name , t.general_information
 , t.type , t.main_language ,  t.mission ,  t.vision ,  t.address , t.fees
 ,  count (*)
 from temp t inner join Enrolled on t.school_number = Enrolled.school_number
 group by t.school_number , t.name , t.general_information
 , t.type , t.main_language ,  t.mission ,  t.vision ,  t.address , t.fees
  order by count (*)  desc
 go

 select  s.school_number , s.name , s.general_information , s.type , s.main_language ,s.mission , s.vision ,  s.address ,  s.fees
 from School_Applications inner join Enrolled on School_Applications.school_number = Enrolled.school_number inner join Schools s on s.school_number = Enrolled.school_number
 where School_Applications.username = 'fathymohamed'
 -- story (14) Find the international school which has a reputation higher than all national schools (highest number of reviews) .
go
 create proc international_school_higher_reputation 
as  
select 
s.* ,count(*)
from 
Schools s inner join Reviews r on s.school_number = r.school_number
 where s.type= 'International'
 group by s.school_number , s.name , s.general_information
 , s.type , s.main_language ,  s.mission ,  s.vision ,  s.address , s.fees
 having count (r.number) > all (
 select count (r1.number) 
 from  
  Schools s1 inner join Reviews r1  on s1.school_number = r1.school_number 
  where s1.type = 'National'
  group by s1.school_number
  )  
go

--Story 1
--1 Update my account information except for the username
CREATE PROC UpdateAccountPassword
@password varchar(20) , @ssn int
AS
UPDATE Enrolled
SET password = @password
where ssn = @ssn
go
--Story 2
--2 View a list of courses’ names assigned to me based on my grade ordered by name.

CREATE PROC SeeMyCourses
@ssn int
AS
SELECT CO.name
FROM Students_taught_by_Teachers T inner join Courses_taught_in_Schools C on C.code = T.cid inner join Courses CO on CO.code = C.code inner join Enrolled E on T.ssn = E.ssn and E.grade = C.grade
WHERE T.ssn = @ssn
go
--3 Post questions I have about a certain course.
-- I have put question_number identity

CREATE PROC PostQuestions
@ssn int, @cid varchar(10) , @question_itself varchar(1500)
AS
insert into Questions (ssn,course_code,content)
values(@ssn,@cid,@question_itself)
go

-- 4 View all questions asked by other students on a certain course along with their answers.
CREATE PROC View_Questions_EnrolledStudent
@course_code VARCHAR(10)
AS
SELECT C.name, Q.content, Q.answer
FROM Questions Q INNER JOIN Courses C ON (Q.course_code = C.code)
WHERE Q.course_code = @course_code

-- 5 View the assignments posted for the courses I take.
GO
CREATE PROC View_Assignmnets_EnrolledStudent
@student_id INT
AS
SELECT C.name, A.content
FROM Students_taught_by_Teachers T INNER JOIN Enrolled E ON (T.ssn = E.ssn) INNER JOIN Assignments A ON (T.cid  = A.code) 
INNER JOIN Courses C ON (A.code  = C.code)
WHERE T.ssn = @student_id



-- 6 Solve assignments posted for courses I take.
GO
CREATE PROC Solve_Assignments_EnrolledStudent
@teacher_ID INT,
@student_ID INT,
@course_Code VARCHAR(10), 
@assignment_number INT,
@solution VARCHAR(5000)

AS
INSERT INTO Assign_Sol (employee_number, code, number, ssn, solution)
VALUES (@teacher_ID, @course_Code, @assignment_number, @student_ID, @solution)
GO

--story (7) View the grade of the assignments I solved per course.
create proc grade_assign
@ssn int , @course varchar (10) output , @grade real output
as 
select mark from Assignment_Sol_is_graded_by_Teachers where ssn = @ssn 
go
-- story (8) View the announcements posted within the past 10 days about the school I am enrolled in.
create  proc view_announcement_of_my_school
@ssn int ,@date date output ,@type varchar(50) output,@title varchar(50) output, @employee_num int output ,
@desc varchar(1000)
as
select @date = a.date , @type = a.type , @title = a.title , @employee_num = a.employee_number , @desc = a.description 
 from Schools s inner join Enrolled e on s.school_number = e.school_number inner join Employees em on em.school_number = s.school_number inner join
 Announcements a on a.employee_number = em.employee_number 
 where 
 @ssn = e.ssn and  e.username is not null and e.password is not null and  day(CURRENT_TIMESTAMP) - day(a.date) <= 10 
 go


--9 View all the information about activities offered by my school, as well as the teacher responsible for it

create proc view_activity_info
@ssn int
as
declare @school_number int = (select school_number from Enrolled where ssn=@ssn)
select E.*, T.* 
from Extra_Curricular_Activities E inner join Employees T on E.teacher_number=T.employee_number
where E.school_number=@school_number
go
--10 Apply for activities in my school on the condition that I can not join two activities of the same type on the same date.
create proc apply_for_activity
@ssn int, @school_number int, @date date, @type varchar(50),@location varchar(20)
as
declare @activityExists int = (SELECT count(*) FROM Extra_Curricular_Activities WHERE school_number = @school_number and date=@date and type=@type)
if @activityExists > 0
insert into Activity_appliedForBy_Enrolled
values(@ssn, @school_number, @date, @type, @location)
go

--11 Join clubs offered by my school, if I am a highschool student.
create proc join_club
@ssn int, @school_number int, @name varchar(50)
as
declare @clubExists int = (SELECT count(*) FROM Clubs WHERE school_number = @school_number and name=@name)
if @clubExists > 0
if (select grade from Enrolled where ssn=@ssn) >=10
insert into Clubs_joins_Enrolled
values(@school_number, @name, @ssn)
go

--12 Search in a list of courses that i take by its name or code.
create proc search_my_courses
@nameOrCode varchar(50), @ssn int
as
declare @courseExists int =(SELECT count(*) FROM Courses WHERE @nameOrCode=name OR @nameOrCode=code)
declare @code varchar(10) =(SELECT code FROM Courses WHERE @nameOrCode=name OR @nameOrCode=code)
if @courseExists=1
begin 
declare @myCourse int =(SELECT count(*) FROM Students_taught_by_Teachers WHERE @ssn=ssn AND @code=cid)
if @myCourse > 0
select *
from Courses
where @code=code
else
print 'You are not taking this course!'
end
go
