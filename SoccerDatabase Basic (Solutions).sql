# 1. From the following table, write a SQL query to count the number of venues for EURO cup 2016. Return number of venues.
-- use table soccer_venue

SELECT COUNT(venue_id) 
FROM soccer_venue;

# 2. From the following table, write a SQL query to count the number of countries that participated in the 2016-EURO Cup.
-- use table player_mast

SELECT COUNT(DISTINCT team_id)
FROM player_mast;

# 3. From the following table, write a SQL query to find the number of goals scored within normal play during the EURO cup 2016.
-- use table goal_details

SELECT * FROM goal_details;

SELECT COUNT(*)
FROM goal_details;

# 4. From the following table, write a SQL query to find the number of matches that ended with a result.
-- use table match_mast

select * from match_mast;

select count(results)
from match_mast
where results = 'WIN';

# 5. From the following table, write a SQL query to find the number of matches that ended in draws.
-- use table match_mast

select * from match_mast;

select count(results)
from match_mast
where results = 'DRAW';

# 6. From the following table, write a SQL query to find out when the Football EURO cup 2016 will begin.
-- use table match_mast

select play_date
from match_mast
where match_no = 1;

# 7. From the following table, write a SQL query to find the number of self-goals scored during the 2016 European Championship.
-- use table goal_details

select * from goal_details;

select count(goal_type)
from goal_details
where goal_type = 'O';

# 8. From the following table, write a SQL query to count the number of matches ended with a results in-group stage.
-- use table match_mast

select * from match_mast;

select count(match_no)
from match_mast
where play_stage = 'G' and results = 'WIN';

# 9. From the following table, write a SQL query to find the number of matches that resulted in a penalty shootout.
-- use table penalty_shootout

select * from penalty_shootout;

select count(distinct match_no)
from penalty_shootout;

# 10. From the following table, write a SQL query to find number of matches decided by penalties in the Round 16.
-- use table match_mast

select * from match_mast;

select count(match_no)
from match_mast
where play_stage = 'R' and decided_by = 'P';

# 11. From the following table, write a SQL query to find the number of goals scored in every match within a normal play schedule. 
-- Sort the result-set on match number. Return match number, number of goal scored.
-- use table goal_details

select * from goal_details;

select match_no, count(goal_id)
from goal_details
group by match_no
order by match_no;


# 12. From the following table, write a SQL query to find the matches in which no stoppage time was added during the first half of play. 
-- Return match no, date of play, and goal scored.
-- use table match_mast

select * from match_mast;

select match_no, play_date, goal_score
from match_mast
where stop1_sec = 0;

# 13. From the following table, write a SQL query to count the number of matches that ended in a goalless draw at the group stage. 
-- Return number of matches.
-- use table match_details

select * from match_details;

select count(distinct match_no)
from match_details
where win_lose = 'D' and goal_score = 0;

# 14. From the following table, write a SQL query to calculate the number of matches that ended in a single goal win, 
-- excluding matches decided by penalty shootouts. 
-- Return number of matches.
-- use table match_details

select * from match_details;

select count(distinct match_no)
from match_details
where win_lose = 'W' and goal_score = 1 and decided_by = 'N';

# 15. From the following table, write a SQL query to count the number of players replaced in the tournament. 
-- Return number of players as "Player Replaced".
-- use table player_in_out

select * from player_in_out;

select count(in_out)
from player_in_out
where in_out = 'I';


# 16. From the following table, write a SQL query to count the total number of players replaced during normal playtime. 
-- Return number of players as "Player Replaced".
-- use table player_in_out

select * from player_in_out;

select count(in_out)
from player_in_out
where in_out = 'I' and play_schedule = 'NT';

# 17. From the following table, write a SQL query to count the number of players who were replaced during the stoppage time. 
-- Return number of players as "Player Replaced".
-- use table player_in_out

select * from player_in_out;

select count(in_out)
from player_in_out
where in_out = 'I' and play_schedule = 'ST';

