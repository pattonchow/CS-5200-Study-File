/* the syntax for the SELECT command
SELECT field_list
FROM table
WHERE condition_true  ORDER BY order_field_list  LIMIT num_tuples;

*/
USE AP;

/* let's walk through some commands that we have 
   Covering Chapter 3, 4, 6 in Murach's MySQL
   
*/
-- simple SELECT to extract a subset of the columns 
-- invoice_id, invoice_date and invoice_total from the invoices
SELECT invoice_id, invoice_date, invoice_total FROM invices;

-- we can do computations on the fields returned to change the value returned
-- let's return the invoice_id, the payment date, the invoice_due_date and the difference
-- between the 2 dates. 
SELECT invoice_id, payment_date, invoice_due_date, payment_date - invoice_due_date from invoices;  
-- the name of that column is a bit ugly - we can use the AS keyword
-- to give it a better name
SELECT invoice_id, payment_date, invoice_due_date, 
   payment_date - invoice_due_date AS payment_before_due from invoices;  
   
   -- we can alias or use AS for any field 
   SELECT invoice_id AS invoice FROM invoices; 
   
   -- LET's order the invoices by due date
   SELECT * from invoices ORDER BY invoice_due_date ;
   -- defaults to ASC or ascending order
     SELECT * from invoices ORDER BY invoice_due_date DESC;
-- YOU CAN ORDER BY MORE THAN 1 FIELD
select * FROM invoices order by invoice_due_date DESC, payment_date;
-- Let's look at the LIMIT CLAUSE
-- we can use it determine the max # of tuples to be returned
SELECT invoice_id, vendor_id, invoice_total, invoice_due_date
 FROM invoices order by invoice_due_date DESC LIMIT 10;
 
 SELECT invoice_id, vendor_id, invoice_total, invoice_due_date
 FROM invoices order by invoice_due_date DESC LIMIT 10,5 ; -- WHERE TO START;
 
 -- LET'S SAY I WANT ALL OF THE VENDOR IDS FROM THE INVOICES TABLE
 SELECT vendor_id FROM invoices ORDER BY vendor_id; 
 -- is the result of this a relation?
 SELECT DISTINCT vendor_id FROM invoices ORDER BY vendor_id; 
 -- now let's limit results by values in the tuples
 -- we use the WHERE clause to do this
 -- return information for vendor_id 7
 SELECT * FROM vendors WHERE vendor_id = 7;
 -- we have 
 -- WRITE A QUERY THAT RETURNS ALL VENDORS FROM THE VENDOR TABLE 
 -- WHERE THE VENDOR_ID IS BETWEEN 7 AND 20
 SELECT * FROM vendors WHERE vendor_id >= 7 AND  vendor_id <- 20;
 -- AND is SQL STANDARD  && is MySQL specific they are equivalent 
 -- we can rewrite this query using the BETWEEEN keyword
SELECT * FROM invoices WHERE invoice_id BETWEEN 7 AND 20;
-- What if I wanted to find all vendors from MA or CT
SELECT * FROM vendors WHERE vendor_state = "MA" OR vendor_state = "CT";
-- I can also rewrite this to use the IN keyword
SELECT * FROM vendors WHERE vendor_state IN ('MA', 'CT'); 
-- ASKS STUDENTS TO WRITE A QUERY THAT RETURNS ALL VENDORS NOT FROM NEW ENGLAND
SELECT * FROM vendors WHERE vendor_state NOT IN ('MA', 'CT', 'ME', 'RI', 'VT');

-- What if I wanted all vendors whose name begins with A?
SELECT * FROM vendors WHERE vendor_name LIKE "A%";
-- DO I NEED TO CAPTILIZE THE A ?
SELECT * FROM vendors WHERE vendor_name LIKE "a%";

use ap;
-- so far we have created queries to exrract portions of the tables 
-- we are pulling out subsets of the rowss via the WHERE clasuse
-- and subsets of the columns via the field list
-- but what if we want to combine all values for a column 
-- for example, you want to determine the total amount of money paid from the invoices
-- We can create aggregate queries that perform a function across tuples
-- the SQL standard operations we can perform are SUM, COUNT, MIN, MAX, AVG 
-- SELECT openation(field) FROM table;
SELECT sum(payment_total) FROM invoices; 

-- it returns a single value for use

