---------- persons-----------------------
create table persons
(
PersonID int ,
Name nvarchar(100),
DateOfBirth  date,
Gender  nvarchar(1) ,
PhoneNum  nvarchar(20),
Email  nvarchar(100) ,
Address  nvarchar(200) ,
primary key (PersonID)

)
------------------ Doctors---------------------------
create table Doctors
(
DoctorID int ,
Specialzation  nvarchar(100) ,

primary key (DoctorID) ,
Person_ID  INT REFERENCES Persons(PersonID)

)
-or
alter table Doctors 

add FOREIGN KEY (DoctorID) REFERENCES Persons(PersonID)


-

------------ patients--------------------------------------
create table patients
(
PatientID int ,

primary key (patientID) ,
Person_ID  INT REFERENCES Persons(PersonID)

)
---Medical Records------
create table MedicalRecords
(
MedicalRecordID int ,
visitDescription nvarchar(200),
Diagnosis nvarchar(200),
AdditionalNotes nvarchar(200),

primary key (MedicalRecordID)

)
-----
create table Payments
(
PaymentID int ,
PaymentDate date,
PaymentMethod nvarchar(50),
AmountPaid nvarchar(200),
AdditionalNotes nvarchar(200),

primary key (PaymentID)

)
---------Appointments---------------------
create table Appointments
(
AppointmentID int ,
Name nvarchar(100),
AppointmentDateTime  datetime,
AppointmentStatus   tinyint,

primary key (AppointmentID) ,

PatientID  INT REFERENCES Patients(PatientID),
Doctor_ID  INT REFERENCES Doctors(DoctorID),
MedicalRecord_ID  INT REFERENCES MedicalRecords(MedicalRecordID),
Payment_ID  INT REFERENCES Payments(PaymentID) ,

)
-
alter table Appointments
drop column  name 
------Prescription
create table Prescription
(
prescriptiontID int ,
MedicationName nvarchar(100),
Frequency nvarchar(100),
Dosage  nvarchar(100),
SpecialInstructions  nvarchar(100),
startDate  date,
EndDate  date,

primary key (prescriptiontID) ,

MedicalRecord_ID  INT REFERENCES MedicalRecords(MedicalRecordID),
)