# 18. From the following table, write a SQL query to count the number of players who were replaced during the first half. 
-- Return number of players as "Player Replaced". 
-- use table player_in_out

select * from player_in_out;

select count(in_out)
from player_in_out
where in_out = 'I' and play_half = 1 and play_schedule = 'NT';

# 19. From the following table, write a SQL query to count the total number of goalless draws played in the entire tournament. 
-- Return number of goalless draws.
-- use table match_details

select * from match_details;

select count(distinct match_no)
from match_details
where win_lose = 'D' and goal_score = 0;


# 20. From the following table, write a SQL query to calculate the total number of players who were replaced during the extra time.
-- use table player_in_out

select * from player_in_out;

select count(in_out)
from player_in_out
where in_out = 'I' and play_schedule = 'ET';

# 21. From the following table, write a SQL query to count the number of substitutes during various stages of the tournament. 
-- Sort the result-set in ascending order by play-half, play-schedule and number of substitute happened. 
-- Return play-half, play-schedule, number of substitute happened. 
-- use table player_in_out

select * from player_in_out;

select play_half, play_schedule, count(in_out) as no_of_substitutes
from player_in_out
where in_out = 'O' 
group by play_half, play_schedule
order by play_half, play_schedule, no_of_substitutes;

# 22. From the following table, write a SQL query to count the number of shots taken in penalty shootouts matches. 
-- Number of shots as "Number of Penalty Kicks".
-- use table penalty_shootout

select * from penalty_shootout;

select count(kick_id) as number_of_penalty_kicks
from penalty_shootout;

# 23. From the following table, write a SQL query to count the number of shots that were scored in penalty shootouts matches. 
-- Return number of shots scored goal as "Goal Scored by Penalty Kicks".
-- use table penalty_shootout

select * from penalty_shootout;

select count(kick_id) as Goal_Scored_by_penalty_kicks
from penalty_shootout
where score_goal = 'Y';

# 24. From the following table, write a SQL query to count the number of shots missed or saved in penalty shootout matches. 
-- Return number of shots missed as "Goal missed or saved by Penalty Kicks".
-- use table penalty_shootout

select * from penalty_shootout;

select count(kick_id) as Goal_missed_or_saved
from penalty_shootout
where score_goal = 'N';

# 25. From the following table, write a SQL query to find the players with shot numbers they took in penalty shootout matches. 
-- Return match_no, Team, player_name, jersey_no, score_goal, kick_no.
-- use table soccer_country, penalty_shootout, player_mast

select * from soccer_country;
select * from penalty_shootout;
select * from player_mast;

select ps.match_no, sc.country_name, pm.player_name, pm.jersey_no, ps.score_goal, ps.kick_no
from soccer_country as sc
join penalty_shootout as ps on sc.country_id = ps.team_id
join player_mast as pm on ps.player_id = pm.player_id;

# 26. From the following table, write a SQL query to count the number of penalty shots taken by each team. 
-- Return country name, number of shots as "Number of Shots".
-- use table soccer-country, penalty_shootout

select * from soccer_country;
select * from penalty_shootout;

select sc.country_name, count(ps.kick_id)
from soccer_country as sc
join penalty_shootout as ps on sc.country_id = ps.team_id
group by sc.country_name;

# 27. From the following table, write a SQL query to count the number of bookings in each half of play within the normal play schedule. 
-- Return play_half, play_schedule, number of booking happened.
-- use table player_booked

select * from player_booked;

select play_half, play_schedule, count(player_id)
from player_booked
where play_schedule = 'NT'
group by play_half, play_schedule;

# 28. From the following table, write a SQL query to count the number of bookings during stoppage time.
-- use table player_booked

select * from player_booked;

select count(player_id)
from player_booked 
where play_schedule = 'ST';

# 29. From the following table, write a SQL query to count the number of bookings that happened in extra time.
-- use table player_booked

SELECT COUNT(player_id)
FROM player_booked
WHERE play_schedule = 'ET';