-- determine the minimum payment date for invoices;

SELECT min(payment_date) FROM invoices; 

-- determine the first payment date 


-- determine the latest payment date 
SELECT max(payment_date) FROM invoices; 

-- determine the average payment

SELECT AVG(payment_total) FROM invoices;

-- determine the number of invoices 
SELECT COUNT(*) FROM invoices; -- 114

SELECT COUNT(vendor_id) FROM invoices;  -- 114

SELECT COUNT(payment_date) FROM invoices; -- 103 

-- difference NULL values are not counted 

-- we can count distinct values for a field 
SELECT COUNT(DISTINCT vendor_id) FROM invoices; -- 34 

-- what if I wanted payment_total by the vendors 
-- I can use the GROUP BY clause to GROUP the invoices into groups 
-- groups are defined by the values of a specific field
--  first show the different rows and sort the result by vendor_id 
SELECT vendor_id, payment_total FROM invoices;

select vendor_id, SUM(payment_total) vendor_total FROM invoices GROUP BY vendor_id; 

-- with rollup determine the aggregate of the aggregates - total sum at the end of the table 
-- it generates grand totals 

select vendor_id, SUM(payment_total) vendor_total FROM invoices GROUP BY vendor_id with rollup;
-- Now let's say you are only interested in reporting vendors where the sum of the payment
-- is greater than $800 - you want to apply a filter to the results we just generated
-- the HAVING clause allows you to filter an AGGREGATED RESULT
select vendor_id, SUM(payment_total) vendor_total FROM invoices GROUP BY vendor_id
  having vendor_total > 800 order by vendor_total DESC; 
  
  -- MYSQL does have an additional aggregate function called group_concat - 
  -- it produces a comma separate list of a string 
  SELECT GROUP_concat(DISTINCT vendor_city), vendor_state FROM vendors GROUP BY vendor_state;

-- So far we have been generating information from 1 table 
-- but useful information is across multiple tables
-- this schema seems to have some redundancy 
-- what if I want vendor contacts - it looks like I have this
-- information in the vendors table and the vendor contacts table
SELECT vendor_id, last_name, first_name FROM vendor_contacts ORDER BY vendor_id;
-- I CAN ALSO WRITE THE same query for the vendors table

SELECT vendor_id, vendor_contact_last_name, vendor_contact_first_name FROM vendors ORDER BY vendor_id;
-- WHAT I WANT TO DO IS GLUE THESE 2 RESULTS TOGETHER
-- union OPERATION DOES THIS FOR ME
SELECT vendor_id, last_name, first_name FROM vendor_contacts 
UNION 
SELECT vendor_id, vendor_contact_last_name, vendor_contact_first_name FROM vendors ORDER BY vendor_id;
-- I GET BACK 130 TUPLES so we can look at the duplicates 
-- 1 Select all fields and all tuples from the invoices table

-- there are no duplicates in this result each tuple was different due to the names

-- but what if there would be duplicates like
SELECT vendor_id FROM vendors
UNION
SELECT vendor_id FROM vendor_contacts;
-- UNION removes the duplicates - makes sense since it is a SET operation
-- but what if you want the duplicates???
-- use the KEYWORD ALL
SELECT vendor_id FROM vendors
UNION ALL
SELECT vendor_id FROM vendor_contacts ORDER BY vendor_id;

-- we can also use the JOIN operation to pull data from multiple tables
-- what if I want fields from different tables like the invoice total and the vendor name
-- in my result  - SHOW THE RELATIONSHIP IN THE MODELING TOOL 
-- this is where we take advantage of our foreign keys 
-- SELECE field_list FROM table1 INNER JOIN table2 ON table1.field1 = table2.field2;
-- this is known as an inner join, we limit our result to tuples that satsfy the
-- ON clause 

-- JOIN A JOIN combines records from two tables.
-- JOIN matches related column values in two tables. - TYPICALLY A FOREIGN KEY TO A PRIMARY KEY 
-- A sql select query can contain zero, one, or multiple JOIN operations.

SELECT invoice_id, vendor_name, invoice_total FROM invoices INNER JOIN vendors
    ON invoices.vendor_id = vendors.vendor_id; 
-- what if I wanted vendor_id in the result? can I just add it to the field list
SELECT invoice_id, vendor_name, vendor_id, invoice_total FROM invoices INNER JOIN vendors
    ON invoices.vendor_id = vendors.vendor_id; 
