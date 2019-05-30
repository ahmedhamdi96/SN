use SchoolSystem
go

--1
INSERT INTO Schools (name,general_information,type,main_language,fees,address)
values('El-Nokrashy','Very Old and Big School','National','Arabic',500,'Hadayk El-Kobba')                                          --school_number= 1

INSERT INTO Schools (name,mission,type,main_language,fees,address)
values('Ebn-Khaldon','Work on increasing cognitive skills of the students','National','Arabic',600,'El Zayton')                    --school_number= 2

INSERT INTO Schools (name,type,main_language,fees,address)
values('El-Masrya','International','English',6500,'Fifth Settlement')                                                              --school_number= 3

INSERT INTO Schools (name,mission,type,main_language,fees,address)
values('El-Shwefat','Work on increasing communication skills of the students','International','English',2600,'Fifth Settlement')   --school_number= 4
INSERT INTO Schools (name,vision,type,main_language,fees,address)
values('Modern School','Preparing hard worker students','National','Arabic',2600,'Helmeyt el Zayton')                              --school_number= 5 

--2
insert into School_Emails (school_number,email)
values(1,'nokrashy@org.edu')
insert into School_Emails (school_number,email)
values(2,'ebn_khaldon@org.edu')
insert into School_Emails (school_number,email)
values(3,'el_masrya@org.edu')
insert into School_Emails (school_number,email)
values(3,'el_masrya2@org.edu')
insert into School_Emails (school_number,email)
values(4,'el_shwefat@org.edu')
insert into School_Emails (school_number,email)
values(5,'modern_school@org.edu')

--3
insert into School_Phone_Numbers(school_number,phone_number)
values(1,'0224536987')
insert into School_Phone_Numbers(school_number,phone_number)
values(1,'0224536988')
insert into School_Phone_Numbers(school_number,phone_number)
values(2,'0224836987')
insert into School_Phone_Numbers(school_number,phone_number)
values(3,'0224936987')
insert into School_Phone_Numbers(school_number,phone_number)
values(4,'0224916987')
insert into School_Phone_Numbers(school_number,phone_number)
values(5,'0224536387')

--4
insert into Elementary_Schools (school_number)
values(1)

--5
insert into Elementary_Supplies(school_number,supply)
values(1,'Faber Castle Pencils')
insert into Elementary_Supplies(school_number,supply)
values(1,'Faber Castle Eraser')
insert into Elementary_Supplies(school_number,supply)
values(1,'Two note books for each subject')

--6
insert into Middle_Schools (school_number)
values(2)
insert into Middle_Schools (school_number)
values(5)

--7
insert into High_Schools (school_number)
values(3)
insert into High_Schools (school_number)
values(4)

--8
insert into Clubs (school_number,name,purpose)
values(3,'Nawwar','Make Science more fun to be easily understood.')
insert into Clubs (school_number,name,purpose)
values(3,'TIQ','Improve the debate skills for students.')
insert into Clubs (school_number,name,purpose)
values(4,'Nebny','Help Poor People.')
insert into Clubs (school_number,name,purpose)
values(4,'Bedaya','Giving other students extra scientific sessions in order to make a huge progress in the educational life.')

--9
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number) 
values('Omar','Ghareeb','Mobarak','1980-11-13','ghorba@modern.com','Ghorba','532824','Hadayk El-Kobba','Male',1)             --employee_number=1
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Mohamed','Aly','El-gammal','1980-6-29','Lol@modern.com','Lol','532324','Hadayk El-Kobba','Male',2)                   --employee_number=2
insert into Employees (first_name,middle_Name,last_name,birthdate,email,address,username,password,gender,school_number)
values('Mustapha','Khaled','Hamdoun','1980-11-19','kando@modern.com','Kandoz','862147','Hadayk El-Kobba','Male',3)           --employee_number=3
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Shahenda','Kamal','Lotfy','1988-12-19','Shahenda@modern.com','Shahenda','444444','Maadi','Female',4)                 --employee_number=4
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Jana','Aly','Soliman','1992-1-19','Jana@modern.com','Maadi','Jana','777777','Female',5)                              --employee_number=5

insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Ebraheem','Mohamed','Aly','1980-7-7','ebra@shwefat.com','Ebra','532lka','Hadayk El-Kobba','Male',1)                  --employee_number=6
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Sayed','Mohamed','Ashraf','1980-7-6','Sayed@shwefat.com','Sayed','85556633','Hadayk El-Kobba','Male',2)              --employee_number=7
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Omar','Hossam','Ahmed','1980-2-1','Omar@shwefat.com','Moar','85553','Fifth Settlement','Male',3)                     --employee_number=8
insert into Employees (first_name,middle_Name,last_name,birthdate,email,address,username,password,gender,school_number)
values('Layla','Khaled','Ahmed','1980-3-2','Layla@shwefat.com','Layla','888888','Maady','Female',4)                          --employee_number=9
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Natasha','Komarova','Peter','1980-6-9','Natasha@shwefat.com','Natasha_Koma','259638p','EL-Rehab','Female',5)         --employee_number=10

insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Ahmed','Hamdi','Ebeid','1980-7-8','Sayed@masrya.com','Hamdi','Sayed55','Makram Ebeid','Male',1)                      --employee_number=11
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Yousef','Mahmoud','Abdel Maksoud','1990-7-8','Yousef@masrya.com','Jo','774411','Nasr City','Male',2)                 --employee_number=12
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Abdel rahman','Mostafa','Sayed','1989-6-8','Body@masrya.com','Abdo','556663','Nasr City','Male',3)                   --employee_number=13
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Lilly','Wagdy','Hesham','1980-7-8','Lilly@masrya.com','Lilly','963587','Makram Ebeid','Female',4)                    --employee_number=14
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Mariam','Atef','Ramzy','1988-2-8','Mariam@masrya.com','Mariam','blabizo','Maady','Female',5)                         --employee_number=15

insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Ahmed','Ashraf','El-Kutb','1980-6-9','ashraf@khaldon.com','Ashaf','23131','Maady','Male',1)                          --employee_number=16
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Abdelrahman','Hossam','Abdelrahman','1988-9-9','Abdo@khaldon.com','Obad','2231','Fifth Settlement','Male',2)         --employee_number=17
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Hazem','Nabil','Shabrawy','1988-10-9','Zoma@khaldon.com','ZOMA','zoma2016','El-Rehab','Male',3)                      --employee_number=18
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Mahmoud','Mekawy','Dagher','1988-9-9','meko@khaldon.com','MEKO','meko2016','El-Rehab','Male',4)                      --employee_number=19
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)        
values('Mohamed','Adel','Aly','1988-2-1','Dola@khaldon.com','Dola','55533222','Fifth Settlement','Male',5)                   --employee_number=20

insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Marwan','Adel','Fates','1980-10-26','maro@nokrashy.com','Maro','5555563222','Maady','Male',1)                        --employee_number=21
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Lina','Ashraf','Fahmy','1980-6-29','Lina@nokrashy.com','Lina','23231','Nasr City','Female',2)                        --employee_number=22
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Amr','Mamdouh','Rizk','1975-6-29','Amr@nokrashy.com','Amor','aa12121','Nasr City','Male',3)                          --employee_number=23
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Samar','Sharaf','Karam','1985-6-29','Samar@nokrashy.com','Samar','23111','Nasr City','Female',4)                     --employee_number=24
insert into Employees (first_name,middle_Name,last_name,birthdate,email,username,password,address,gender,school_number)
values('Kareem','Magdy','Slim','1989-9-29','Kareem@nokrashy.com','Kemo','555555521','Ain Shams','Male',5)                    --employee_number=25


--10
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (1, '1996-02-05')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (2, '1997-03-06')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (3, '1998-04-07')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (4, '1999-05-08')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (5, '2000-06-09')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (6, '2001-07-10')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (7, '2001-08-11')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (8, '2002-09-12')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (9, '2003-10-13')
INSERT INTO Teachers(employee_number,hire_date) 
VALUES (10, '2003-11-14')

--11
INSERT INTO Administrators(employee_number) 
VALUES (11)
INSERT INTO Administrators(employee_number) 
VALUES (12)
INSERT INTO Administrators(employee_number)
VALUES (13)
INSERT INTO Administrators(employee_number) 
VALUES (14)
INSERT INTO Administrators(employee_number) 
VALUES (15)
INSERT INTO Administrators(employee_number) 
VALUES (16)
INSERT INTO Administrators(employee_number) 
VALUES (17)
INSERT INTO Administrators(employee_number) 
VALUES (18)
INSERT INTO Administrators(employee_number) 
VALUES (19)
INSERT INTO Administrators(employee_number) 
VALUES (20)
INSERT INTO Administrators(employee_number) 
VALUES (21)
INSERT INTO Administrators(employee_number) 
VALUES (22)
INSERT INTO Administrators(employee_number) 
VALUES (23)
INSERT INTO Administrators(employee_number) 
VALUES (24)
INSERT INTO Administrators(employee_number) 
VALUES (25)

