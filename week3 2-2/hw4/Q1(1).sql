CREATE DATABASE IF NOT EXISTS HW4Q1;
USE HW4Q1;

CREATE TABLE clinic(
	clinicNo INT PRIMARY KEY
);

CREATE TABLE staff(
	staffNo INT PRIMARY KEY,
    company INT NOT NULL,
    FOREIGN KEY(company) REFERENCES clinic(clinicNo)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE staff_to_clinic(
	clinicNo INT,
	staffNo INT,
    PRIMARY KEY(clinicNo,staffNo),
    FOREIGN KEY (clinicNo) REFERENCES clinic(clinicNo)
          ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (staffNo) REFERENCES staff(staffNo) 
          ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE petowner(
	ownerNo INT PRIMARY KEY,
    contacted_clinic INT NOT NULL,
    FOREIGN KEY (contacted_clinic) REFERENCES clinic(clinicNo)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE pet(
	petNo INT PRIMARY KEY,
    ownerNo INT NOT NULL,
    register_clinic INT NOT NULL,
    FOREIGN KEY (ownerNo) REFERENCES petowner(ownerNo)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (register_clinic) REFERENCES clinic(clinicNo)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE examination(
	examNo INT PRIMARY KEY,
    exam_object INT NOT NULL,
    perform_staff INT NOT NULL,
    FOREIGN KEY (exam_object) REFERENCES pet(petNo)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (perform_staff) REFERENCES staff(staffNo)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE treatement(
	treatNo INT PRIMARY KEY
);

CREATE TABLE exam_to_treat(
	examNo INT,
	treatNo INT,
    PRIMARY KEY(examNo,treatNo),
    FOREIGN KEY (examNo) REFERENCES examination(examNo)
          ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (treatNo) REFERENCES treatement(treatNo) 
          ON UPDATE CASCADE ON DELETE CASCADE
);
  