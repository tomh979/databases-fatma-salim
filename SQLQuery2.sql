Create database CompanyBD;
Go
Use CompanyBD;


create table DEPT (
DNUM INT PRIMARY KEY , 
DNAME VARCHAR (100) NOT NULL ,
MGR_SSN INT,
MGR_START_DATE DATE );


CREATE TABLE LOC (
    LOC_ID INT PRIMARY KEY,
    LOCATION_NAME VARCHAR(100) NOT NULL);


CREATE TABLE EMP (
    SSN INT PRIMARY KEY,
    FNAME VARCHAR(50),
    LNAME VARCHAR(50),
    DOB DATE,
    ADDRESS VARCHAR(255),
    SALARY DECIMAL(10, 2),
    DNUM INT,
    SUPER_ID INT,
    FOREIGN KEY (DNUM) REFERENCES DEPT(DNUM),
    FOREIGN KEY (SUPER_ID) REFERENCES EMP(SSN)
	);


CREATE TABLE PROJECT (
    PNUM INT PRIMARY KEY,
    PNAME VARCHAR(100),
    BUDGET DECIMAL(12, 2),
    LOC_ID INT,
    FOREIGN KEY (LOC_ID) REFERENCES LOC(LOC_ID)
	);


CREATE TABLE WORK (
    SSN INT,
    PNUM INT,
    HOURS_WORKED DECIMAL(5,2),
    PRIMARY KEY (SSN, PNUM),
    FOREIGN KEY (SSN) REFERENCES EMP(SSN),
    FOREIGN KEY (PNUM) REFERENCES PROJECT(PNUM)
	);


CREATE TABLE DEPENDENT (
    DEP_ID INT PRIMARY KEY,
    SSN INT,
    DEP_NAME VARCHAR(50),
    RELATIONSHIP VARCHAR(50),
    DOB DATE,
    FOREIGN KEY (SSN) REFERENCES EMP(SSN)
);

select * from DEPT

INSERT INTO DEPT (DNUM, DNAME , MGR_SSN ,MGR_START_DATE) VALUES
(2, 'HR', NULL, '2019-02-01'),
(3, 'IT', NULL, '2020-03-01'),
(4, 'Marketing', NULL, '2021-04-01'),
(5, 'Finance', NULL, '2022-05-01');

select * from LOC 

INSERT INTO LOC ( LOC_ID, LOCATION_NAME ) VALUES 
(2, 'Salalah'),
(3, 'Nizwa'),
(4, 'Sohar'),
(5, 'Sur');

select * from EMP 

INSERT INTO EMP ( SSN ,FNAME , LNAME, DOB , ADDRESS , SALARY, DNUM , SUPER_ID ) VALUES 
(1002, 'Ahmed', 'Nasser', '1985-03-22', 'Salalah', 5200.00, 2, 1001),
(1003, 'Layla', 'Said', '1992-12-11', 'Nizwa', 4800.00, 3, 1001),
(1004, 'Hassan', 'Ali', '1990-09-18', 'Sohar', 5000.00, 4, 1001),
(1005, 'Noor', 'Zahra', '1997-07-07', 'Sur', 4700.00, 5, 1001);

Select * from PROJECT

INSERT INTO PROJECT (PNUM, PNAME, BUDGET, LOC_ID )VALUES 
(201, 'ERP System', 250000.00, 1),
(202, 'Recruitment Drive', 60000.00, 2),
(203, 'Network Upgrade', 120000.00, 3),
(204, 'Marketing Campaign', 50000.00, 4),
(205, 'Audit Prep', 30000.00, 5);

select * from WORK

INSERT INTO WORK (SSN,PNUM, HOURS_WORKED) VALUES 
(1001, 201, 35.5),
(1002, 202, 20.0),
(1003, 203, 25.0),
(1004, 204, 30.0),
(1005, 205, 18.5);

Select * from DEPENDENT

INSERT INTO DEPENDENT VALUES 
(1, 1001, 'Amna', 'Daughter', '2020-02-14'),
(2, 1002, 'Khalid', 'Son', '2015-05-10'),
(3, 1003, 'Maryam', 'Spouse', '1993-04-12'),
(4, 1004, 'Ali Jr.', 'Son', '2021-09-21'),
(5, 1005, 'Salim', 'Father', '1970-06-06');

DELETE FROM WORK
WHERE SSN = 1005 AND PNUM = 205;



DELETE FROM DEPENDENT
WHERE DEP_NAME = 'Salim' AND SSN = 1005;

UPDATE PROJECT
SET BUDGET = BUDGET + 10000
WHERE PNUM = 201;

select Min(salary) from EMP 

select count(LOC_ID) FROM project 
group by BUDGET 

select max(salary) from EMP 
group by super_id 
having max(salary) > 4000

