use SchoolSystem
go
--Admin Stories
exec create_school @name = 'fath school', @general_information = 'the greatest eva', @type = 'national', @elementary=1, @middle=1, @high=1,
@main_language = 'hollandische', @mission = 'rule the world', @vision = 'we dont need no vision', @address = 'the heart of maadi', @fees = 0, @email = 'fath@fath.fath', @phone_number = '00000000'

exec add_school_email 
@school_number=6, @email='fath@internet.net'

exec add_school_phone 
@school_number=6, @phone='11111111'

exec add_courses
@code = 'rwsh501', @name = 'Intro to rawshana', @description = 'el-DAB w ghadr el sohab'

exec add_courses_to_schools
@code = 'rwsh501', @school_number = 6, @level = 'elementary', @grade = 5

exec add_prerequisite
@code = 'rwsh501', @prerequisite = 'MTH1'

exec add_admin
@first_name = 'ahma', @middle_Name = 'ashaf', @last_name = '2otb', @birthdate = '07-05-1996', @email = 'negm@masr.btrk', @address = 'qasr l hayat', @username = 'aboSohab', 
@password = 'goddamnawesome', @gender = 'male', @school_name = 'fath school'

exec create_school @name = 'fathy school', @general_information = 'madrasa', @type = 'national', @elementary=1, @middle=1, @high=1,
@main_language = 'hollandische', @mission = 'no mission', @vision = 'no vision', @address = '9/1 mecca st. maadi', @fees = 8000, @email = 'fathy@gmail.com', @phone_number = 25887001

exec add_admin
@first_name = 'ahma', @middle_Name = 'ashaf', @last_name = '2otb', @birthdate = '07-05-1996', @email = 'email@mail.mail', @address = 'qasr l masr', @username = 'Batron', 
@password = 'password', @gender = 'male', @school_name = 'fathy school'

exec remove_school
@school_number = 7


--User Stories
exec search_schools
@keyword = 'fath school'

exec search_schools
@keyword = 'the heart of maadi'

exec search_schools
@keyword = 'national'

exec show_Schools_by_levels

exec show_School_info
@name='modern school'
exec show_School_info
@name='El-Nokrashy'
exec show_School_info
@name='Ebn-Khaldon'
exec show_School_info
@name='El-Masrya'
exec show_School_info
@name='El-Shwefat'
exec show_School_info
@name='fath school'
--Administrators Stories
--Story 1
exec  ViewTeachersInMySchool 11
exec AssignUsernameandPasswordforTeachers 'hema_ebra','52563dsdsa',1,11
exec UpdateTeacherSalary 1 , 11
--Story 2
exec ViewStudentsinMySchool 11
exec AssignUsernameandPasswordforStudents 'hey_boy','4586663321',1,11
--Story 3
exec AddMoreAdmins 'ahmed','mohamed','ali','1990-6-9','Nasr City','medo@ali.cbu','medoz','5555','Male',11
--Story 4
exec DeleteEmployees 26,11
exec DeleteEnrolled 169 , 11
--Story 5
exec EditSchoolName 11 , 'No2rashy beeh'
exec EditSchoolInfo 11 , 'The best'
exec EditSchooltype 11 , 'International'
exec EditSchoolLanguage 11 , 'German'
exec EditSchoolMission 11 , 'Nothing'
exec EditSchoolVision 11 , 'Design a new Concept'
exec EditSchoolAddress 11 , 'El-Haram'
exec EditSchoolFees 11 , 6693.03
--Story 6
exec PostAnnouncement '2016-1-2','Hello_World','Nothing','IDK',11
--Story 7
exec CreateActivity '2016-3-2','In the great hall','Football','Barcelona t-shirts','wonderful event',6,11
--Story 8
exec ChangeTeacherActivity 9,4,19,'C1','2015-9-22','Art'
--Story 9
exec AssignTeachersToCourses 11 , 6 ,'MTH1',1
--Story 10
exec AssignSupervisors 10 , 6
--Story 11
exec AcceptOrRejectApplicationForm 1,'lanaDelRey',11,'0'

--Teacher

--Story 1: Sign up by providing my first name, middle name, last name, birthdate, address, email, and gender.
EXEC Teacher_Sign_Up 'ahmed', 'hamdi' , 'ebied' , '1996-07-15', 'ah962@live.com' , '28-Makram Ebied' , 'male' , 1, '2000-10-10'

--Story 2: View a list of courses’ names I teach categorized by level and grade.
EXEC View_Courses 1

