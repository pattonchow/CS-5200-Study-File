-- Yao Zhou HW3
-- Question 2
-- a.How many databases are created by the script?
-- answer 3
--
-- b.List the database names and the tables created for each database.
-- database ap has 7 tables : general_ledger_accounts | terms | vendors | invoices 
-- invoice_line_items | vendor_contacts | invoice_archive
-- database ex has 11 tables: null_sample | departments | employees | projects | customers
-- color_sample | string_sample | float_sample | date_sample | active_invoices | paid_invoices
--
-- c.How many records does the script insert into the om.order_details table?
-- answer 68
--
-- d.How many records does the script insert into the ap.invoices table?
-- answer 114
--
-- e.How many records does the script insert into the ap.vendors table?
-- answer 122
--
-- f. Is there a foreign key between the ap.invoices and the ap.vendors table?
-- answer yes
--
-- g.How many foreign keys does the ap.vendors table have?
-- answer 2
--
-- h.What is the primary key for the om.customers table?
-- answer customer_id
--
-- i.Write a SQL command that will retrieve all values for all fields from the orders table
 USE om;
 SELECT * FROM orders;
--
-- j.Write a SQL command that will retrieve the fields: title and artist from the om.items table
 USE om;
 SELECT title, artist FROM items;
--
--
-- Question 5
-- a. How many tables are created by the script?
-- answer 11
-- b. List the names of the tables created for the Chinook database.
-- answer  Album | Artist | Customer | Employee | Genre | Invoice
-- InvoiceLine | MediaType | Playlist | PlaylistTrack | Track
-- c. How many records does the script insert into the Album table?
-- answer 347
-- d. What is the primary key for the Album table?
-- answer AlbumId
-- e. Write a SQL SELECT command to retrieve all data from all columns and rows in the Artist table.
 USE chinook;
 SELECT * FROM Artists;
-- f. Write a SQL SELECT command to retrieve the fields FirstName, LastName and Title from the Employee table
 USE chinook;
 SELECT FirstName, LastName, Title FROM Employee;