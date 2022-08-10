CREATE DATABASE HW4Q2;
USE HW4Q2;

CREATE TABLE school(
	schoolId INT PRIMARY KEY,
    school_name VARCHAR(64) NOT NULL,
    town VARCHAR(64) NOT NULL ,
	street VARCHAR(64) NOT NULL,
	zipcode char(5) NOT NULL,
    phone CHAR(11) DEFAULT 'NOAVAILABLE'
);
    
CREATE TABLE teacher(
	NIN INT PRIMARY KEY,
	firstName VARCHAR(64) NOT NULL,
    lastName VARCHAR(64) NOT NULL,
    sex VARCHAR(8) NOT NULL,
    qulification VARCHAR(128) NOT NULL,
    workplace INT,
    FOREIGN KEY (workplace) REFERENCES school(schoolId)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE subject_ (
	subjectNo INT PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    subject_type VARCHAR(128) NOT NULL
);

CREATE TABLE pupil(
	pupilId INT PRIMARY KEY,
	firstName VARCHAR(64) NOT NULL,
    lastName VARCHAR(64) NOT NULL,
    sex VARCHAR(8) NOT NULL,
    dateofbirth DATE NOT NULL,
    studyplace INT NOT NULL,
	FOREIGN KEY (studyplace) REFERENCES school(schoolId)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE teachertosubject (
	subjectNo INT,
    NIN INT,
    hours INT NOT NULL,
    PRIMARY KEY(subjectNo,NIN),
    FOREIGN KEY (subjectNo) REFERENCES subject_ (subjectNo)
          ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (NIN) REFERENCES teacher(NIN) 
          ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE manager(
	schoolId INT,
	NIN INT,
    startDate DATE,
    PRIMARY KEY(schoolId,NIN),
    FOREIGN KEY (schoolId) REFERENCES school(schoolId)
          ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (NIN) REFERENCES teacher(NIN) 
          ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE pupiltosubject(
	pupilId INT,
    subjectNo INT,
    FOREIGN KEY (pupilId) REFERENCES pupil(pupilId)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (subjectNo) REFERENCES subject_(subjectNo)
    ON UPDATE CASCADE ON DELETE CASCADE
);
    