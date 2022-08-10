DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE school(
	school_id INT PRIMARY KEY,
    school_name VARCHAR(45) NOT NULL,
    town VARCHAR(45) NOT NULL,
    street VARCHAR(100) NOT NULL,
    zipcode VARCHAR(5) NOT NULL,
    phone_number INT NOT NULL
);

CREATE TABLE teacher(
	NIN INT PRIMARY KEY,
    f_name VARCHAR(45) NOT NULL,
    l_name VARCHAR(45) NOT NULL,
    qualifications VARCHAR(100) NOT NULL,
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES school(school_id)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE manger_of_teacher(
	start_date DATE NOT NULL,
    school_id INT,
    teacher_id INT,
    FOREIGN KEY(school_id) REFERENCES school(school_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(teacher_id) REFERENCES teacher(NIN)
    ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(school_id, teacher_id)
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
	title VARCHAR(45) NOT NULL,
	subject_type VARCHAR(25) NOT NULL
    
);

CREATE TABLE teacher_teach_subject(
	teacher_id INT NOT NULL,
    subject_id INT,
    teach_subject_hour VARCHAR(45),
    FOREIGN KEY (teacher_id) REFERENCES teacher (NIN)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(teacher_id, subject_id)
);

CREATE TABLE pupil(
	pupil_id INT PRIMARY KEY,
    f_Name VARCHAR(45) NOT NULL,
    l_Name VARCHAR(45) NOT NULL,
    sex VARCHAR(15) NOT NULL,
    date_of_birth DATE NOT NULL,
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES school (school_id) 
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE pupil_study_subject(
	pupil_id INT,
    subject_id INT,
    FOREIGN KEY (pupil_id) REFERENCES pupil(pupil_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (pupil_id, subject_id) 
);