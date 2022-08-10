-- create a procedure named practice with the following signature
-- CREATE PROCEDURE practice ( 
-- IN test_val_p INT ,
-- OUT ret_val_p INT) 
-- it assigns  ret_val to 20 if test_value is 5
-- if the condition fails it assigns ret_val to 30 
USE scratch;
DELIMITER $$;
CREATE PROCEDURE practice(OUT ret_val_p INT,
						IN test_val_p INT)
BEGIN
IF(test_val_p = 5) THEN 
	SET ret_val_p = 20;
ELSE
	SET ret_val = 30;
END IF;
END $$;

DELIMITER ;

-- create a procedure that given an invoice_id returns the invoice_total
-- CREATE PROCEDURE get_invoice_total (
-- IN invoice_id_p INT ,
-- OUT invocie_total_p DECIMAL(9,2) ) 

DELIMITER $$
CREATE PROCEDURE get_invoice_total(
	IN invoice_id_p INT ,
    OUT invoice_total_p DECIMAL(9,2) )
BEGIN 
	DECLARE local_v  DECIMAL(9,2);
    
    SELECT invoice_total INTO  invoice_total_p FROM invoices
		WHERE invoice_id = invoice_id_p;
END$$
DELIMITER ;

-- create a procedure that gicen a vendor_id returns the invoices
-- for that vendor
-- CREATE PROCEDURE get_invoices( IN vendor_id_p INT ) 

DELIMITER $$
CREATE PROCEDURE get_invoices ( IN vendor_id_p INT)
BEGIN 
SELECT * FROM invoices WHERE vendor_id = vendor_id_p;

END $$
DELIMITER ;

CALL get_invoices(122);
CALL get_invoices(1)
