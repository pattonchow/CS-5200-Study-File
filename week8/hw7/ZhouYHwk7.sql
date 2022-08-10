USE lotrfinal_1;
-- 1. Write a procedure track_character(character_name)  that accepts a character name and returns a result set 
-- that contains a list of the other characters that the provided character has encountered. 
-- The result set should contain the character’s name, the region name, the book name, and the name of the encountered character. (10 points)

-- SELECT character1_name AS character_name, region_name, title AS book_name, character2_name AS encountered_character
-- FROM (SELECT * FROM lotr_first_encounter
-- UNION SELECT character2_name, character1_name, book_id, region_name FROM lotr_first_encounter) AS encounter_info 
-- LEFT JOIN lotr_book USING(book_id);
 
 DELIMITER $$
 DROP PROCEDURE IF EXISTS track_character;
 CREATE PROCEDURE track_character( character_name varchar(100))
 BEGIN
	SELECT character1_name AS character_name, region_name, title AS book_name, character2_name AS encountered_character
	FROM (
        SELECT * FROM lotr_first_encounter
		UNION SELECT character2_name, character1_name, book_id, region_name FROM lotr_first_encounter) AS encounter_info 
	LEFT JOIN lotr_book USING(book_id) WHERE character1_name = character_name;
 END $$
 DELIMITER ;

-- q1 test
call track_character('aragorn');
call track_character('frodo'); 
-- 2. Write a procedure track_region(region) that accepts a region name and returns a result set that contains the region name, 
-- the book name, the number of encounters for that region and the leader of that region. (10 points)

DELIMITER $$
DROP PROCEDURE IF EXISTS track_region;
CREATE PROCEDURE track_region(IN region VARCHAR(10))
BEGIN
	SELECT region_name, title AS book_name, num_encounters, leader
	FROM (SELECT region_name, book_id, COUNT(region_name) AS num_encounters 
		FROM lotr_first_encounter GROUP BY region_name, book_id) AS encounter_table
	LEFT JOIN lotr_book USING (book_id)
	LEFT JOIN lotr_region USING (region_name) WHERE region_name = region;
END $$
DELIMITER ;

-- q2 test  
call track_region('rivendell');
call track_region('bree');
 
-- 3. Write a function named strongerSpecie(sp1,sp2). It accepts 2 species and returns 1 if sp1 has a size larger than sp2,
-- 0 if they have equal sizes, else -1 (10 points)
DELIMITER //
DROP FUNCTION IF EXISTS strongerSpecie;
CREATE FUNCTION strongerSpecie(sp1 VARCHAR(20), sp2 VARCHAR(20))
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE result INT DEFAULT 0;
    DECLARE size1 INT DEFAULT 0;
    DECLARE size2 INT DEFAULT 0;
    
    SELECT size INTO size1 FROM lotr_species WHERE species_name = sp1;
    SELECT size INTO size2 FROM lotr_species WHERE species_name = sp2;
    
    IF size1 > size2 THEN
		SET result = 1;
	ELSEIF size1 = size2 THEN
		SET result = 0;
	ELSEIF size1 < size2 THEN
		SET result = -1;
	END IF;
    RETURN result;
END //
DELIMITER ;

-- q3 test
SELECT strongerSpecie('dwarf','elf') as q3_result;
SELECT strongerSpecie('ent','elf') as q3_result;
SELECT strongerSpecie('human','elf') as q3_result;

-- 4.  Write a function named region_most_encounters(character_name) that accepts a character name and returns the name of the region 
-- where the character has had the most encounters. (10 points)
 DELIMITER //
 DROP FUNCTION IF EXISTS region_most_encounters;
 CREATE FUNCTION region_most_encounters(character_name VARCHAR(20))
 RETURNS  VARCHAR(20)
 DETERMINISTIC READS SQL DATA
 BEGIN
	DECLARE region_name_var VARCHAR(20) DEFAULT NULL;
    
	SELECT region_name INTO region_name_var FROM(
        SELECT region_name, COUNT(*) AS region_encounter_num 
        FROM lotr_first_encounter WHERE character_name = character1_name
        OR character_name = character2_name GROUP BY region_name
        ORDER BY region_encounter_num DESC LIMIT 1) AS region_info;
	
    RETURN region_name_var;
 END //
 DELIMITER ;
 
 -- q4 test
SELECT region_most_encounters('aragorn') AS q4_result;
SELECT region_most_encounters('frodo') AS q4_result; 
-- 5.  Write a function named home_region_encounter(character_name) that accepts a character name and returns TRUE 
-- if the character has had a first encounter in his homeland. FALSE if the character has not had a first encounter in his homeland. 
-- or NULL if the character’s homeland is not known. (10 points)
DELIMITER //
DROP FUNCTION IF EXISTS home_region_encounter;
CREATE FUNCTION home_region_encounter(character_name VARCHAR(10))
RETURNS VARCHAR(10)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE result VARCHAR(10);
    DECLARE character_homeland VARCHAR(20) DEFAULT NULL;
    
    SELECT homeland INTO character_homeland FROM lotr_character 
		WHERE lotr_character.character_name = character_name;
	IF character_homeland = NULL THEN
		SET result = 'NULL';
    ELSEIF character_homeland IN (
    SELECT region_name FROM lotr_first_encounter
    WHERE character1_name = character_name OR character2_name = character_name)
    THEN SET result = 'TRUE';
    ELSE SET result = 'FALSE';
    END IF;
    RETURN (result);
