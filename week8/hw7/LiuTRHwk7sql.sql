USE lotrfinal_1;

-- 1.Write a procedure track_character(character_name) that accepts a character name and returns a result set that contains a list of the other characters that the provided character has encountered. The result set should contain the character’s name, the region name, the book name, and the name of the encountered character. (10 points)

DELIMITER /
DROP PROCEDURE IF EXISTS track_character;
CREATE PROCEDURE track_character
(IN character_name VARCHAR(255))
BEGIN
SELECT character1_name AS characterName, region_name, title, character2_name AS encountered_character
	FROM
    (SELECT * FROM lotr_first_encounter
		LEFT OUTER JOIN lotr_book
		using(book_id)) AS new_table1
	WHERE character1_name = character_name
UNION ALL
SELECT character2_name AS characterName, region_name, title, character1_name AS encountered_character
	FROM
    (SELECT * FROM lotr_first_encounter
		LEFT OUTER JOIN lotr_book
		using(book_id)) AS new_table2
	WHERE character2_name = character_name;
END/

-- CALL track_character('Aragorn');
-- CALL track_character('frodo');


-- 2.  Write a procedure track_region(region) that accepts a region name and returns a result set that contains the region name, the book name, the number of encounters for that region and the leader of that region. (10 points)

DROP PROCEDURE IF EXISTS track_region;
CREATE PROCEDURE track_region
(IN regionName VARCHAR(255))
BEGIN
SELECT DISTINCT region_name, leader, num_encounter, IFNULL(title, 'NULL') AS title
	FROM
	(SELECT region_name, leader, IFNULL(num_encounter,0) AS num_encounter
		FROM lotr_region
		LEFT OUTER JOIN
		(SELECT region_name, COUNT(region_name) AS num_encounter
			FROM lotr_first_encounter
			GROUP BY region_name) AS new_table1
		USING (region_name)) AS new_table2
	LEFT OUTER JOIN
    (SELECT DISTINCT region_name, book_id, title
	FROM lotr_first_encounter
	LEFT OUTER JOIN lotr_book
	USING (book_id)) AS new_table3
    USING (region_name)
    WHERE region_name = regionName;
END/

-- CALL track_region('rivendell');
-- CALL track_region('bree');

-- 3.Write a function named strongerSpecie(sp1,sp2). It accepts 2 species and returns 1 if sp1 has a size larger than sp2, 0 if they have equal sizes, else -1 (10 points)

DELIMITER $$
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS strongerSpecie;
CREATE FUNCTION strongerSpecie(sp1 VARCHAR(255), sp2 VARCHAR(255))
RETURNS INT
BEGIN
DECLARE size1 INT;
DECLARE size2 INT;
DECLARE result INT;
SELECT size FROM lotr_species WHERE species_name = sp1 INTO size1;
SELECT size FROM lotr_species WHERE species_name = sp2 INTO size2;
SET result =
CASE
WHEN size1 > size2 THEN 1
WHEN size1 = size2 THEN 0
ELSE -1
END;
RETURN result;
END$$

-- SELECT strongerSpecie('human', 'balrog') AS result; -- '<'
-- SELECT strongerSpecie('balrog','human') AS result; -- '>'
-- SELECT strongerSpecie('human', 'orc') AS result; -- '='


-- 4.Write a function named region_most_encounters(character_name) that accepts a character name and returns the name of the region where the character has had the most encounters. (10 points)


