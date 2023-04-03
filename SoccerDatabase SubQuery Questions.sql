# 1. From the following table, write a SQL query to find out which teams played the first match of the 2016 Euro Cup. 
-- Return match number, country name.
-- use tables match_details, soccer_country

# 2. From the following tables, write a SQL query to find the winner of EURO cup 2016. 
-- Return country name.
-- use tables soccer_country, match_details

# 3. From the following table, write a SQL query to find the highest audience match. 
-- Return match_no, play_stage, goal_score, audience.
-- use table match_mast

# 4. From the following tables, write a SQL query to find the match number in which Germany played against Poland. 
-- Group the result set on match number. 
-- Return match number.
-- use table match_details, soccer_country

# 5. From the following tables, write a SQL query to find the result of the match where Portugal played against Hungary. 
-- Return match_no, play_stage, play_date, results, goal_score.
-- use tables match_mast, match_details, soccer_country

# 6. Write a SQL query to find the players who scored the most goals in each match. 
-- Group the result set on match number, country name and player name. 
-- Sort the result-set in ascending order by match number. 
-- Return match number, country name, player name and number of matches.
-- use tables goal_details, soccer_country, player_mast

# 7. From the following tables, write a SQL query to find the highest audience match. 
-- Return country name of the teams.
-- use table soccer_country, goal_details, match_mast

# 8. Write a SQL query to find the player who scored the last goal for Portugal against Hungary. 
-- Return player name.
-- use tables player_mast, goal_details, match_details, soccer_country 

# 9. Write a SQL query to find the second-highest stoppage time in the second half.
-- Return Stoppage time.
-- use table match_mast

# 10. Write a SQL query to find the teams played the match where the second highest stoppage time had been added in the second half of play. 
-- Return country name of the teams.
-- use tables soccer_country, match_details, match_mast

# 11. Write a SQL query to find the teams played the match where second highest stoppage time had been added in second half of play. 
-- Return match_no, play_date, stop2_sec.
-- use table match_mast

# 12. From the following tables, write a SQL query to find the team, which was defeated by Portugal in EURO cup 2016 final. 
-- Return the country name of the team. 
-- use tables soccer_country, match_details

# 13. Write a SQL query to find the club, which supplied the most number of players to the 2016-EURO cup. 
-- Return club name, number of players. 
-- use table player_mast

# 14. From the following tables, write a SQL query to find the player who scored the first penalty of the tournament. 
-- Return player name and Jersey number.
-- use table player_mast, goal_details

# 15. From the following tables, write a SQL query to find the player who scored the first penalty in the tournament. 
-- Return player name, Jersey number and country name.
-- use table player_mast, goal_details, soccer_country

# 16. Write a SQL query to find the goalkeeper for Italy in penalty shootout against Germany in Football EURO cup 2016. 
-- Return goalkeeper name.
-- use table player_mast, penalty_gk, soccer_country

# 17. Write a SQL query to find the number of goals Germany scored at the tournament.
-- Return number of goals
-- use tables goal_details, soccer_country

# 18. Write a SQL query to find the players who were the goalkeepers of the England team that played in the 2016-EURO. 
-- Return player name, jersey number, club name
-- use tables player_mast, soccer_country

# 19. From the following table, write a SQL query to find the Liverpool players who were part of England's squad at the 2016 Euro Cup. 
-- Return player name, jersey number, position to play and age.
-- use tables player_mast, soccer_country

# 20. Write a SQL query to find the players who scored the last goal in the second semi-final, i.e., the 50th match of the 2016-EURO Cup. 
-- Return player name, goal time, goal half, country name.
-- use tables player_mast, goal_details, soccer_country

# 21. From the following table, write a SQL query to find out who was the captain of Portugal's winning EURO cup 2016 team. 
-- Return the captain name.
-- use tables player_mast, match_captain, match_details

# 22. From the following tables, write a SQL query to count the number of players played for 'France’ in the final. 
-- Return 'Number of players shared fields'.
-- use tables player_in_out, match_mast, soccer_country

# 23. Write a SQL query to find the Germany goalkeeper who did not concede any goals in their group stage matches. 
-- Return goalkeeper name, jersey number.
-- use tables player_mast, match_details, soccer_country

# 24. Write a SQL query to find the runners-up in Football EURO cup 2016.
-- Return country name.
-- use tables match_details, soccer_country

# 25. Write a SQL query to find the maximum penalty shots taken by the teams. 
-- Return country name, maximum penalty shots.
-- use tables soccer_country, penalty_shootout

# 26. Write a SQL query to find the maximum number of penalty shots taken by the players. 
-- Return country name, player name, jersey number and number of penalty shots.
-- use tables: player_mast, penalty_shootout, soccer_country

# 27. Write a SQL query to find the matches with the most penalty shots.
-- Return match number and no of shots
-- use tables: penalty_shootout

# 28. Write a SQL query to determine the match number where the most penalty shots were taken. 
-- Return match number, country name.
-- use table: penalty_shootout

# 29. Write a SQL query to find the player of ‘Portugal’ who took the seventh kick against ‘Poland’. 
-- Return match number, player name and kick number.
-- use tables: penalty_shootout, soccer_country

# 30. Write a SQL query to find the stage of the match where penalty kick number 23 was taken. 
-- Return match number, play_stage.
-- use tables: match_mast, penalty_shootout

# 31. Write a SQL query to find the venues where penalty shoot-out matches were played. 
-- Return venue name.
-- use tables: soccer_venue, match_mast, penalty_shootout

# 32. Write a SQL query to find out when the penalty shootout matches were played. 
-- Return playing date.
-- use tables: match_mast, penalty_shootout

# 33. Write a SQL query to find the fastest goal at the EURO cup 2016, after 5 minutes. 
-- Return 'Quickest goal after 5 minutes'.
-- use tables: goal_details