--Story 3: Post assignments for the course(s) I teach. Every assignment has a posting date, due date and content.
EXEC Post_Assignment 1, 'MTH1', 10, '2016-11-23', 'Your Assignment is to be happy and have a nice day', '2016-11-24'

--Story 4: View the students’ solutions for the assignments I posted ordered by students’ ids.
EXEC View_Assignment_Solutions 1

--Story 5: Grade the students’ solutions for the assignments I posted.
--The following insertions are curcial in order to run the coming proc successfully
INSERT INTO Children(ssn, name, birth_date, gender)
VALUES(36, 'Mahmdouh Ahmed', '1996-10-10', 'male')
INSERT INTO Enrolled(ssn, username, school_number, grade)
VALUES (36,'ahmedHamdi', 1, 1)
INSERT INTO Courses(code, name, description)
VALUES('MTH10', 'Math 10','This is an introductory math course that goes through math for astrnauts.')
insert into Courses_taught_by_Teachers (teacher_number,cid)
values (1,'MTH10')
insert into Assignments (employee_number , code , number , posting_date , content , due_date)
values (1,'MTH10',100,'2015-09-22','solve it','2015-10-01')
insert into Assign_Sol(employee_number,code,number,solution,ssn)
values(1,'MTH10',100,'no thing',36)


EXEC Grade_Assignment_Solutions 1, 'MTH10', 100,36 , 20

--Story 6: Delete assignments
EXEC Delete_Assignmnets 1, 'MTH1', 1

--Story 7: Write monthly reports about every student I teach. A report is issued on a specific date to a specific student and contains my comment.
EXEC Write_Report 1, 1, '2016-11-23', 'Great Work.'

--Story 8: View the questions asked by the students for each course I teach.
EXEC View_Questions 1

--Story 9: Answer the questions asked by the students for each course I teach.
EXEC Answer_Question 1,1, 1,'The answer is 9.'

--Story 10: View a list of students that i teach categorized by the grade and ordered by their name (first name and last name).
EXEC Students_Categorized 1 

--Story 11: View a list of students that did not join any activity
EXEC Students_No_Activities 1 

--Story 12: Display the name of the high school student who is currently a member of the greatest number of clubs.
EXEC Student_Most_Clubs 4 


-- parents
-- story 1
exec sign_up_parent 'alifady' , 'ali2011' , 'Ali' , 'Fady' , '0225230622' , 'El-Nakhil' , 'alifady@yahoo.com' , '01154623965'
-- story 2
exec apply_for_child 'alifady' , 2 , 15 , 'Mazen' ,'2000-05-12' , 'male'
-- story 3
exec view_schools 'edSheeran'
-- story 4
exec enroll_without_verification 15 , 1 , 1
-- story 5
exec view_report 'fathymohamed'
-- story 6
exec reply_on_report 'alifady' , 'Thankyou' , 1 , 1 , '2015-10-10'
-- story 7
exec schools_of_children 'fathymohamed'
-- story 8  
exec view_announcements 'fathymohamed'
-- story 9
exec rate 'fathymohamed' , 1 , 1 , 8
-- story 10
exec write_review 'alifady' , 2  , 'good mission'
-- story 11 
exec delete_review 'alifady' , 2 , 'good mission'
-- story 12 
exec overall_rating 1
-- story 13
exec top_ten_schools_review 'fathymohamed'

exec top_ten_schools_enrolled 'fathymohamed'
-- story 14
exec international_school_higher_reputation 
--Enrolled Stories

--Story 1
exec  UpdateAccountPassword '555962' ,2
--Story 2
exec SeeMyCourses 2
--Story 3
exec PostQuestions 2,'MTH20','HOW is infinity?'
--Story 4: View all questions asked by other students on a certain course along with their answers.
EXEC View_Questions_EnrolledStudent 'MTH1'

--Story 5: View the assignments posted for the courses I take.
EXEC View_Assignmnets_EnrolledStudent 1

-- Story 6: Solve assignments posted for courses I take.
EXEC Solve_Assignments_EnrolledStudent 1, 1, 'MTH1',  11,'2+2=4'
--story 7 
exec grade_assign 2
-- story 8 
exec view_announcement_of_my_school 2
-- story 9
exec view_activity_info 2
-- story 10
exec apply_for_Activity
@ssn=1, @school_number=1, @date='9/21/2015', @type='sport'
-- story 11
exec join_Club 
4, 4, Bedaya
-- story 12
exec search_My_Courses @ssn=1, @nameOrCode='MTH1'

