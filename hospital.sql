CREATE TABLE Patient(
email varchar(50) PRIMARY KEY,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL,
address varchar(60) NOT NULL,
gender VARCHAR(20) NOT NULL
);

CREATE TABLE MedicalHistory(
id integer PRIMARY KEY,
dateof DATE NOT NULL,
conditions VARCHAR(100) NOT NULL, 
surgeries VARCHAR(100) NOT NULL, 
medication VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor(
email varchar(50) PRIMARY KEY,
gender varchar(20) NOT NULL,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Appointment(
id integer PRIMARY KEY,
dateof DATE NOT NULL,
starttime varchar(50) NOT NULL,
endtime varchar(50) NOT NULL,
status varchar(15) NOT NULL
);

CREATE TABLE PatientsAttendAppointments(
patient varchar(50) NOT NULL,
appt int NOT NULL,
concerns varchar(40) NOT NULL,
symptoms varchar(40) NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
PRIMARY KEY (patient, appt)
);

CREATE TABLE Schedule(
id int NOT NULL,
starttime varchar(50) NOT NULL,
endtime varchar(50) NOT NULL,
breaktime varchar(50) NOT NULL,
day varchar(20) NOT NULL,
PRIMARY KEY (id, starttime, endtime, breaktime, day)
);

CREATE TABLE PatientsFillHistory(
patient varchar(50) NOT NULL,
history integer NOT NULL,
FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history)
);

CREATE TABLE Diagnose(
appt int NOT NULL,
doctor varchar(50) NOT NULL,
diagnosis varchar(40) NOT NULL,
prescription varchar(50) NOT NULL,
FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (appt, doctor)
);

CREATE TABLE DocsHaveSchedules(
sched int NOT NULL,
doctor varchar(50) NOT NULL,
FOREIGN KEY (sched) REFERENCES Schedule (id) ON DELETE CASCADE,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
PRIMARY KEY (sched, doctor)
);

CREATE TABLE DoctorViewsHistory(
history int NOT NULL,
doctor varchar(50) NOT NULL,
FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
PRIMARY KEY (history, doctor)
);
alter table doc_info
drop column dateof;

alter table doc_info
add salary varchar(50);





INSERT INTO Patient(email,password,name,address,gender)
VALUES
('ramesh@gmail.com','hrishikesh13','Ramesh','Tamil Nadu', 'male');
INSERT INTO Patient(email,password,name,address,gender)
VALUES
('suresh@gmail.com','hrishikesh13','Suresh','Karnataka', 'male');
INSERT INTO Patient(email,password,name,address,gender)
VALUES
('rakesh@gmail.com','hrishikesh13','Rakesh','Gujarat', 'male')
;
INSERT INTO Patient(email,password,name,address,gender)
VALUES
('rakeshrahul@gmail.com','hrishikesh16','Rahul','maharashtra', 'male')
;
INSERT INTO Patient(email,password,name,address,gender)
VALUES
('debayan@gmail.com','debayan85','debayan','west-bengal', 'male')
;

INSERT INTO MedicalHistory(id,dateof,conditions,surgeries,medication)
VALUES
(1,'19-01-14','Pain in abdomen','Heart Surgery','Crocin');
INSERT INTO MedicalHistory(id,dateof,conditions,surgeries,medication)
VALUES
(2,'19-01-14','Frequent Indigestion','none','none');
INSERT INTO MedicalHistory(id,dateof,conditions,surgeries,medication)
VALUES
(3,'19-01-14','fever','none','calpol')
;
INSERT INTO MedicalHistory(id,dateof,conditions,surgeries,medication)
VALUES
(4,'19-01-14','Body Pain','none','Iodex')
;
INSERT INTO MedicalHistory(id,dateof,conditions,surgeries,medication)
VALUES
(5,'19-01-14','Body Pain','none','balm')
;

INSERT INTO Doctor(email, gender, password, name)
VALUES
('hathalye7@gmail.com', 'male', 'hrishikesh131', 'Hrishikesh Athalye');
INSERT INTO Doctor(email, gender, password, name)
VALUES
('hathalye8@gmail.com', 'male', 'hrishikesh1348', 'rakesh singh')
;
INSERT INTO Doctor(email, gender, password, name)
VALUES
('hathalye9@gmail.com', 'male', 'hrishikesh1355', 'akshay kumar')
;
INSERT INTO Doctor(email, gender, password, name)
VALUES
('hathalye4@gmail.com', 'male', 'hrishikesh126', 'rahul sharma')
;
INSERT INTO Doctor(email, gender, password, name)
VALUES
('hathalye59@gmail.com', 'male', 'hrishikesh17', 'Hrishi ram')
;


INSERT INTO Appointment(id,dateof,starttime,endtime,status)
VALUES
(1, '19-01-17', '09:00', '10:00', 'Done');
INSERT INTO Appointment(id,dateof,starttime,endtime,status)
VALUES
(2, '19-01-16', '10:00', '11:00', 'Done');
INSERT INTO Appointment(id,dateof,starttime,endtime,status)
VALUES
(3, '19-01-18', '14:00', '15:00', 'Done')
;
INSERT INTO Appointment(id,dateof,starttime,endtime,status)
VALUES
(4, '19-01-18', '14:00', '16:00', 'Done')
;
INSERT INTO Appointment(id,dateof,starttime,endtime,status)
VALUES
(5, '19-01-18', '11:00', '18:00', 'Done')
;

INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('ramesh@gmail.com',1, 'none', 'itchy throat');
INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('suresh@gmail.com',2, 'infection', 'fever');
INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('rakesh@gmail.com',3, 'nausea', 'fever')
;
INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('rakeshrahul@gmail.com',3, 'vomit', 'fever')
;
INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('rakeshramesh@gmail.com',4, 'weakness', 'fever')
;

INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Tuesday');
INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Friday');
INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Saturday');
INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Sunday');
INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(002,'09:00','17:00','12:00','Wednesday');
INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(002,'09:00','17:00','12:00','Friday')
;

INSERT INTO PatientsFillHistory(patient,history)
VALUES
('ramesh@gmail.com', 1),
('suresh@gmail.com', 2),
('rakesh@gmail.com', 3)
;

INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(1,'hathalye7@gmail.com', 'Bloating', 'Ibuprofen as needed');
INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(2,'hathalye8@gmail.com', 'Muscle soreness', 'Stretch morning/night');
INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(3,'hathalye8@gmail.com', 'Vitamin Deficiency', 'Good Diet');
INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(4,'debayansenapati@gmail.com','headache','good sleep');
INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(5,'rahul@gmail.com','heartache','avoid oil');

INSERT INTO DocsHaveSchedules(sched,doctor)
VALUES
(001,'hathalye7@gmail.com'),
(002,'hathalye8@gmail.com')
;

INSERT INTO DoctorViewsHistory(history,doctor)
VALUES
(1,'hathalye7@gmail.com'),
(2,'hathalye8@gmail.com'),
(3,'hathalye8@gmail.com')
;


select * from patient;
select * from medicalhistory;
select * from doctor;
select * from appointment;
select * from PatientsAttendAppointments;
select * from schedule;
select * from diagnose;

SELECT COUNT(*)
FROM doctor;

SELECT t.name AS "Name of the patient",
       p.name AS "Name of the doctor",
       a.day
FROM Schedule t
JOIN appointment a ON a.patient=t.id
JOIN doctor p ON a.doctor=p.id
WHERE day='wednesday';

select s.name
t.starttime as schedule
from doc_info s
join schedule t
on s.name=t.starttime;

ALTER TABLE doc_info
ADD salary integer(20);
UPDATE doc_info SET salary = '145000' where ID=1;
UPDATE doc_info SET salary = '150000' where ID=2;
UPDATE doc_info SET salary = '50000' where ID=3;
UPDATE doc_info SET salary = '750000' where ID=4;
UPDATE doc_info SET salary = '141000' where ID=5;

ALTER TABLE doc_info
ADD salary_after_taxes varchar(20);




select*from doc_info;


DECLARE
  doc_salary doc_info.salary%TYPE;
  doc_salary_taxes number;
BEGIN
  SELECT salary
  INTO  doc_salary
  FROM doc_info
  WHERE ID = 1;
  
  doc_salary_taxes:=(doc_salary)-((18/100)*doc_salary);
  DBMS_OUTPUT.PUT_LINE ('Salary is :'|| doc_salary_taxes);
  UPDATE doc_info SET salary_after_taxes = doc_salary_taxes where ID=1;
END;

DECLARE
  doc_salary doc_info.salary%TYPE;
  doc_salary_taxes number;
BEGIN
  SELECT salary
  INTO  doc_salary
  FROM doc_info
  WHERE ID = 2;
  
  doc_salary_taxes:=(doc_salary)-((18/100)*doc_salary);
  DBMS_OUTPUT.PUT_LINE ('Salary is :'|| doc_salary_taxes);
  UPDATE doc_info SET salary_after_taxes = doc_salary_taxes where ID=2;
END;
DECLARE
  doc_salary doc_info.salary%TYPE;
  doc_salary_taxes number;
BEGIN
  SELECT salary
  INTO  doc_salary
  FROM doc_info
  WHERE ID = 3;
  
  doc_salary_taxes:=(doc_salary)-((18/100)*doc_salary);
  DBMS_OUTPUT.PUT_LINE ('Salary is :'|| doc_salary_taxes);
  UPDATE doc_info SET salary_after_taxes = doc_salary_taxes where ID=3;
END;
DECLARE
  doc_salary doc_info.salary%TYPE;
  doc_salary_taxes number;
BEGIN
  SELECT salary
  INTO  doc_salary
  FROM doc_info
  WHERE ID = 4;
  
  doc_salary_taxes:=(doc_salary)-((18/100)*doc_salary);
  DBMS_OUTPUT.PUT_LINE ('Salary is :'|| doc_salary_taxes);
  UPDATE doc_info SET salary_after_taxes = doc_salary_taxes where ID=4;
END;
DECLARE
  doc_salary doc_info.salary%TYPE;
  doc_salary_taxes number;
BEGIN
  SELECT salary
  INTO  doc_salary
  FROM doc_info
  WHERE ID = 5;
  
  doc_salary_taxes:=(doc_salary)-((18/100)*doc_salary);
  DBMS_OUTPUT.PUT_LINE ('Salary is :'|| doc_salary_taxes);
  UPDATE doc_info SET salary_after_taxes = doc_salary_taxes where ID=5;
END;

select name,salary from doc_info;

select name from doc_info;
select starttime,endtime from schedule;

select s.starttime,s.endtime,s.day
from schedule s
join doc_info c
on s.day=s.starttime and s.endtime=c.name;

select starttime,endtime,day from schedule;

select*from doc_info;
select*from schedule;

UPDATE schedule SET id = 1 where day='Friday';
UPDATE schedule SET ID = 2 where day='saturday';


SELECT 
 *
  FROM schedule
   JOIN doc_info
    USING (id_no);

alter table doc_info
add id_no varchar(50);

UPDATE schedule SET id_no = 1 where day='Friday';
UPDATE schedule SET id_no = 2 where day='Wednesday';
UPDATE schedule SET id_no = 3 where day='Tuesday';
UPDATE schedule SET id_no = 4 where day='Saturday';
UPDATE schedule SET id_no = 5 where day='Sunday';

UPDATE doc_info SET id_no = 1 where id=1;
UPDATE doc_info SET id_no = 5 where id=3;

UPDATE Appointment SET dateof='15-04-19' where id=1;
select*from Appointment;

DECLARE
 doc_salary doc_info.salary%TYPE;
  doc_salary_taxes number;
BEGIN
  SELECT salary
  INTO  doc_salary
  FROM doc_info
  WHERE ID = 1;  
  doc_salary_taxes:=(doc_salary)-((18/100)*doc_salary);
  DBMS_OUTPUT.PUT_LINE ('Salary is :'|| doc_salary_taxes);
  UPDATE doc_info SET salary_after_taxes = doc_salary_taxes where ID=1;
END;
