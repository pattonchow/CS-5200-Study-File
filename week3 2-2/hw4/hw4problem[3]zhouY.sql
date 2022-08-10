DROP DATABASE IF EXISTS cleaning_company;
CREATE DATABASE cleaning_company;
USE cleaning_company;

CREATE TABLE client(
	client_id INT PRIMARY KEY 
);

CREATE TABLE admin_staff(
	staff_id INT PRIMARY KEY,
    is_office_work BOOL,
    is_answer_phone BOOL,
    is_maintain_schedule BOOL,
    is_maintain_equipment BOOL
);

CREATE TABLE clean_group(
	group_id INT PRIMARY KEY
);

CREATE TABLE clean_staff(
	staff_id INT PRIMARY KEY,
    group_id INT,
    FOREIGN KEY (group_id) REFERENCES clean_group(group_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE requirement(
	req_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    req_details VARCHAR(100),
    FOREIGN KEY(client_id) REFERENCES client(client_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE job(
	job_id INT PRIMARY KEY,
    job_hour INT NOT NULL,
    req_id INT NOT NULL,
    admin_staff_id INT NOT NULL,
    clean_group_id INT NOT NULL,
    FOREIGN KEY(req_id) REFERENCES requirement(req_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(admin_staff_id) REFERENCES admin_staff(staff_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(clean_group_id) REFERENCES clean_group(group_id)
		ON UPDATE CASCADE ON DELETE CASCADE
    
);

CREATE TABLE equipment(
	equip_id INT PRIMARY KEY
);

CREATE TABLE job_equipment(
	job_id INT NOT NULL,
    equip_id INT,
    PRIMARY KEY(job_id, equip_id),
    FOREIGN KEY(job_id) REFERENCES job(job_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(equip_id) REFERENCES equipment(equip_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE clean_group_job(
	group_id INT NOT NULL,
    job_id INT NOT NULL,
    equip_id INT,
    PRIMARY KEY(group_id, job_id),
    FOREIGN KEY (group_id) REFERENCES clean_group(group_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(job_id) REFERENCES job(job_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(equip_id) REFERENCES equipment(equip_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE clean_staff_supervisor(
	staff_id INT NOT NULL,
    group_id INT NOT NULL,
    PRIMARY KEY(staff_id, group_id),
	FOREIGN KEY (group_id) REFERENCES clean_group(group_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(staff_id) REFERENCES clean_staff(staff_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);