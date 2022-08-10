USE ap;
-- 1. Get all invoices greater than the average invoice total

SELECT * FROM invoices where invoice_total > 
	(select avg(invoice_total) from invoices);


-- 2. Find all invoices for vendors from New Jersey. 
-- Provide the invoice number, invoice date and invoice total in the result

SELECT * FROM invoices WHERE vendor_id IN (SELECT vendor_id FROM vendors WHERE vendor_state = 'NJ');

SELECT vendor_id FROM vendors WHERE vendor_state = 'NJ';

SELECT * FROM invoices WHERE vendor_id = 5 OR vendor_id = 27;



-- 3. Get all invoices amount that's greater than the vendor's average invoice total  
-- Provide the invoice number, invoice date and invoice total in the result

-- SELECT invoice_id, invoice_date, invoice_total FROM invoices 
-- 	WHERE invoice_total > (select avg(invoice_total) from invoices);

SELECT vendor_id, invoice_total FROM invoices as i WHERE INVOICE_TOTAL >
 (SELECT avg(invoice_total) FROM INVOICES where invoices.vendor_id = I.vendor_id);
-- 4. Get invoices that are larger than the largest invoice for vendor 34 

SELECT * FROM invoices WHERE invoice_total >
	(SELECT MAX(invoice_total) FROM invoices WHERE vendor_id = 34);
    
SELECT * FROM invoices WHERE invoice_total > ALL
	(SELECT invoice_total FROM invoices WHERE vendor_id = 34);

SELECT * FROM invoices WHERE invoice_total > 
	(SELECT invoice_total FROM invoices WHERE vendor_id = 34
		ORDER BY INVOICE_TOTAL LIMIT 1);

-- 5. Get invoices that are smaller than any invoice for vendor 34 
-- SELECT * FROM invoices WHERE vendor_id < 34;
SELECT * FROM invoices WHERE invoice_total < ANY
	(SELECT invoice_total FROM invoices WHERE vendor_id = 34);

SELECT * FROM invoices WHERE invoice_total < 
	(SELECT MIN(invoice_total) FROM invoices WHERE vendor_id = 34);


-- 6. Use the EXISTS clause to find vendors without any invoices 
 SELECT * FROM vendors WHERE vendor_id NOT IN
	(SELECT DISTINCT vendor_id FROM invoices);

-- SELECT i.vendor_id, v.* FROM vendors AS v LEFT OUTER JOIN invoices USING(vendor_id)
-- 	WHERE i.vendor_id IS NULL;
--     
SELECT * FROM vendors WHERE NOT EXISTS
	( SELECT * FROM invoices WHERE invoices.vendor_id = vendors.vendor_id);
 -- 7. Get the largest invoice_total for each state 
    
SELECT MAX(invoice_total), vendor_state FROM invoices JOIN vendors USING(vendor_id)
	GROUP BY vendor_state;
    
-- 8. FOR each state, get the largest sum of the vendors' invoice total
SELECT vendor_state, vendor_name, SUM(invoice_total) as vendor_total
	FROM invoices JOIN vendors USING(vendor_id)
		GROUP BY vendor_name;


SELECT vendor_state, MAX(t.vendor_total) AS max_vendor_total FROM
( SELECT vendor_state, vendor_name, SUM(invoice_total) as vendor_total
	FROM invoices JOIN vendors USING(vendor_id)
    GROUP BY vendor_state, vendor_name) AS t GROUP BY vendor_state;