END //
DELIMITER ;

-- q5 test 
 SELECT home_region_encounter('frodo') AS q5_result;
 SELECT home_region_encounter('gandalf') AS q5_result;
-- 6. Write a function named encounters_in_num_region(region_name)  
-- that accepts a region’s name as an argument and returns the number of encounters for that region. (10 points)
DELIMITER //
DROP FUNCTION IF EXISTS encounters_in_num_region;
CREATE FUNCTION encounters_in_num_region(region_name VARCHAR(20))
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE encounters_num_var INT DEFAULT 0;
    
	SELECT COUNT(*) AS encounters_num INTO encounters_num_var 
    FROM lotr_first_encounter lfe WHERE lfe.region_name = region_name;
	RETURN encounters_num_var;
END //
DELIMITER ;

-- q6 test
SELECT encounters_in_num_region('lonely mountain') AS q6_result;
SELECT encounters_in_num_region('shire') AS q6_result;

--  7. Write a procedure  named fellowship_encounters(book) that accepts a book’s name and returns the fellowship characters 
-- (all fields in the character table)  having first encounters in that book. (10 points)
DELIMITER //
DROP PROCEDURE IF EXISTS fellowship_encounters;
CREATE PROCEDURE fellowship_encounters(IN book VARCHAR(50))
BEGIN
	DECLARE book_id_var INT;
    SELECT book_id INTO book_id_var FROM lotr_book WHERE title = book;
	
    SELECT * FROM lotr_character 
    WHERE character_name IN
    (SELECT character1_name FROM lotr_first_encounter WHERE book_id_var = book_id
    UNION SELECT character2_name FROM lotr_first_encounter WHERE book_id_var = book_id);
END //
DELIMITER ;

-- q7 test
CALL fellowship_encounters('the fellowship of the ring');
CALL fellowship_encounters('the two towers');
CALL fellowship_encounters('the return of the king');

-- 8. Modify the books table to contain a field called encounters_in_book and write a procedure called initialize_encounters_count(book)  
-- that accepts a book id and  initializes the field to the number of encounters that occur in that book for the current encounters table. 
-- The book table modification can occur outside or inside of the procedure. (10 points)
 
 
 ALTER TABLE lotr_book DROP encounters_in_book;
 ALTER TABLE lotr_book ADD encounters_in_book INT;
 
 DELIMITER //
 DROP PROCEDURE IF EXISTS initialize_encounters_count;
 CREATE PROCEDURE initialize_encounters_count(book INT)
 BEGIN
	UPDATE lotrfinal_1.lotr_book
	SET encounters_in_book = (
    SELECT COUNT(*) FROM lotr_first_encounter WHERE book_id = book GROUP BY book_id)
    WHERE book_id = book;
 END //
 DELIMITER ;
 
 -- q8 test
 CALL initialize_encounters_count(1);
 CALL initialize_encounters_count(2);
 CALL initialize_encounters_count(3);
 SELECT * FROM lotr_book;
-- 9.  Write a trigger that updates the field encounters_in_book for the book records in the lotr_book table. 
-- The field should contain the number of first encounters for that book.  Call the trigger firstencounters_after_insert. 
-- Insert the following records into the database.  Insert a first encounter in Rivendell between Legolas and Frodo for book 1 .
-- Ensure that the encounters_in_book field is properly updated for this data. (10 points)
DELIMITER //
DROP TRIGGER IF EXISTS firstencounters_after_insert;
CREATE TRIGGER firstencounters_after_insert
AFTER INSERT ON lotr_first_encounter
FOR EACH ROW
BEGIN
	CALL initialize_encounters_count(NEW.book_id);
END //
DELIMITER ;

-- q9 test
INSERT INTO lotr_first_encounter(character1_name, character2_name, book_id, region_name)
VALUES ('Legolas' , 'Frodo' , 1, 'Rivendell');
SELECT * FROM lotr_first_encounter;
SELECT * FROM lotr_book;



-- 10. Create and execute a prepared statement from the SQL workbench that calls home_region_encounter with the argument ‘Aragorn’. 
-- Use a user session variable to pass the argument to the function. (5 points)
--  PREPARE stmt1 FROM 'SELECT home_region_encounter(?) AS q10_result';
 SET @name1 = 'Aragorn';
 EXECUTE stmt1 USING @name;
 
-- 11. Create and execute a prepared statement that calls region_most_encounters() with the argument ‘Aragorn’.
--  Once again use a user session variable to pass the argument to the function. (5 points)
-- PREPARE stmt2 FROM 'SELECT region_most_encounters(?) AS q11_result';
SET @name2 = 'Aragorn';
EXECUTE stmt2 USING @name2;