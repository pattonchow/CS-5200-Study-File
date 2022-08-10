-- DROP DATABASE IF EXISTS premierlastnamefirstnameinitial;
-- CREATE DATABASE premierlastnamefirstnameinitial;
USE premierlastnamefirstnameinitial; 

-- 4.	Generate a list of matches for match day 1, in which the home team won. 
-- The result should contain the match number, home team and the away team name. (5 points)
SELECT match_number, team_1 AS home_team, team_2 AS away_team FROM matches WHERE match_day = 1 AND full_time_score_team_1 > full_time_score_team_2;
-- 5.	Which teams had more than one manager in the season? 
-- The result should contain the team name and the number of managers. (5 points)
SELECT team, manager_nums FROM
( SELECT team, COUNT(team) AS manager_nums FROM managers GROUP BY team) 
	AS manager_count_table WHERE manager_nums > 1; 
    
-- 6.	Which manager/managers worked for more than one team? 
-- The result should contain the manager name and number of teams. (5 points)
SELECT manager, team_nums FROM
( SELECT manager, COUNT(manager) AS team_nums FROM managers GROUP BY manager)
	AS team_count_table WHERE team_nums > 1;
-- 7.	Generate a result that contains  managers, teams and the number of goals scored by the team in the home stadium 
-- for each team for this season. Consider only the active managers. The list should be in descending order of number of goals.
-- The result should contain the manager’s name, the team name, and the number of goals. (5 points)

SELECT manager, team, SUM(full_time_score_team_1) AS num_goals FROM 
( SELECT manager, team FROM managers WHERE status = 'active') AS man LEFT JOIN matches AS mat ON man.team = mat.team_1
    GROUP BY team ORDER BY num_goals DESC;


-- 8.	Generate a list consisting of a manager’s name, total number of matches won by the manager in the season. 
-- The list should be in descending order of number of matches. Consider only the active managers. (5 points)

-- (SELECT manager, team FROM managers WHERE status = 'active') ;

-- SELECT team, manager_nums FROM
-- ( SELECT team, COUNT(team) AS manager_nums FROM managers GROUP BY team) 
-- 	AS manager_count_table WHERE manager_nums > 1; 
-- SELECT team_1 AS team FROM matches WHERE full_time_score_team_1 > full_time_score_team_2
-- UNION ALL SELECT team_2 AS team FROM matches WHERE full_time_score_team_1 < full_time_score_team_2;

SELECT manager, team_win_nums FROM (SELECT manager, team FROM managers WHERE status = 'active') AS mt
LEFT JOIN (SELECT team, COUNT(*) AS team_win_nums FROM 
( SELECT team_1 AS team FROM matches WHERE full_time_score_team_1 > full_time_score_team_2
UNION ALL SELECT team_2 AS team FROM matches WHERE full_time_score_team_1 < full_time_score_team_2) AS team_table
	GROUP BY team) AS tt ON mt.team = tt.team ORDER BY team_win_nums DESC;


-- 9.	Determine the stadium, where the most number of goals were scored. 
-- The result should only contain the  stadium name. (5 points)
SELECT venue AS statium, (SUM(t1)+SUM(t2)) AS num_goals FROM
( SELECT m.full_time_score_team_1 AS t1, m.full_time_score_team_2 AS t2, 
	s.venue FROM matches m LEFT JOIN stadiums s ON m.team_1 = s.team) AS s_table
    GROUP BY venue ORDER BY num_goals DESC LIMIT 1; 
    
-- 10.	Determine the number of matches ended as a draw per team. 
-- The result should contain the team name and the number of matches. (5 points)
SELECT team, COUNT(*) AS num_draw FROM 
( SELECT team_1 AS team FROM matches WHERE full_time_score_team_1 = full_time_score_team_2
UNION ALL SELECT team_2 AS team FROM matches WHERE full_time_score_team_1 = full_time_score_team_2)
 AS team_table GROUP BY team ORDER BY num_draw DESC;

-- 11.	Clean sheets means that the team did not allow an opponent to score a goal in the match. 
-- Determine the top 5 teams ranked by number of clean sheets in the season. 
-- The result should contain the team’s name and the count of the clean sheets.
-- The result should be ordered in descending order by the count of clean sheets. (5 points)
SELECT team, COUNT(*) AS clean_sheet FROM
( SELECT team_1 AS team FROM matches WHERE full_time_score_team_2 = 0
	UNION ALL SELECT team_2 AS team FROM matches WHERE full_time_score_team_1 = 0)
 AS count_table GROUP BY team ORDER BY clean_sheet DESC LIMIT 5;


-- 12.	Generate a list of matches played between Christmas and 3rd January where the home team scored 3 or more goals. 
-- Consider the date range 25th December to 3rd January(Including). Display all the fields for the match. (5 points)
SELECT * FROM matches WHERE (date BETWEEN '2017-12-25' AND '2018-01-03') AND full_time_score_team_1 >= 3;

-- 13.	Generate the list of all the matches, where a team came back from losing the game at the end of the first half of the game, 
-- to winning at the end of the second half. The result should contain all the columns in the match tuple. (5 points)
SELECT * FROM matches WHERE (half_time_score_team_1 < half_time_score_team_2 AND full_time_score_team_1 > full_time_score_team_2)
	OR (half_time_score_team_1 > half_time_score_team_2 AND full_time_score_team_1 < full_time_score_team_2);

-- 14.	Determine the top 5 teams by the number of matches won by the teams. 
-- The result should just contain team names. (5 points)
-- SELECT team FROM (SELECT manager, team FROM managers WHERE status = 'active') AS mt
-- LEFT JOIN (SELECT team, COUNT(*) AS team_win_nums FROM 
-- ( SELECT team_1 AS team FROM matches WHERE full_time_score_team_1 > full_time_score_team_2
-- UNION ALL SELECT team_2 AS team FROM matches WHERE full_time_score_team_1 < full_time_score_team_2) AS team_table
-- 	GROUP BY team) AS tt ON mt.team = tt.team ORDER BY team_win_nums DESC LIMIT 5;

 SELECT team FROM (SELECT team, COUNT(*) AS nums FROM
 (SELECT team_1 AS team FROM matches WHERE full_time_score_team_1 > full_time_score_team_2
UNION ALL SELECT team_2 AS team FROM matches WHERE full_time_score_team_1 < full_time_score_team_2)
AS team_table GROUP BY team ORDER BY nums DESC LIMIT 5) AS mt; 

-- 15.	Write a query that computes  for each team the average number of goals conceded at home,
-- the average number of goals scored at home, the average number of goals scored away from
-- home and the average number of goals conceded away from home. (5 points)
SELECT home.team, home.num_home_conceded, home.num_home_scored, away.num_away_conceded, away.num_away_scored FROM
	(SELECT team_1 AS team, AVG(full_time_score_team_2) AS num_home_conceded, AVG(full_time_score_team_1) 
AS num_home_scored FROM matches GROUP BY team) AS home LEFT JOIN 
	(SELECT team_2 AS team, AVG(full_time_score_team_1) AS num_away_conceded, AVG(full_time_score_team_2) 
AS num_away_scored FROM matches GROUP BY team) AS away ON home.team = away.team;
-- 16.	Generate a self-contained extract of your database to canvas using the ‘data export’ tool from the ‘Server’ menu. 
-- Make sure you include the create schema as well as other objects in the database. The file should be a self-contained file. 
-- We must be able to import your schema so please ensure the extracted file works with import. Below is the panel for export. (10)


