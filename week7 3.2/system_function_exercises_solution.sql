-- function exercises
-- Q1
-- write a query that returns vendor sorted by 
-- vdendor_id alphabetically 

-- Q2 
-- write a select statement to return 3 columns from the invoices table
-- the invoice total
-- ROUND the invoice_total to 1 decimal place
-- round to the nearest whole number (no decimal place)
-- round to nearest whole number using a different function

-- Q3
-- WRITE A QUERY TO RETURN THE FOLLOWING COLUMNS FROM THE VENDORS TABLE
-- VENDOR NAME COL
-- VENDOR NAME COLUMN IN CAPITAL LETTERS
-- VENDOR PHONE NUMBER
-- COLUMN THAT DISPLAYS THE LAST FOUR DIGITS OF THE PHONE NUMBER
-- COLUMN THAT DISPLAY THE PHONE NUMBER WITH PERIODS BETWEEN THE 3 SECTIONS OF THE PHONE NUMBER 

-- Q4
-- RETURN THE CURRENT DATE, CURRENT TIME AND THE CURRENT DATE AND TIME 

-- Q5
-- extract the year, month and day as well as the day of the week from the invoice_date

-- Q6
-- ADD A COLUMN TO q5 that has 2 values "Weekday" or "weekend"  if the day of the week is Saturday or Sunday 
-- the value should be "weekend" or else it is set to "Weekday" -- also add the day of the week as a string
-- Q7
-- return the payment_date from invoices and a column with the value = "No payment" if no payment received
-- or else the column is set to the payment_date

-- Q8 
-- add a rank value  to each row from the invoices table that is determined by the invoice_total 
--

-- PROBLEM 1 
    -- BY INTEGER ORDER
SELECT * 
FROM VENDORS
ORDER BY vendor_id;

-- BY CHARACTER SORTING 
SELECT * 
FROM VENDORS
ORDER BY CAST( vendor_id AS CHAR); 

-- problem 2 
SELECT invoice_total, ROUND(invoice_total, 1) AS one_digit, 
    ROUND(invoice_total, 0) AS zero_digits_round,
    TRUNCATE(invoice_total, 0) AS zero_digits_truncate
FROM invoices;

-- PROBLEM 3 
select vendor_name, vendor_phone FROM vendors;
-- write a query that returns vendor name, 
-- vendor name in all capitals, vendor phone 
-- and the last 4 digits of the phone number
SELECT vendor_name,
    UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    SUBSTRING(vendor_phone, 11) AS last_digits FROM vendors;
-- now create a col to place periods between the portions of the phone sections
-- example(888)555-8725 BECOMES 888.555.8725
-- can extract the pieces since they each section is fixed length
SELECT vendor_name,
    UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    concat( substring(vendor_phone, 2, 3), ".", substring(vendor_phone,7,3), ".",
    SUBSTRING(vendor_phone, 11)),
    substring(vendor_phone, 2, 3) as area_code,
    substring(vendor_phone,7,3) as exchange,
    SUBSTRING(vendor_phone, 11) AS last_digits FROM vendors;
   -- or concat_ws
   SELECT vendor_name,
    UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    concat_ws( ".", substring(vendor_phone, 2, 3), 
      substring(vendor_phone,7,3), SUBSTRING(vendor_phone, 11)),
    substring(vendor_phone, 2, 3) as area_code,
    substring(vendor_phone,7,3) as exchange,
    SUBSTRING(vendor_phone, 11) AS last_digits FROM vendors;
   -- or with replace 
    SELECT vendor_name,
    UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    replace( replace (replace(vendor_phone, "(", ""),  ") " , "."), "-", ".")
     FROM vendors;
    
    -- PROBLEM 4
    
select current_timestamp(), current_date(), current_time;

 -- PROBLEM 5 
 
SELECT month(invoice_date), day(invoice_date), 
        year(invoice_date), dayofweek(invoice_date), 
          invoice_date FROM invoices;
          
-- Problem 6 

SELECT invoice_date,  
       month(invoice_date), day(invoice_date), 
       year(invoice_date), dayofweek(invoice_date), 
       dayname(invoice_date),
       if(dayofweek(invoice_date) IN (1,7), 'WEEKEND', 'WEEKDAY') 
          from invoices;
       
 -- Problem 7      
SELECT payment_date, 
       ifnull(payment_date, 'No payment') from invoices;

-- Problem 8

SELECT RANK() OVER (ORDER BY invoice_total DESC) as ROW_VALUE, invoice_total from INVOICES;

SELECT invoice_due_date, RANK() OVER (ORDER BY invoice_due_date ) as ROW_VALUE, invoice_total from INVOICES;


   -- WAY TOO COMPLICATED 
SELECT vendor_name,
    UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    SUBSTRING(vendor_phone, 11) AS last_digits,
    REPLACE(REPLACE(REPLACE(vendor_phone, '(', ''), ') ', '.'), '-', '.') AS phone_with_dots,
    IF(LOCATE(' ', vendor_name) = 0,
        '',
		IF(LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) = 0,
			SUBSTRING(vendor_name, LOCATE(' ', vendor_name) + 1),
			SUBSTRING(vendor_name,
				LOCATE(' ', vendor_name) + 1,
                LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) - LOCATE(' ', vendor_name))))
    AS second_word
FROM vendors;