DROP FUNCTION IF EXISTS region_most_encounters;
CREATE FUNCTION region_most_encounters(characterName VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
RETURN (
SELECT region_name
	FROM
	(SELECT character1_name, region_name 
		FROM
			(SELECT character1_name, character2_name, region_name FROM lotr_first_encounter
			UNION 
			SELECT character2_name, character1_name, region_name FROM lotr_first_encounter) AS new_table1
		WHERE character1_name = characterName) AS new_table2
	GROUP BY region_name
	ORDER BY COUNT(region_name) DESC
	LIMIT 1
);
END$$

-- SELECT region_most_encounters('frodo') AS result;
-- SELECT region_most_encounters('elrond') AS result;

-- 5.Write a function named home_region_encounter(character_name) that accepts a character name and returns TRUE if the character has had a first encounter in his homeland. FALSE if the character has not had a first encounter in his homeland. or NULL if the character’s homeland is not known. (10 points)


DROP FUNCTION IF EXISTS home_region_encounter;
CREATE FUNCTION home_region_encounter(characterName VARCHAR(255))
RETURNS VARCHAR(64)
BEGIN
DECLARE num1 INT;
DECLARE result VARCHAR(64);
SELECT sameasHomeland INTO num1
	FROM
	(SELECT character_name, region_name, COUNT(*) AS sameasHomeland
		FROM
	 (SELECT character_name, region_name, homeland
		FROM lotr_character
		INNER JOIN
		(SELECT character1_name AS character_name, region_name
			FROM lotr_first_encounter
			WHERE character1_name = characterName
			UNION 
			SELECT character2_name, region_name
			FROM lotr_first_encounter
			WHERE character2_name = characterName) AS new_table1
		USING (character_name)) AS new_table2
		WHERE region_name = homeland
        GROUP BY character_name) AS new_table3
	WHERE character_name = characterName;
SET result =
CASE
WHEN num1 >= 1 THEN 'TRUE'
WHEN num1 = 0 THEN 'FALSE'
ELSE 'NULL'
END;
RETURN result;
END$$

-- SELECT home_region_encounter('frodo'); -- TRUE
-- SELECT home_region_encounter('aragorn'); -- NULL




-- 6.Write a function named encounters_in_num_region(region_name)  that accepts a region’s name as an argument and returns the number of encounters for that region. (10 points)

-- 不可以将 COUNT(*) 的值赋给int类型
DELIMITER $$
DROP FUNCTION IF EXISTS encounters_in_num_region;
CREATE FUNCTION encounters_in_num_region(regionName VARCHAR(255))
RETURNS INT
BEGIN
DECLARE num INT;
SELECT Numbers INTO num FROM 
	(SELECT region_name, COUNT(region_name) AS Numbers
		FROM lotr_first_encounter
		 GROUP BY region_name
		 ) AS new_table2
	WHERE region_name = regionName;
RETURN num;
END$$

-- SELECT encounters_in_num_region('bree');
-- SELECT encounters_in_num_region('rivendell');
-- SELECT encounters_in_num_region('rohan');


-- 7. Write a procedure  named fellowship_encounters(book) that accepts a book’s name and returns the fellowship characters (all fields in the character table)  having first encounters in that book. (10 points)


DROP PROCEDURE IF EXISTS fellowship_encounters;
CREATE PROCEDURE fellowship_encounters
(IN book VARCHAR(255))
BEGIN
DECLARE bookId INT;
SET bookId = (SELECT book_id FROM lotr_book WHERE title = book);
SELECT *
	FROM 
	(SELECT character1_name AS character_name
		FROM
		(SELECT * 
			FROM
			(SELECT character1_name, book_id
				FROM lotr_first_encounter
				WHERE book_id = bookId
				UNION
				SELECT character2_name, book_id
				FROM lotr_first_encounter
				WHERE book_id = bookId) AS new_table1
			LEFT OUTER JOIN lotr_book
			USING (book_id)) AS new_table2)AS new_table3
	LEFT JOIN lotr_character
    USING (character_name);
END$$

-- CALL fellowship_encounters('the fellowship of the ring');

-- CALL fellowship_encounters('the two towers');


-- 8. Modify the books table to contain a field called encounters_in_book and write a procedure called initialize_encounters_count(book)  that accepts a book id and  initializes the field to the number of encounters that occur in that book for the current encounters table. The book table modification can occur outside or inside of the procedure. (10 points)

-- ALTER TABLE lotr_book DROP COLUMN encounters_in_book
-- ALTER TABLE lotr_book ADD COLUMN encounters_in_book INT NULL AFTER title;

DROP PROCEDURE IF EXISTS initialize_encounters_count;
CREATE PROCEDURE initialize_encounters_count
(IN bookId INT)
BEGIN
UPDATE lotr_book
	SET lotr_book.encounters_in_book = (
		SELECT encounters FROM
		(SELECT book_id, COUNT(region_name) AS encounters
		FROM lotr_first_encounter
        WHERE book_id = bookId
		GROUP BY book_id
        ) AS new_table2
    )
    WHERE lotr_book.book_id = bookId;
END$$
-- CALL initialize_encounters_count(1);
-- CALL initialize_encounters_count(2);
-- CALL initialize_encounters_count(3);



-- 9.Write a trigger that updates the field encounters_in_book for the book records in the lotr_book table. The field should contain the number of first encounters for that book.  Call the trigger firstencounters_after_insert. Insert the following records into the database.  Insert a first encounter in Rivendell between Legolas and Frodo for book 1 . Ensure that the sencounters_in_book field is properly updated for this data. (10 points)
 


DROP TRIGGER IF EXISTS firstencounters_after_insert;
CREATE TRIGGER firstencounters_after_insert
AFTER INSERT 
ON lotr_first_encounter FOR EACH ROW
BEGIN
DECLARE num INT;
SET num = (
		SELECT encounters FROM
		(SELECT book_id, COUNT(region_name) AS encounters
		FROM lotr_first_encounter
        WHERE book_id = new.book_id
		GROUP BY book_id) AS new_table2
    );
UPDATE lotr_book SET encounters_in_book = num WHERE (book_id = new.book_id);
END$$


-- INSERT INTO lotr_first_encounter (character1_name, character2_name, book_id, region_name) VALUES ('saruman', 'elrond', '3', 'Rivendell');
-- INSERT INTO lotr_first_encounter (character1_name, character2_name, book_id, region_name) VALUES ('Legolas', 'Frodo', '1', 'Rivendell');


-- 10. Create and execute a prepared statement from the SQL workbench that calls home_region_encounter with the argument ‘Aragorn’. Use a user session variable to pass the argument to the function. (5 points)


PREPARE Q10 FROM 'SELECT home_region_encounter(?) AS result';
SET @_name = 'Aragorn';
EXECUTE Q10 USING @_name;


-- 11.Create and execute a prepared statement that calls region_most_encounters() with the argument ‘Aragorn’. Once again use a user session variable to pass the argument to the function. (5 points)

PREPARE Q11 FROM 'SELECT region_most_encounters(?) AS result';
SET @_name = 'Aragorn';
EXECUTE Q11 USING @_name;



