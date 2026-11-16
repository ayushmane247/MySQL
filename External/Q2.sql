-- Step 1: Create database
CREATE DATABASE HospitalDB;

-- Step 2: Select database
USE HospitalDB;

-- Step 3: Create Department table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

-- Step 4: Create Patient table
CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(50) NOT NULL,
    Age INT,
    Phone VARCHAR(15)
);

-- Step 5: Create Doctor table
CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Doctor_Name VARCHAR(50) NOT NULL,
    Specialization VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Step 6: Create Appointment table
CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Patient_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);


-- Insert departments
INSERT INTO Department VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B');

-- Insert patients
INSERT INTO Patient VALUES
(101, 'Rahul', 25, '9876543210'),
(102, 'Priya', 30, '9876543211');

-- Insert doctors
INSERT INTO Doctor VALUES
(201, 'Dr. Amit', 'Heart Specialist', 1),
(202, 'Dr. Neha', 'Neurologist', 2);

-- Insert appointments
INSERT INTO Appointment VALUES
(301, '2026-11-15', '10:30:00', 101, 201),
(302, '2026-11-16', '11:00:00', 102, 202);


SELECT * FROM Department;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
