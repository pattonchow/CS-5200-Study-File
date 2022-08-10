use scratch;

 CREATE TABLE branch ( branchNo INT PRIMARY KEY,
  street VARCHAR(64),
  city VARCHAR(64),
  state VARCHAR(64) );

CREATE TABLE staff (
 staffNo INT PRIMARY KEY,
 name varchar(32),
 position varchar(32),
 salary DECIMAL(9,2), 
 is_hourly BOOL,
 hourly_rate DECIMAL(9,2),
 salary_scale INT,
 holidays int,
 is_branch_manager BOOL,
 FOREIGN KEY (branch) REFERENCES branch(branchNo) ON UPDATE CASCADE ON DELETE CASCADE );
 
 CREATE table role_specific (
 staffNo INT PRIMARY KEY,
 is_manager BOOL,
 is_sales BOOL,
 is_secretary BOOL,
 mgrStartDate DATE,
 bonus DECIMAL(9,2), 
 typingSpeed INT, -- words per minute
 carAllownce DECIMAL(9,2),
 salesArea VARCHAR(64),
 FOREIGN KEY (staffNo) REFERENCES staff(staffNo)
  ON UPDATE CASCADE ON DELETE CASCADE );
  
 
  
  