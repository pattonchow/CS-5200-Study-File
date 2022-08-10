DROP DATABASE IF EXISTS HW4Q3;
CREATE DATABASE HW4Q3;
USE HW4Q3;

CREATE TABLE Group_(
	groupNo INT PRIMARY KEY
);

CREATE TABLE cleaning_staff(
	staffNo INT PRIMARY KEY,
    belong_group INT NOT NULL,
    FOREIGN KEY (belong_group) REFERENCES Group_(groupNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE admin_staff(
	staffNo INT PRIMARY KEY
);

CREATE TABLE client_(
	clientNo INT PRIMARY KEY
);

CREATE TABLE requirement(
	reqNo INT PRIMARY KEY,
    description_ VARCHAR(128) NOT NULL,
    clientNo INT NOT NULL,
    FOREIGN KEY (reqNo) REFERENCES client_(clientNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE job(
	jobNo INT PRIMARY KEY,
    limited_time VARCHAR(64) NOT NULL,
    adm INT NOT NULL,
    related_req INT NOT NULL,
    FOREIGN KEY (related_req) REFERENCES requirement(reqNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (adm) REFERENCES admin_staff(staffNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE grouptojob(
	group_no INT,
    job_no INT,
    FOREIGN KEY (group_no) REFERENCES Group_(groupNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (job_no) REFERENCES job(jobNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE equipment(
	equipmentNo INT PRIMARY KEY
);

CREATE TABLE job_need_equipment(
	job_No INT NOT NULL,
    equipment_No INT NOT NULL,
    PRIMARY KEY(job_No,equipment_No),
    FOREIGN KEY (job_No) REFERENCES job(jobNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (equipment_No) REFERENCES equipment(equipmentNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE cleaning_supervisor(
	cleaningstaff INT,
    groupNo INT,
    PRIMARY KEY(cleaningstaff,groupNo),
    FOREIGN KEY (cleaningstaff) REFERENCES cleaning_staff(staffNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (groupNo) REFERENCES Group_(groupNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);
 
 CREATE TABLE office_work(
	workId INT PRIMARY KEY,
	simple_office_work bool,
	answering_phones bool,
    maintaining_cleaning_schedule bool,
    ensuring_equipment bool
);

CREATE TABLE administrative_staff_manage(
	staffNo INT,
    workId INT,
    PRIMARY KEY(staffNo,workId),
    FOREIGN KEY (staffNo) REFERENCES admin_staff(staffNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (workId) REFERENCES office_work(workId)
		ON UPDATE CASCADE ON DELETE CASCADE
);


