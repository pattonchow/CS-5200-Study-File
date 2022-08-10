USE premierlastnamefirstnameinitial;

-- 4.

 SELECT match_number, team1, team2
 	FROM epl_matches
 	WHERE match_day = 1 AND full_time_score_team1 > full_time_score_team2;


-- 5.
 SELECT team, numberofManager
 	FROM (SELECT team, COUNT(manager) AS numberofManager FROM epl_managers GROUP BY team) AS new_table1
 	WHERE numberofManager > 1;
    
-- 6.
 SELECT manager, numberofTeams
 	FROM (SELECT manager, COUNT(team) AS numberofTeams FROM epl_managers GROUP BY manager) AS new_table1
	WHERE numberofTeams > 1;

-- 7.
 SELECT manager, team1 AS team_name, numberofGoals
 	FROM
 (SELECT team1, SUM(full_time_score_team1) AS numberofGoals 
 	FROM epl_matches 
 	GROUP BY team1) AS new_table1
 LEFT OUTER JOIN 
 (SELECT team , manager
 	FROM epl_managers
	WHERE _status = 'Active') AS new_table2
 ON team1 = team
 ORDER BY numberofGoals DESC;


-- 8.
 SELECT manager, SUM(team1_win) AS numberofWin
 FROM
 	(SELECT * 
 	FROM (SELECT team1, IF (full_time_score_team1> full_time_score_team2, 1,0) AS team1_win FROM epl_matches) AS new_table1 
 	UNION ALL
  SELECT * 
  FROM 
  (SELECT team2, IF (full_time_score_team2 > full_time_score_team1, 1, 0) AS team2_win FROM epl_matches) AS new_table2) AS new_table3
  left OUTER JOIN epl_managers
  ON team1 = team AND _status = 'Active'
 GROUP BY manager
 ORDER BY numberofWin DESC;


-- 9.
 SELECT venue
 	FROM
 	(SELECT team1, full_time_score_team1+full_time_score_team2 AS full_score, venue
 		FROM epl_matches
 		LEFT OUTER JOIN epl_stadiums
 		ON team1 = Team) AS new_table1
 	GROUP BY venue
 	ORDER BY SUM(full_score) DESC
  LIMIT 1;


-- 10.
 SELECT team1, COUNT(team1) AS draw_number
 	FROM
 	(SELECT team1, full_time_score_team1, full_time_score_team2
 		FROM epl_matches
 	UNION ALL 
 	SELECT team2, full_time_score_team1, full_time_score_team2
 		FROM epl_matches) AS new_table1
 	WHERE full_time_score_team1 = full_time_score_team2
  GROUP BY team1
  ORDER BY draw_number DESC;

-- 11.
SELECT team1 AS team_name, SUM(clean_sheets) AS clean_sheet
	FROM
(SELECT team1, COUNT(team1) AS clean_sheets
	FROM epl_matches
    WHERE full_time_score_team2 = 0
    GROUP BY team1
    UNION ALL 
    SELECT team2, COUNT(team2)
    FROM epl_matches
    WHERE full_time_score_team1 = 0
    GROUP BY team2) AS new_table1
    GROUP BY team_name
    ORDER BY clean_sheet DESC
    LIMIT 5;
    
    
-- 12.

SELECT *
	FROM epl_matches 
    WHERE full_time_score_team1 >= 3 AND date between '2017-12-25' and '2018-1-3';
    
-- 13.

SELECT *
	FROM epl_matches
    WHERE (half_time_score_team1 < half_time_score_team2 AND full_time_score_team1 > full_time_score_team2)
		OR (half_time_score_team1 > half_time_score_team2 AND full_time_score_team1 < full_time_score_team2);
        
-- 14.

SELECT team1 AS team_name
FROM
	(SELECT * 
 	FROM (SELECT team1, IF (full_time_score_team1> full_time_score_team2, 1,0) AS team1_win FROM epl_matches) AS new_table1 
    UNION ALL
	SELECT * 
	FROM 
	(SELECT team2, IF (full_time_score_team2 > full_time_score_team1, 1, 0) AS team2_win FROM epl_matches) AS new_table2) AS new_table3
	left OUTER JOIN epl_managers
	ON team1 = team AND _status = 'Active'
 GROUP BY team1
 ORDER BY SUM(team1_win) DESC
 LIMIT 5;

-- 15.
SELECT team1, conceded_score_team1, goals_score_team1, conceded_score_team2, goals_score_team2 
	FROM
    ((SELECT team1, AVG(full_time_score_team2) AS conceded_score_team1 FROM epl_matches GROUP BY team1) AS new_table1
    LEFT OUTER JOIN
    (SELECT team1, AVG(full_time_score_team1) AS goals_score_team1 FROM epl_matches GROUP BY team1) AS new_table2
    using(team1))
    LEFT OUTER JOIN
    ((SELECT team2, AVG(full_time_score_team1) AS conceded_score_team2 FROM epl_matches GROUP BY team2) AS new_table3
    LEFT OUTER JOIN
    (SELECT team2, AVG(full_time_score_team2) AS goals_score_team2 FROM epl_matches GROUP BY team2) AS new_table4
    using(team2))
    ON team1 = team2;
    