--12
INSERT INTO Supervisors(employee_number) 
VALUES (1)
INSERT INTO Supervisors(employee_number) 
VALUES (2)
INSERT INTO Supervisors(employee_number) 
VALUES (3)
INSERT INTO Supervisors(employee_number) 
VALUES (4)
INSERT INTO Supervisors(employee_number) 
VALUES (5)

--13
INSERT INTO Nonsupervisors(employee_number, supervisor_employee_number) 
VALUES (6, 1)
INSERT INTO Nonsupervisors(employee_number, supervisor_employee_number) 
VALUES (7, 2)
INSERT INTO Nonsupervisors(employee_number, supervisor_employee_number) 
VALUES (8, 3)
INSERT INTO Nonsupervisors(employee_number, supervisor_employee_number) 
VALUES (9, 4)
INSERT INTO Nonsupervisors(employee_number, supervisor_employee_number) 
VALUES (10, 5)

--14
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('lanaDelRey', 'BornToDie', 'Lana', 'Del Rey', '555444333', '28-Moaz El Dawla-Makram Ebied', 'lanadelrey@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('edSheeran', 'One', 'Ed', 'Sheeran', '552244333', '29-Moaz El Dawla-Makram Ebied', 'edsheeran@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('fathymohamed', 'fathya', 'Fathy', 'Mohamed', '22334455', '32-Maadi Street-Maddi', 'fathymohamed@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('ahmedHamdi', '<3lanadelrey<3', 'Ahmed', 'Hamdi', '22748922', '33-Abbas-Nasr City', 'ahmedhamdi@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('ahmedAshraf', 'coolfash5', 'Ahmed', 'Ashraf', '939339333', '23-Abo Dawood-Makram Ebied', 'ahmedashraf@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('ibrahimMohamed', 'elkbeer', 'Ibrahim', 'Mohamed', '332444333', '26-Maadi Roundabout-Maadi', 'ibrahimmohamed@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('marwanAmr', 'gamedtenen', 'Marwan', 'Amr', '555444333', '22-Tayran-Nasr City', 'marwanamr@live.com')
INSERT INTO Parents(username, password, first_name, last_name, home_number, address, email)
VALUES('sayedHamdi', 'sayedReda', 'Sayed', 'Hamdi', '225444333', '40-Mosata El Nahas- Nasr City', 'sayedhamdi@live.com')

--15
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('lanaDelRey', '0552553271')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('lanaDelRey', '0552553272')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('edSheeran', '0552553273')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('edSheeran', '0552553274')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('fathymohamed', '0552553276')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('ahmedHamdi', '0552553278')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('ahmedAshraf', '0552553279')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('ibrahimMohamed', '0552663374')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('marwanAmr', '0772553244')
INSERT INTO Parent_Cell_Numbers(username, mobile_number)
VALUES('sayedHamdi', '0252553274')

--16
INSERT INTO Children(ssn, name, birth_date, gender)
VALUES(1, 'Mohamed Ahmed', '1996-10-10', 'male')
INSERT INTO Children(ssn, name, birth_date, gender)
VALUES(2, 'Ahmed Mohamed', '1997-10-10', 'male')
INSERT INTO Children(ssn, name, birth_date, gender)
VALUES(3, 'Sara Ahmed', '1998-10-10', 'female')
INSERT INTO Children(ssn, name, birth_date, gender)
VALUES(4, 'Lana Ahmed', '1999-10-10', 'female')
INSERT INTO Children(ssn, name, birth_date, gender)
VALUES(5, 'Nora Ahmed', '2000-10-10', 'female')


--17
INSERT INTO Enrolled(ssn, username, school_number, grade)
VALUES (1,'ahmedHamdi', 1, 1)
INSERT INTO Enrolled(ssn, username, school_number, grade)
VALUES (2,'ahmedAshraf', 2, 7)
INSERT INTO Enrolled(ssn, username, school_number, grade)
VALUES (3,'ibrahimMohamed', 3, 12)
INSERT INTO Enrolled(ssn, username, school_number, grade)
VALUES (4,'marwanAmr', 4, 10)
INSERT INTO Enrolled(ssn, username, school_number, grade)
VALUES (5,'sayedHamdi', 5, 8)



--18
INSERT INTO Courses(code, name, description)
VALUES('MTH1', 'Math 1','This is an introductory math course that goes through math basics.')
INSERT INTO Courses(code, name, description)
VALUES('MTH20', 'Math 20','This is an advanced math course that goes through math knowledge.')
INSERT INTO Courses(code, name, description)
VALUES('MTH2', 'Math 2','This is a level 2 math course that develops math skills.')
INSERT INTO Courses(code, name, description)
VALUES('MTH3', 'Math 3','This is a level 3 math course that develops math skills further.')
INSERT INTO Courses(code, name, description)
VALUES('SCI1', 'Science 1','This is an introductory science course that goes through science basics.')
INSERT INTO Courses(code, name, description)
VALUES('SCI2', 'Science 2','This is a level 2 science course that develops math skills.')
INSERT INTO Courses(code, name, description)
VALUES('SCI3', 'Science 3','This is a level 3 science course that develops math skills further.')
INSERT INTO Courses(code, name, description)
VALUES('ENG1', 'English 1','This is an introductory english course that goes through english basics.')
INSERT INTO Courses(code, name, description)
VALUES('ENG2', 'English 2','This is a level 2 english course that develops math skills.')
INSERT INTO Courses(code, name, description)
VALUES('ENG3', 'English 3','This is a level 3 english course that develops math skills further.')


--19
insert into Courses_taught_by_Teachers (cid,teacher_number)
 values ( 'MTH1'  ,1)
insert into Courses_taught_by_Teachers (cid,teacher_number)
 values ( 'MTH2' ,2)
insert into Courses_taught_by_Teachers (cid,teacher_number)
 values ( 'MTH3' ,3)
insert into Courses_taught_by_Teachers (cid,teacher_number)
 values ( 'SCI1' ,4)
insert into Courses_taught_by_Teachers (cid,teacher_number)
 values ( 'SCI2',5)

 insert into Courses_taught_by_Teachers (cid,teacher_number)
 values ( 'MTH20',2)
 --20
insert into Students_taught_by_Teachers (ssn , cid , teacher_number)
 values (1,'MTH1',1)
insert into Students_taught_by_Teachers (ssn , cid , teacher_number)
 values (2,'MTH2',2)
insert into Students_taught_by_Teachers (ssn , cid , teacher_number)
 values (3,'MTH3',3)
insert into Students_taught_by_Teachers (ssn , cid , teacher_number)
 values (4,'SCI1',4)
insert into Students_taught_by_Teachers (ssn , cid , teacher_number)
 values (5,'SCI2',5)

 --21
insert into Announcements (date , title , type , employee_number , description)
 values ('2015-02-11' , 'Sharm El Sheikh' , 'Trip' , 11 , ' trip to sharm el sheikh , fees = 300 ')
insert into Announcements (date , title , type , employee_number , description)
 values ('2015-04-19' , 'Amr Diab' , 'Concert' , 12 , 'concert of Amr Diab')
insert into Announcements (date , title , type , employee_number , description)
 values ('2016-04-22' , 'History of Computer' , 'Event' , 11 , 'lecture about history of computer given by prof. Slim')
insert into Announcements (date , title , type , employee_number , description)
 values ('2016-05-02' , 'Aswan' , 'Trip' , 15 , ' trip to Aswan , fees = 400 ')
insert into Announcements (date , title , type , employee_number , description)
 values ('2015-05-20' , 'Fashion' , 'Event' , 18 , 'event about fashion')

 --22
insert into Extra_Curricular_Activities (school_number , date , type , description , location , teacher_number , admin_number
,equipment) 
 values (1,'2015-09-21','sport','football league between school teams','Ground',6,11,'sprots clothes')
insert into Extra_Curricular_Activities (school_number , date , type , description , location , teacher_number , admin_number
,equipment) 
 values (2,'2015-10-23','sport','basketball league between school teams','Ground',2,22,'sprots clothes')
 insert into Extra_Curricular_Activities (school_number , date , type , description , location , teacher_number , admin_number
,equipment) 
 values (3,'2015-10-26','Art','sketch','theatre',8,13,'decore and lighting system')
 insert into Extra_Curricular_Activities (school_number , date , type , description , location , teacher_number , admin_number
,equipment) 
 values (4,'2015-09-22','Art','audition for choosing singers','C1',4,19,'None')
 insert into Extra_Curricular_Activities (school_number , date , type , description , location , teacher_number , admin_number
,equipment) 
 values (5,'2015-11-21','Art','Act clash','theatre',5,15,'lighting system')
 
 --23
insert into Questions (ssn , course_code , teacher_number , content , answer)
 values (1,'MTH1' ,1,'5+4' , '9') 
insert into Questions (ssn , course_code , teacher_number , content , answer)
 values (2,'MTH2' ,2,'5*4' , '20') 
insert into Questions (ssn , course_code , teacher_number , content , answer)
 values (3,'MTH3' ,3,'5%2' , '1') 
insert into Questions (ssn , course_code , teacher_number , content , answer)
 values (4,'SCI1' ,4,'Na ?' , 'Sodium') 
insert into Questions (ssn , course_code , teacher_number , content , answer)
 values (5,'SCI2' ,5,'Ca ?' , 'Calcium') 

 --24
insert into Reviews (username , content , school_number)
 values ('ahmedHamdi' , 'Good school' , 1)
insert into Reviews (username , content , school_number)
 values ('ahmedAshraf' , 'excellent school' , 2)
 insert into Reviews (username , content , school_number)
 values ('ibrahimMohamed' , 'bad school' , 3)
 insert into Reviews (username , content , school_number)
 values ('marwanAmr' , 'very Good school' , 4)
 insert into Reviews (username , content , school_number)
 values ('sayedHamdi' , 'not so Good school' , 5)


 --25
insert into Assignments (employee_number , code , number , posting_date , content , due_date)
 values (1,'MTH1',1,'2015-09-22','solve it','2015-10-01')
insert into Assignments (employee_number , code , number , posting_date , content , due_date)
 values (2,'MTH2',1,'2015-09-24','solve it','2015-10-08')
insert into Assignments (employee_number , code , number , posting_date , content , due_date)
 values (3,'MTH3',1,'2015-09-24','solve it','2015-10-05')
insert into Assignments (employee_number , code , number , posting_date , content , due_date)
 values (4,'SCI1',1,'2015-09-28','solve it','2015-10-02')
insert into Assignments (employee_number , code , number , posting_date , content , due_date)
 values (5,'SCI2',1,'2015-09-22','solve it','2015-09-30')
 
 
 --26
insert into Assign_Sol (employee_number , code , number ,solution , ssn )
 values (1,'MTH1',1,'my solution',1)
insert into Assign_Sol (employee_number , code , number ,solution , ssn )
 values (2,'MTH2',1,'my solution',2)
insert into Assign_Sol (employee_number , code , number ,solution , ssn )
 values (3,'MTH3',1,'my solution',3)
insert into Assign_Sol (employee_number , code , number ,solution , ssn )
 values (4,'SCI1',1,'my solution',4)
insert into Assign_Sol (employee_number , code , number ,solution , ssn )
 values (5,'SCI2',1,'my solution',5)
 
 --27
insert into Reports (ssn , employee_number , date , comment , reply , username )
 values (1,1,'2015-10-10','has to study','i will manage' ,  'ahmedHamdi' )
insert into Reports (ssn , employee_number , date , comment , reply , username )
 values (2,2,'2015-10-22','doing well','thanks to you' ,  'ahmedAshraf' )
insert into Reports (ssn , employee_number , date , comment , reply , username )
 values (3,3,'2015-11-18','has to study','i will manage' ,  'ibrahimMohamed' )
insert into Reports (ssn , employee_number , date , comment , reply , username )
 values (4,4,'2015-12-12','need a rest','i will manage' ,  'marwanAmr' )
insert into Reports (ssn , employee_number , date , comment , reply , username )
 values (5,5,'2015-09-23','has to go out','i will manage' ,  'sayedHamdi' ) 

 --28
insert into Activity_appliedForBy_Enrolled(ssn, school_number, date, type, location)
values(1, 1, '2015-09-21', 'sport', 'Ground')
insert into Activity_appliedForBy_Enrolled(ssn, school_number, date, type, location)
values(2, 2,'2015-10-23', 'sport', 'Ground')
insert into Activity_appliedForBy_Enrolled(ssn, school_number, date, type, location)
values(3, 3, '2015-10-26', 'Art', 'theatre')
insert into Activity_appliedForBy_Enrolled(ssn, school_number, date, type, location)
values(4, 4, '2015-09-22', 'Art', 'C1')
insert into Activity_appliedForBy_Enrolled(ssn, school_number, date, type, location)
values(5, 5, '2015-11-21', 'Art', 'theatre')

--Ratings records
insert into Ratings
values('lanaDelRey', 1, 1, 1);
insert into Ratings
values('lanaDelRey', 2, 2, 2);
insert into Ratings
values ('edSheeran', 3, 3, 2);
insert into Ratings
values('fathymohamed', 4, 4, 8);
insert into Ratings
values('ahmedhamdi', 5, 5, 9);


--Parent applies for child records
insert into School_Applications
values('lanaDelRey', 1, 1, 1);
insert into School_Applications
values('edSheeran', 2, 2, 0);
insert into School_Applications
values('fathymohamed', 3, 3, 1);
insert into School_Applications
values('ahmedhamdi', 4, 4, 0);
insert into School_Applications
values('fathymohamed', 4, 5, 1);
insert into School_Applications
values('lanaDelRey', 1, 4, 1);
insert into School_Applications
values('fathymohamed', 4, 1, 0);

--Courses Taught in Grades records
insert into Courses_Taught_in_Schools
values(1, 'MTH1', 1, 'Elementary');
insert into Courses_Taught_in_Schools
values(1, 'SCI1', 1, 'Elementary');
insert into Courses_Taught_in_Schools
values(1, 'MTH2', 8, 'Middle');
insert into Courses_Taught_in_Schools
values(2, 'MTH1', 1, 'Elementary');
insert into Courses_Taught_in_Schools
values(2, 'MTH2', 8, 'Middle');
insert into Courses_Taught_in_Schools
values(2, 'SCI2', 9, 'Middle');
insert into Courses_Taught_in_Schools
values(2, 'MTH3', 10, 'High');
insert into Courses_Taught_in_Schools
values(2, 'SCI3', 11, 'High');
insert into Courses_Taught_in_Schools
values(2, 'ENG1', 1, 'Elementary');
insert into Courses_Taught_in_Schools
values(3, 'ENG1', 2, 'Elementary');
insert into Courses_Taught_in_Schools
values(3, 'ENG2', 9, 'Middle');
insert into Courses_Taught_in_Schools
values(4, 'MTH1', 1, 'Elementary');
insert into Courses_Taught_in_Schools
values(4, 'MTH2', 8, 'Middle');
insert into Courses_Taught_in_Schools
values(2, 'MTH20', 7, 'Middle');
insert into Courses_Taught_in_Schools
values(4, 'MTH3', 11, 'High');
insert into Courses_Taught_in_Schools
values(5, 'MTH1', 1, 'Elementary');
insert into Courses_Taught_in_Schools
values(5, 'ENG3', 11, 'High');

 --employee int, employee_number int, code varchar(10), number int, ssn int, mark real,
--Assignments Graded by Teachers records
insert into Assignment_Sol_graded_by_Teachers
values(1, 'MTH1', 1, 1, 0);
insert into Assignment_Sol_graded_by_Teachers
values(2, 'MTH2', 1, 2, 0);
insert into Assignment_Sol_graded_by_Teachers
values(3, 'MTH3', 1, 3, 2);
insert into Assignment_Sol_graded_by_Teachers
values(4, 'SCI1', 1, 4, 5);
insert into Assignment_Sol_graded_by_Teachers
values(5, 'SCI2', 1, 5, 4);

--Enrolled Members of Club
insert into Clubs_joins_Enrolled
values(3, 'nawwar', 3);
insert into Clubs_joins_Enrolled
values(3, 'TIQ', 4);
insert into Clubs_joins_Enrolled
values(4, 'Nebny', 2);
insert into Clubs_joins_Enrolled
values(4, 'Nebny', 1);

--problem in table data
--Teacher Teaches Course to Enrolled records
insert into Courses_taught_by_Teachers
values('MTH1', 2);
insert into Courses_taught_by_Teachers
values('MTH2', 3);
insert into Courses_taught_by_Teachers
values('ENG3', 5);


--Course Prerequisite Course records
insert into Courses_Prerequisite_Courses
values('MTH2', 'MTH1');
insert into Courses_Prerequisite_Courses
values('MTH3', 'MTH1');
insert into Courses_Prerequisite_Courses
values('MTH3', 'MTH2');
insert into Courses_Prerequisite_Courses
values('SCI2', 'SCI1');
insert into Courses_Prerequisite_Courses
values('SCI3', 'SCI2');
insert into Courses_Prerequisite_Courses
values('SCI3', 'SCI1');
insert into Courses_Prerequisite_Courses
values('ENG2', 'ENG1');
insert into Courses_Prerequisite_Courses
values('ENG3', 'ENG2');

--Students_taught_by_Teacher
insert into Students_taught_by_Teachers (ssn,cid,teacher_number)
values(2,'MTH20',2)