USE lotrfinal_1;

-- 1. (10 points) For each character (found in the lotr_character table) , count the number of encounters documented within the database.
--  Note: a character’s name may appear in two different fields in the encounter table.
--  Each tuple in the result should contain the character’s name and the count of encounters.
SELECT character_name, COUNT(region_name) AS nums FROM lotr_character LEFT JOIN  lotr_first_encounter
	ON character1_name = character_name OR character2_name = character_name GROUP BY character_name;


-- 2. (10 points) Count the number of regions each character has visited (as documented in the database). 
-- Each tuple in the result should contain the character’s name and the number of regions the character has been documented as visiting as specified in the database. 
-- Note: the character’s home region should be included in the count. 
SELECT character_name, COUNT(homeland) AS region_visit_num FROM
(	SELECT character_name, homeland FROM lotr_character
	UNION SELECT character1_name, region_name FROM lotr_first_encounter
	UNION SELECT character2_name, region_name FROM lotr_first_encounter
) AS encounter GROUP BY character_name;

-- SELECT character1_name, COUNT(region_name) AS region_visit_num FROM
-- (	SELECT character1_name, region_name FROM lotr_first_encounter
-- 	UNION SELECT character2_name, region_name FROM lotr_first_encounter
-- 	UNION SELECT character_name, homeland FROM lotr_character
-- ) AS new_encounter GROUP BY character1_name;

-- 3. (5 points) Count the number of regions whose majority species is ‘hobbit’. The result should consist of a number.
SELECT COUNT(*) AS nums FROM lotr_region WHERE major_species = 'hobbit';

-- 4. (10 points) What region has been documented as having the most number of first encounters?
SELECT region_name, COUNT(*) AS most_region_name FROM lotr_first_encounter 
	GROUP BY region_name ORDER BY most_region_name DESC LIMIT 1; 

-- 5. (10 points) What region has been visited by all characters?
-- SELECT * FROM lotr_first_encounter;
-- SELECT * FROM lotr_character;
SELECT region AS region_visited_by_all_characters FROM
(SELECT homeland AS region, COUNT(character_name) AS num_visitor 
	FROM (SELECT character_name, homeland FROM lotr_character
		UNION SELECT character1_name, region_name FROM lotr_first_encounter
        UNION SELECT character2_name, region_name FROM lotr_first_encounter)
        AS visitor_region	GROUP BY homeland)
        AS vistor_nums	WHERE num_visitor = (SELECT COUNT(character_name) FROM lotr_character);



-- 6. (5 points) Make a separate table from the lotr_first_encounters table – 
-- where the records are for the first book. Name the new table book1 encounters.
SELECT * FROM lotr_first_encounter AS book1_encounters WHERE book_id = 1;

-- 7. (10 points) Which book (book name) does ‘Frodo’ encounter ‘Faramir’? The result should contain the book id and its title. 
SELECT lb.book_id, lb.title FROM lotr_book lb JOIN lotr_first_encounter lfc
	USING (book_id) 
    WHERE (character1_name = 'Frodo' AND character2_name = 'Faramir') 
		OR ( character2_name = 'Frodo' AND character1_name = 'Faramir');

-- 8. (5 points) For each Middle Earth region (each region in the lotr_region table) , 
-- create an aggregated field that contains a list of character names that have it as his homeland.
-- The result set should contain the region name and the grouped character names. 
-- Do not duplicate names within the grouped list of character names.
SELECT region_name, GROUP_CONCAT(character_name) AS homeland FROM lotr_region
	LEFT JOIN lotr_character ON homeland = region_name GROUP BY region_name;

-- 9. (5 points) Which is the largest species (by size)?
SELECT species_name FROM lotr_species ORDER BY size DESC LIMIT 1;

-- 10. (5 points) How many characters are “human”?
SELECT species, COUNT(*) AS human_nums FROM lotr_character WHERE species = 'human';

-- 11. (5 points) Make a separate table from the first encounter table – 
-- where the tuples are the first encounters between one hobbit and one human. Name the table HumanHobbitFirstEncounters.
SELECT * FROM lotr_first_encounter AS HumanHobbitFirstEncounters WHERE 
	(character1_name IN (SELECT character_name FROM lotr_character WHERE species = 'human' )
    AND character2_name IN (SELECT character_name FROM lotr_character WHERE species = 'hobbit'))
OR  (character1_name IN (SELECT character_name FROM lotr_character WHERE species = 'hobbit') 
    AND character2_name IN (SELECT character_name FROM lotr_character WHERE species = 'human'));
    
    

-- 12. (5 points) List the names of the characters that have “gondor” listed as their home land.
SELECT GROUP_CONCAT(character_name) AS home_land_gondor FROM lotr_character WHERE homeland = 'gondor';

-- 13. (5 points) How many characters have “hobbit” listed as their species?
SELECT COUNT(species) AS num_hobbit FROM lotr_character WHERE species = 'hobbit';

-- 14. (5 points) For each Middle Earth region, determine the number of characters from each homeland. 
-- The result set should contain the region name and the count of the number of characters. 
-- Make sure you do not count characters more than once.
SELECT lr.region_name, COUNT(homeland) AS num_characters FROM lotr_region lr
	LEFT JOIN lotr_character lc ON lr.region_name = lc.homeland 
	GROUP BY region_name;

-- 15. (5 points) For each character determine the number of first encounters they have had according to the database. 
-- Rename the computed number of encounters as encounters. Make sure each character appears in the result. 
-- If a character has not had any encounters, the number of encounters should be equal to NULL or 0. 
SELECT character_name, COUNT(region_name) AS encounters FROM lotr_character LEFT JOIN lotr_first_encounter
ON character1_name = character_name OR character2_name = character_name GROUP BY character_name;