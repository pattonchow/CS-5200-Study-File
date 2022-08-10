USE ap;
-- function exercises
-- Q1
-- write a query that returns vendor sorted by vdendor_id alphabetically 
SELECT * FROM vendors ORDER BY vendor_id;

-- Q2 
-- write a select statement to return 3 columns from the invoices table
-- the invoice total
-- ROUND the invoice_total to 1 decimal place
-- round to the nearest whole number (no decimal place)
-- round to nearest INTEGER using a different function
SELECT invoice_total, ROUND(invoice_total, 1) AS one_digit,
	ROUND(invoice_total, 0) AS zero_digits_round,
    TRUNCATE(invoice_total, 0) AS zero_digits_truncate
FROM invoices;


-- Q3
-- WRITE A QUERY TO RETURN THE FOLLOWING COLUMNS FROM THE VENDORS TABLE
-- VENDOR NAME COL
-- VENDOR NAME COLUMN IN CAPITAL LETTERS
-- VENDOR PHONE NUMBER
-- COLUMN THAT DISPLAYS THE LAST FOUR DIGITS OF THE PHONE NUMBER
-- COLUMN THAT DISPLAY THE PHONE NUMBER WITH PERIODS BETWEEN THE 3 SECTIONS OF THE PHONE NUMBER 
SELECT vendor_name,
UPPER(vendor_name) AS vendor_name_upper,
vendor_phone,
SUBSTRING(vendor_phone, 11) AS last_digits
-- , RIGHT(vendor_phone, 4) 
FROM vendors;

-- SELECT vendor_name,
--     UPPER(vendor_name) AS vendor_name_upper,
--     vendor_phone,
--     concat( substring(vendor_phone, 2, 3), ".", substring(vendor_phone,7,3), ".",
--     SUBSTRING(vendor_phone, 11))
--    substring(vendor_phone, 2, 3) as area_code,
--    substring(vendor_phone,7,3) as exchange,
--    SUBSTRING(vendor_phone, 11) AS last_digits  FROM vendors;

--  SELECT vendor_name,
--     UPPER(vendor_name) AS vendor_name_upper,
--     vendor_phone,
--     concat_ws( ".", substring(vendor_phone, 2, 3), 
--       substring(vendor_phone,7,3), SUBSTRING(vendor_phone, 11)),
--     substring(vendor_phone, 2, 3) as area_code,
--     substring(vendor_phone,7,3) as exchange,
--     SUBSTRING(vendor_phone, 11) AS last_digits FROM vendors;
--     SELECT vendor_name,
--     UPPER(vendor_name) AS vendor_name_upper,
--     vendor_phone,
--     replace( replace (replace(vendor_phone, "(", ""),  ") " , "."), "-", ".")
--      FROM vendors;

-- Q4
-- RETURN THE CURRENT DATE, CURRENT TIME AND THE CURRENT DATE AND TIME 
SELECT CURDATE(), CURTIME(), CURRENT_TIMESTAMP(); 

-- Q5
-- extract the year, month and day as well as the day of the week from the invoice_date
SELECT YEAR(invoice_date), MONTH(invoice_date), DAY(invoice_date), DAYOFWEEK(invoice_date)
	FROM invoices;

-- Q6
-- ADD A COLUMN TO q5 that has 2 values "Weekday" or "weekend"  if the day of the week is Saturday or Sunday 
-- the value should be "weekend" or else it is set to "Weekday" -- also add the day of the week as a string
SELECT YEAR(invoice_date), MONTH(invoice_date), DAY(invoice_date),
	DAYOFWEEK(invoice_date),
	DAYNAME(invoice_date),
    IF(DAYOFWEEK(invoice_date) IN (1,7) , 'WEEKEND', 'WEEKDAY') AS WEEK 
    FROM invoices;

-- Q7
-- return the payment_date from invoices and a column with the value = "No payment" if no payment received
-- or else the column is set to the payment_date
SELECT payment_date, 
	IFNULL(payment_date, "NO PAYMENT") AS payment_state FROM invoices;

-- Q8 
-- add a rank value  to each row from the invoices table that is determined by the invoice_total 
--
SELECT  RANK()  OVER( ORDER BY invoice_total DESC) row_value, invoice_total FROM invoices;