-- NO I generate an error need the table name to disambiguate the field 

-- what happens if I forget the ON clause let's do it between the vendor and the
-- vendor_contacts table
SELECT invoice_id, vendor_name, invoice_total FROM invoices JOIN vendors ORDER BY invoice_id;
-- I am just doing a CROSS PRODUCT FOR EACH TUPLE IN ONE TABLE 
-- I AM MERGING IT WITH EVERY TUPLE IN THE OTHER TABLE
--  YOU TYPICALLY DO NOT WANT TO DO THIS.
-- THIS IS KNOWN AS AN CROSS JOIN - 
SELECT invoice_id, vendor_name, invoice_total FROM invoices CROSS JOIN vendors ORDER BY invoice_id;
-- NOW there is another way to express a JOIN - the old fashion syntax
-- SELECT fieldlist FROM tablelist WHERE to restrict tuples;
SELECT invoice_id, vendor_name, invoice_total FROM invoices, vendors
  WHERE vendors.vendor_id = invoices.vendor_id;
  -- I get the same result as the result where I use the JOIN key word
  -- this is known as an implicit JOIN when you use the KEYWORD JOIN
  -- that is known as an explicit JOIN
  -- INDUSTRY EXPLECTS EXPLICIT JOINS 
  
  -- EXPLICIT JOINS was added to SQL standard to extend the functionality of JOIN so the
  -- creator of the query has a little more control on what is part of the results.
  -- let's say I am tracking money gotten from vendors we would use our JOIN construct to
  -- report on vendors 
  SELECT invoice_id, vendor_name, invoice_total FROM invoices, vendors
  WHERE vendors.vendor_id = invoices.vendor_id;
  -- but this query only reports on vendors that have invoices - I am not reporting 
  -- on all of my vendors . If you want to ensure that ALL tuples from one table has 
  -- at least 1 tuple in the result we use an OUTER JOIN - I claim each tuple
  -- in the OUTER table must appear in my result 
  -- which table is my outer table
  SELECT vendor_name, invoice_id, invoice_total FROM invoices RIGHT OUTER JOIN  vendors
  ON vendors.vendor_id = invoices.vendor_id ORDER BY invoice_id;
  -- THE VALUES FOR THE FIELDS FROM THE TABLE WITHOUT A MATCH ARE SET TO null 
  -- now what if I just want the vendors who have no invoices
  SELECT vendor_name, invoice_id, invoice_total FROM invoices RIGHT OUTER JOIN  vendors
  ON vendors.vendor_id = invoices.vendor_id WHERE invoices.invoice_id IS NULL;
  -- there is also something known as a NATURAL JOIN 
  -- a NATURAL JOIN does not require an ON clause it uses the definition of the 
  -- tables to determine which fields need to be equal
  -- SELECT field_list FROM table NATUAL JOIN table2;
  SELECT * FROM vendor_contacts NATURAL JOIN vendors; 
  -- what is different in the structure of the result ??
  -- the result does not have both values in its result
  -- another keyword that can be used in a explicit JOIN as opposed to 
  -- the ON clause is using
  SELECT * FROM vendor_contacts JOIN vendors USING (vendor_id); 
  -- here we again do not have 2 copies of vendor_id 
  SELECT * FROM vendor_contacts JOIN vendors ON vendor_contacts.vendor_id = vendors.vendor_id; 
-- 2 Create a calculated  payment total for the invoices table
-- 3 Return the vendor name and vendor contact name as one field (use concat)
-- 4 Return the vendor names that start with P (use LIKE)
-- 5 Return the invoice data for invoices_id from 10 to 17;
-- 6 Write a query that uses AND in the WHERE clause 
-- 7 WRITE a query that uses OR in the WHERE clause
-- 8 Order the results of invoice 10 through 17 by invoice_total
-- 9 Order the results of invoice 10 through 17 by invoice_total in descending order and credit_total in ascending order 

-- Count the number of vendors  assign the result to a variable names num_vendors (AGGREGATION )
-- Count the number of invoices per vendor 
-- Calculate the total payment by vendor, return the vendor name and the total
-- Calculate the total payment by vendor, return the vendor id  and the total payment for vendor for vendors who paid more than $100


