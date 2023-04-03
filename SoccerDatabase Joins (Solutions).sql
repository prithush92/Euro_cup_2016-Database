use soccerdatabase;

# 1. From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played. 
-- Return venue name, city.
-- use tables: soccer_venue, soccer_city, match_mast

select * from soccer_venue;
select * FROM soccer_city;
SELECT * FROM match_mast; 

select sv.venue_name as venue_name, sc.city as city
from match_mast as m
join soccer_venue as sv on m.venue_id = sv.venue_id
join soccer_city as sc on sv.city_id = sc.city_id
where m.play_stage = 'F';


# 2. From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play. 
-- Return match number, country name and goal score. 
-- use tables: match_details, soccer_country

select * from match_details; 
select * from soccer_country;

select md.match_no, sc.country_name, md.goal_score
from match_details as md
join soccer_country as sc on md.team_id = sc.country_id
where md.decided_by = 'N'
order by md.match_no;

# 3. From the following table, write a SQL query to count the number of goals scored by each player within a normal play schedule. 
-- Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. 
-- Return player name, number of goals and country name.
-- use tables: goal_details, player_mast, soccer_country 

select * from goal_details;
select * from player_mast;
select * from soccer_country;

select pm.player_name, count(gd.goal_id) as no_of_goals, sc.country_name
from goal_details as gd
join player_mast as pm on gd.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where gd.goal_schedule = 'NT' 
group by pm.player_name, sc.country_name
order by count(gd.goal_id) desc;

# 4. From the following table, write a SQL query to find out who scored the most goals in the 2016 Euro Cup. 
-- Return player name, country name and highest individual scorer. 
-- use tables: goal_details, player_mast, soccer_country 

select * from goal_details;
select * from player_mast;
select * from soccer_country;

select pm.player_name, sc.country_name, count(gd.goal_id) as max_goals
from goal_details as gd
join player_mast as pm on gd.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
group by pm.player_name, sc.country_name
order by count(gd.goal_id) desc
limit 1;

# 5. From the following table, write a SQL query to find out who scored in the final of the 2016 Euro Cup. 
-- Return player name, jersey number and country name.
-- use tables: goal_details, player_mast, soccer_country

select * from goal_details;
select * from player_mast;
select * from soccer_country;

select pm.player_name, pm.jersey_no, sc.country_name
from goal_details as gd
join player_mast as pm on gd.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where gd.play_stage = 'F';


# 6. From the following tables, write a SQL query to find out which country hosted the 2016 Football EURO Cup. 
-- Return country name.
-- use tables: soccer_country, soccer_city, soccer_venue

select * from soccer_country;
select * from soccer_city;
select * from soccer_venue;

select distinct sc.country_name
from soccer_country as sc
join soccer_city as scity on sc.country_id = scity.country_id
join soccer_venue as sv on scity.city_id = sv.city_id
where sv.city_id = scity.city_id and scity.country_id = sc.country_id;


# 7. From the following tables, write a SQL query to find out who scored the first goal of the 2016 European Championship. 
-- Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half.
-- use tables: soccer_country, player_mast, goal_details

select * from soccer_country;
select * from player_mast;
SELECT * from goal_details;

select pm.player_name, pm.jersey_no, sc.country_name, gd.goal_time, gd.play_stage, gd.goal_schedule, gd.goal_half
from soccer_country as sc
join player_mast as pm on sc.country_id = pm.team_id
join goal_details as gd on pm.player_id = gd.player_id
where goal_id = 1;

# 8. From the following tables, write a SQL query to find the referee who managed the opening match. 
-- Return referee name, country name.
-- use tables: soccer_country, match_mast, referee_mast

select * from soccer_country;
select * from match_mast;
select * from referee_mast;

select rm.referee_name, sc.country_name
from soccer_country as sc
join referee_mast as rm on sc.country_id = rm.country_id
join match_mast as mm on rm.referee_id = mm.referee_id
where mm.match_no = 1;

# 9. From the following tables, write a SQL query to find the referee who managed the final match. 
-- Return referee name, country name.
-- use tables: soccer_country, match_mast, referee_mast

select * from soccer_country;
select * from match_mast;
select * from referee_mast; 

select rm.referee_name, sc.country_name
from soccer_country as sc
join referee_mast as rm on sc.country_id = rm.country_id
join match_mast as mm on rm.referee_id = mm.referee_id
where mm.play_stage = 'F';

# 10. From the following tables, write a SQL query to find the referee who assisted the referee in the opening match. 
-- Return associated referee name, country name.
-- use tables: asst_referee_mast, soccer_country, match_details

select * from asst_referee_mast;
select * from soccer_country;
select * from match_details;

select arm.ass_ref_name, sc.country_name
from asst_referee_mast as arm
join soccer_country as sc on arm.country_id = sc.country_id
join match_details as md on arm.ass_ref_id = md.ass_ref
where md.match_no = 1;


# 11. From the following tables, write a SQL query to find the referee who assisted the referee in the final match. 
-- Return associated referee name, country name.
-- use tables: asst_referee_mast, soccer_country, match_details

select * from asst_referee_mast;
select * from soccer_country;
select * from match_details;

select arm.ass_ref_name, sc.country_name
from asst_referee_mast as arm
join soccer_country as sc on arm.country_id = sc.country_id
join match_details as md on arm.ass_ref_id = md.ass_ref
where md.play_stage = 'F';

# 12. From the following table, write a SQL query to find the city where the opening match of EURO cup 2016 took place. 
-- Return venue name, city.
-- use tables: soccer_venue, soccer_city, match_mast

select * from soccer_venue;
select * from soccer_city;
select * from match_mast;

select sv.venue_name, sc.city
from soccer_venue as sv
join soccer_city as sc on sv.city_id = sc.city_id
join match_mast as mm on sv.venue_id = mm.venue_id
where mm.match_no = 1;

# 13. From the following tables, write a SQL query to find out which stadium hosted the final match of the 2016 Euro Cup. 
-- Return venue_name, city, aud_capacity, audience.
-- use tables: soccer_venue, soccer_city, match_mast

select * from soccer_venue;
select * from soccer_city;
select * from match_mast;

select sv.venue_name, sc.city, sv.aud_capacity, mm.audence
from soccer_venue as sv
join soccer_city as sc on sv.city_id = sc.city_id
join match_mast as mm on sv.venue_id = mm.venue_id
where mm.play_stage = 'F';

# 14. From the following tables, write a SQL query to count the number of matches played at each venue. 
-- Sort the result-set on venue name. 
-- Return Venue name, city, and number of matches.
-- use tables: soccer_venue, soccer_city, match_mast

select * from soccer_venue;
select * from soccer_city;
select * from match_mast;

select sv.venue_name, sc.city, count(mm.match_no) as no_of_matches
from soccer_venue as sv
join soccer_city as sc on sv.city_id = sc.city_id
join match_mast as mm on sv.venue_id = mm.venue_id
group by sv.venue_name, sc.city
order by sv.venue_name;


# 15. From the following tables, write a SQL query to find the player who was the first player to be sent off at the tournament EURO cup 2016. 
-- Return match Number, country name and player name.
-- use tables: player_booked, player_mast, soccer_country

select * from player_booked;
select * from player_mast;
select * from soccer_country;

select pb.match_no, sc.country_name, pm.player_name
from player_booked as pb
join player_mast as pm on pb.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where pb.match_no = 1 and pb.sent_off = 'Y';

# 16. From the following tables, write a SQL query to find the teams that have scored one goal in the tournament. 
-- Return country_name as "Team", team in the group, goal_for.
-- use tables: soccer_team, soccer_country

SELECT * from soccer_team;
select * from soccer_country;

select sc.country_name as Team, st.team_group, st.goal_for
from soccer_team as st
join soccer_country as sc on st.team_id = sc.country_id
where st.goal_for = 1;


# 17. From the following tables, write a SQL query to count the number of yellow cards each country has received. 
-- Return country name and number of yellow cards.
-- order the table by number of yellow cards in descending order
-- use tables: soccer_country, player_booked

select * from soccer_country;
select * from player_booked;

select sc.country_name, count(*) as no_yellow_cards
from soccer_country as sc
join player_booked as pb on sc.country_id = pb.team_id
group by sc.country_name
order by count(*) desc;

# 18. From the following tables, write a SQL query to count the number of goals that have been seen. 
-- Return venue name and number of goals.
-- use tables: soccer_country, goal_details, match_mast, soccer_venue

select * from soccer_country;
select * from goal_details;
select * from match_mast;
select * from soccer_venue;

select sv.venue_name, count(goal_id) as no_of_goals
from soccer_country as sc
join goal_details as gd on sc.country_id = gd.team_id
join match_mast as mm on gd.match_no = mm.match_no
join soccer_venue as sv on mm.venue_id = sv.venue_id
group by sv.venue_name;


# 19. From the following tables, write a SQL query to find the match where there was no stoppage time in the first half. 
-- Return match number, country name.
-- use tables: match_details, match_mast, soccer_country

select * from match_details;
select * from match_mast;
select * from soccer_country;

select mm.match_no, sc.country_name
from match_details as md
join match_mast as mm on md.match_no = mm.match_no
join soccer_country as sc on md.team_id = sc.country_id
where stop1_sec = 0;


# 20. From the following tables, write a SQL query to find the team(s) who conceded the most goals in EURO cup 2016. 
-- Return country name, team group and match played.
-- use tables: soccer_team, soccer_country

select * from soccer_team;
select * from soccer_country;

select sc.country_name, st.team_group, st.match_played
from soccer_team as st
join soccer_country as sc on st.team_id = sc.country_id
order by st.goal_agnst desc
limit 1;

# 21. From the following tables, write a SQL query to find those matches where the highest stoppage time was added in 2nd half of play. 
-- Return match number, country name, stoppage time(sec.).
-- use tables: match_details, match_mast, soccer_country

select * from match_details;
select * from match_mast;
select * from soccer_country;

-- METHOD 1 (using order by and limit)
-- ----------------------------------------------------------
select mm.match_no, sc.country_name, mm.stop2_sec
from match_details as md
join match_mast as mm on md.match_no = mm.match_no
join soccer_country as sc on md.team_id = sc.country_id 
order by mm.stop2_sec desc
limit 2;
-- ----------------------------------------------------------

-- METHOD 2 (using subquery)
select mm.match_no, sc.country_name, mm.stop2_sec
from match_details as md
join match_mast as mm on md.match_no = mm.match_no
join soccer_country as sc on md.team_id = sc.country_id 
where mm.stop2_sec in (select max(stop2_sec) from match_mast);


# 22. From the following tables, write a SQL query to find the matches that ended in a goalless draw at the group stage. 
-- Return match number, country name.
-- use tables: match_details, soccer_country

select * from match_details;
select * from soccer_country;

select md.match_no, sc.country_name
from match_details as md
join soccer_country as sc on md.team_id = sc.country_id
where md.win_lose = 'D' and md.goal_score = 0 and md.play_stage = 'G';

# #########################################################################################################################################################################
# 23(IMP). From the following tables, write a SQL query to find those match(s) where the second highest amount of stoppage time was added in the second half of the match. 
-- Return match number, country name and stoppage time.
-- use tables: match_mast, match_details, soccer_country
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from match_mast;
select * from match_details;
select * from soccer_country;

-- METHOD 1 (Circumstantial)
select mm.match_no, sc.country_name, stop2_sec
from match_mast as mm 
join match_details as md on mm.match_no = md.match_no
join soccer_country as sc on md.team_id = sc.country_id
order by stop2_sec desc
limit 2
offset 2;

-- -------------------------------------------------------------------------------------------------------
-- METHOD 2 (Correct) (Using Subquery)

select mm.match_no, sc.country_name, stop2_sec
from match_mast as mm 
join match_details as md on mm.match_no = md.match_no
join soccer_country as sc on md.team_id = sc.country_id
where stop2_sec in (select max(stop2_sec) 
					from match_mast 
					where stop2_sec < (select max(stop2_sec) from match_mast));
                    
-- -------------------------------------------------------------------------------------------------------
-- subquery to find second highest stop2_sec
select max(stop2_sec) 
from match_mast 
where stop2_sec < (select max(stop2_sec) from match_mast);

# ###################################################################################################################################


# 24. From the following tables, write a SQL query to find the number of matches played by a player as a goalkeeper for his team. 
-- Return country name, player name, number of matches played as a goalkeeper.
-- use tables: player_mast, match_details, soccer_country

select * from player_mast;
select * from match_details;
select * from soccer_country;

select sc.country_name, pm.player_name, count(distinct md.match_no) as no_of_matches
from player_mast as pm
join soccer_country as sc on pm.team_id = sc.country_id
join match_details as md on pm.player_id = md.player_gk
where pm.posi_to_play = 'GK'
group by sc.country_name, pm.player_name;

# #######################################################################################################################################
# 25(IMP). From the following tables, write a SQL query to find the venue where the most goals have been scored. 
-- Return venue name, number of goals.
-- use tables: goal_details, soccer_country, match_mast, soccer_venue
-- ---------------------------------------------------------------------------------------------------------------------------------------
select * from goal_details;
select * from soccer_country;
select * from match_mast;
select * from soccer_venue;

-- Method 1 (Circumstantial)
select sv.venue_name, count(gd.goal_id)
from goal_details as gd
join soccer_country as sc on gd.team_id = sc.country_id
join match_mast as mm on gd.match_no = mm.match_no
join soccer_venue as sv on mm.venue_id = sv.venue_id
group by sv.venue_name
order by count(gd.goal_id) desc
limit 1;


-- -----------------------------------------------------------------------------------------------------------------
-- Method 2 (Correct) (Using Subquery)
select sv.venue_name, count(gd.goal_id) as no_of_goals
from goal_details as gd
join soccer_country as sc on gd.team_id = sc.country_id
join match_mast as mm on gd.match_no = mm.match_no
join soccer_venue as sv on mm.venue_id = sv.venue_id
group by sv.venue_name
having no_of_goals >= all(select count(gd.goal_id)
							from goal_details as gd
							join soccer_country as sc on gd.team_id = sc.country_id
							join match_mast as mm on gd.match_no = mm.match_no
							join soccer_venue as sv on mm.venue_id = sv.venue_id
							group by sv.venue_name);

-- -----------------------------------------------------------------------------------------------------------------
-- subquery to get all count(goal_id) when group by venue_name
select count(gd.goal_id)
from goal_details as gd
join soccer_country as sc on gd.team_id = sc.country_id
join match_mast as mm on gd.match_no = mm.match_no
join soccer_venue as sv on mm.venue_id = sv.venue_id
group by sv.venue_name;

# #####################################################################################################################################
# 26. From the following tables, write a SQL query to find the oldest player to have appeared in a EURO 2016 match. 
-- Return country name, player name, jersey number and age.
-- use tables: player_mast, soccer_country

select * from player_mast;
select * from soccer_country;

select sc.country_name, pm.player_name, pm.jersey_no, pm.age
from player_mast as pm
join soccer_country as sc on pm.team_id = sc.country_id
where pm.age in (select max(age) from player_mast);

# 27. From the following tables, write a SQL query to find the two teams in this tournament that have scored three goals in a single game. 
-- Return match number and country name.
-- use tables: match_details, soccer_country

select * from match_details;
select * from soccer_country;

select md.match_no, sc.country_name
from match_details as md
join soccer_country as sc on md.team_id = sc.country_id
where md.goal_score = 3 and md.win_lose = 'D';

# 28. From the following tables, write a SQL query to find which teams finished at the bottom of their respective groups after conceding four goals in three games. 
-- Return country name, team group and match played.
-- use tables: soccer_team, soccer_country

select * from soccer_team;
select * from soccer_country;

select sc.country_name, st.team_group, st.match_played
from soccer_team as st
join soccer_country as sc on st.team_id = sc.country_id
where st.goal_agnst = 4 and st.group_position in (select max(group_position) from soccer_team);

# 29. From the following tables, write a SQL query to find those players, who were contracted to the Lyon club and participated in the final of the EURO cup 2016. 
-- Return player name, jerseyno, position to play, age, and country name.
-- use tables: player_mast, soccer_country, match_details

select * from player_mast;
select * from soccer_country;
select * from match_details;

select pm.player_name, pm.jersey_no, pm.posi_to_play, pm.age, sc.country_name
from player_mast as pm 
join soccer_country as sc on pm.team_id = sc.country_id
join match_details as md on sc.country_id = md.team_id
where pm.playing_club = 'Lyon' and md.play_stage = 'F';

# 30. From the following tables, write a SQL query to find the final four teams in the tournament. 
-- Return country name.
-- use tables: soccer_country, match_details

select * from soccer_country;
select * from match_details;

select sc.country_name
from soccer_country as sc
join match_details as md on md.team_id = sc.country_id
where md.play_stage = 'S';

# 31. From the following tables, write a SQL query to find the captains of the top four teams that competed in the semi-finals (matches 48 and 49) of the tournament. 
-- Return country name, player name, jersey number and position to play.
-- use tables: soccer_country, match_captain, player_mast

select * from soccer_country;
select * from match_captain;
select * from player_mast;

select sc.country_name, pm.player_name, pm.jersey_no, pm.posi_to_play
from soccer_country as sc
join match_captain as mc on sc.country_id = mc.team_id
join player_mast as pm on mc.player_captain = pm.player_id
where mc.match_no = 48 or mc.match_no = 49;


# 32. From the following tables, write a SQL query to find the captains of all the matches in the tournament. 
-- Return match number, country name, player name, jersey number and position to play.
-- use tables: soccer_country, match_captain, player_mast

select * from soccer_country;
select * from match_captain;
select * from player_mast;

select mc.match_no, sc.country_name, pm.player_name, pm.jersey_no, pm.posi_to_play
from soccer_country as sc
join match_captain as mc on sc.country_id = mc.team_id
join player_mast as pm on mc.player_captain = pm.player_id
order by mc.match_no;

-- --------------------------------------------------------------------------------------------------------
# 33(IMP). From the following tables, write a SQL query to find the captain and goalkeeper of all the matches. 
-- Return match number, Captain, Goal Keeper and country name.
-- use tables: soccer_country, match_captain, match_details, player_mast
-- --------------------------------------------------------------------------------------------------------

select * from soccer_country;
select * from match_captain;
select * from match_details;
select * from player_mast; 


SELECT a.match_no,c.player_name as "Captain", 
d.player_name as "Goal Keeper",e.country_name
FROM match_captain a
NATURAL JOIN match_details b
JOIN soccer_country e ON b.team_id=e.country_id
JOIN player_mast c ON a.player_captain=c.player_id
JOIN player_mast d ON b.player_gk=d.player_id;


# 34. From the following table, write a SQL query to find out the player who was selected for the ‘Man of the Match’ award in the finals of EURO cup 2016. 
-- Return player name, country name.
-- use tables: soccer_country, match_mast, player_mast

select * from soccer_country;
select * from match_mast;
select * from player_mast;

select pm.player_name, sc.country_name
from soccer_country as sc
join player_mast as pm on sc.country_id = pm.team_id
join match_mast as mm on pm.player_id = mm.plr_of_match
where mm.play_stage = 'F';

# 35. Write a SQL query to find the substitute players who entered the field during the first half of play within the normal time frame for the game. 
-- Return match_no, country_name, player_name, jersey_no and time_in_out.
-- use tables: player_in_out, player_mast, soccer_country

select * from player_in_out;
select * from player_mast;
select * from soccer_country;

select pio.match_no, sc.country_name, pm.player_name, pm.jersey_no, pio.time_in_out
from soccer_country as sc
join player_mast as pm on sc.country_id = pm.team_id
join player_in_out as pio on pm.player_id = pio.player_id
where pio.play_schedule = 'NT' and pio.play_half = 1 and pio.in_out = 'I'; 

# 36. From the following table, write a SQL query to prepare a list for the “player of the match” against each match. 
-- Return match number, play date, country name, player of the Match, jersey number.
-- use tables: match_mast, player_mast, soccer_country

select * from match_mast;
select * from player_mast;
select * from soccer_country;

select mm.match_no, mm.play_date, sc.country_name, pm.player_name as Player_of_Match, pm.jersey_no
from match_mast as mm
join player_mast as pm on mm.plr_of_match = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
order by mm.match_no;

# 37. From the following tables, write a SQL query to find the player who took the penalty shot number 26. 
-- Return match number, country name, player name.
-- use tables: penalty_shootout, player_mast, soccer_country

select * from penalty_shootout;
select * from player_mast;
select * from soccer_country;

select ps.match_no, sc.country_name, pm.player_name
from penalty_shootout as ps 
join player_mast as pm on ps.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where ps.kick_id = 26;

-- ---------------------------------------------------------------------------------------------------------------------
# 38(IMP). From the following tables, write a SQL query to find the team against which the penalty shot number 26 was taken. 
-- Return match number, country name.
-- use tables: penalty_shootout, soccer_country
-- ---------------------------------------------------------------------------------------------------------------------

select * from penalty_shootout;
select * from soccer_country;

select distinct ps.match_no, sc.country_name
from penalty_shootout as ps
join soccer_country as sc on ps.team_id = sc.country_id
where 
ps.match_no in (select match_no from penalty_shootout where kick_id = 26) 
and 
sc.country_id not in (select country_id from soccer_country join penalty_shootout on penalty_shootout.team_id = soccer_country.country_id where kick_id = 26);

# 39. From the following tables, write a SQL query to find the captain who was also the goalkeeper. 
-- Return match number, country name, player name and jersey number.
-- use tables: match_captain, soccer_country, player_mast

select * from match_captain;
select * from soccer_country;
select * from player_mast;

select mc.match_no, sc.country_name, pm.player_name, pm.jersey_no
from match_captain as mc
join player_mast as pm on mc.player_captain = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where pm.posi_to_play = 'GK';

# 40. From the following tables, write a SQL query to find the number of captains who was also the goalkeeper. 
-- Return number of captains.
-- use tables: match_captain, player_mast, soccer_country

select * from match_captain;
select * from soccer_country;
select * from player_mast;

select count(distinct player_name)
from match_captain as mc
join player_mast as pm on mc.player_captain = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where pm.posi_to_play = 'GK';


# 41. From the following tables, write a SQL query to find out how many times a player had been booked in the tournament. 
-- Show the result according to the team and number of times booked in descending order. 
-- Return country name, player name, and booked number of times.
-- use tables: soccer_country, player_booked, player_mast

select * from soccer_country;
select * from player_booked;
select * from player_mast;

select sc.country_name, pm.player_name, count(pb.player_id) as no_of_times_booked
from player_booked as pb
join player_mast as pm on pb.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
group by sc.country_name, pm.player_name;

-- ---------------------------------------------------------------------------------------------------------------
# 42. From the following tables, write a SQL query to count the players who booked the most number of times. 
-- Return player name, number of players who booked most number of times.
-- use tables: soccer_country, player_booked, player_mast
-- ---------------------------------------------------------------------------------------------------------------

select * from soccer_country;
select * from player_booked;
select * from player_mast;

select pm.player_name, count(pb.player_id) as most_booked
from player_booked as pb
join player_mast as pm on pb.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
group by pm.player_name
order by most_booked desc
limit 3;

# 43. From the following tables, write a SQL query to find out how many players each team has booked. 
-- Return country name, number of players booked. 
-- use tables: soccer_country, player_booked

select * from soccer_country;
select * from player_booked;

select sc.country_name, count(pb.player_id) as no_of_players_booked
from soccer_country as sc
join player_booked as pb on sc.country_id = pb.team_id
group by sc.country_name;

-- ----------------------------------------------------------------------------------------------------------
# 44. From the following tables, write a SQL query to find the matches in which the most cards are displayed. 
-- Return match number, number of cards shown.
-- use tables: soccer_country, player_booked, player_mast
-- ----------------------------------------------------------------------------------------------------------
select * from soccer_country;
select * from player_booked;
select * from player_mast;

select pb.match_no, count(pb.player_id) as cards_shown
from soccer_country as sc
join player_mast as pm on sc.country_id = pm.team_id
join player_booked as pb on pm.player_id = pb.player_id
group by pb.match_no
order by cards_shown desc
limit 1;

# 45. From the following table, write a SQL query to find the assistant referees. 
-- Return match number, country name, assistant referee name.
-- use tables: match_details, asst_referee_mast, soccer_country

select * from match_details;
select * from asst_referee_mast;
select * from soccer_country;

select md.match_no, sc.country_name, arm.ass_ref_name
from match_details as md 
join asst_referee_mast as arm on md.ass_ref = arm.ass_ref_id
join soccer_country as sc on arm.country_id = sc.country_id
order by md.match_no;

# 46. From the following table, write a SQL query to find the assistant referees of each country assist the number of matches. 
-- Sort the result-set in descending order on number of matches.
-- Return country name, number of matches.
-- use tables: match_details, asst_referee_mast, soccer_country

select * from match_details;
select * from asst_referee_mast;
select * from soccer_country;

select sc.country_name, count(distinct(md.match_no)) as no_of_matches
from match_details as md 
join asst_referee_mast as arm on md.ass_ref = arm.ass_ref_id
join soccer_country as sc on arm.country_id = sc.country_id
group by sc.country_name
order by no_of_matches desc;

# #################################################################################################################################
# 47(IMP). From the following table, write a SQL query to find the countries from where the assistant referees assist most of the matches. 
-- Return country name and number of matches.
-- use tables: match_details, asst_referee_mast, soccer_country
-- -----------------------------------------------------------------------------------------------------------------------------------

select * from match_details;
select * from asst_referee_mast;
select * from soccer_country;

select sc.country_name, count(distinct(match_no)) as no_of_matches
from match_details as md 
join asst_referee_mast as arm on md.ass_ref = arm.ass_ref_id
join soccer_country as sc on arm.country_id = sc.country_id
group by sc.country_name
order by no_of_matches desc
limit 1;

-- --------------------------------------------------------------------------------------------------------------------
select country_name, count(distinct match_no) 
from asst_referee_mast ar 
join soccer_country sc on ar.country_id=sc.country_id 
join match_details md on ar.ass_ref_id=md.ass_ref 
group by country_name 
having count(distinct match_no) >= all(select count(distinct match_no) 
										from asst_referee_mast ar 
										join soccer_country sc on ar.country_id=sc.country_id 
                                        join match_details md on ar.ass_ref_id=md.ass_ref 
                                        group by country_name);
-- --------------------------------------------------------------------------------------------------------------------
-- subquery to find count(distinct match_no) when group by country_name
select count(distinct match_no) 
from asst_referee_mast ar 
join soccer_country sc on ar.country_id=sc.country_id 
join match_details md on ar.ass_ref_id=md.ass_ref 
group by country_name;

# #################################################################################################################################
# 48. From the following table, write a SQL query to find the name of referees for each match. 
-- Sort the result-set on match number. 
-- Return match number, country name, referee name.
-- use tables: match_mast, referee_mast, soccer_country

select * from match_mast;
select * from referee_mast; 
select * from soccer_country;

select mm.match_no, sc.country_name, rm.referee_name
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id;

# 49. From the following tables, write a SQL query to count the number of matches managed by referees of each country.
-- Return country name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country

select * from match_mast;
select * from referee_mast; 
select * from soccer_country;

select sc.country_name, count(mm.match_no) as no_of_matches
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id
group by sc.country_name
order by no_of_matches desc;

# #################################################################################################################################
# 50(IMP). From the following tables, write a SQL query to find the countries from where the referees managed most of the matches. 
-- Return country name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country
-- -------------------------------------------------------------------------------------------------------------------------------
select * from match_mast;
select * from referee_mast; 
select * from soccer_country;

select sc.country_name, count(mm.match_no) as no_of_matches
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id
group by sc.country_name
order by no_of_matches desc
limit 1;

-- ------------------------------------------------------------------------------------------------------------------------------
select country_name,count(match_no) 
from match_mast mm 
join referee_mast rm on mm.referee_id=rm.referee_id 
join soccer_country sc on sc.country_id=rm.country_id 
group by country_name 
having count(match_no) >= all(select count(match_no) 
								from match_mast mm 
                                join referee_mast rm on mm.referee_id=rm.referee_id 
                                join soccer_country sc on sc.country_id=rm.country_id 
                                group by country_name);

-- ------------------------------------------------------------------------------------------------------------------------------
-- subquery which gives count(match_no) when group by country_name
select count(match_no) 
from match_mast mm 
join referee_mast rm on mm.referee_id=rm.referee_id 
join soccer_country sc on sc.country_id=rm.country_id 
group by sc.country_name;
# #################################################################################################################################


# 51. From the following tables, write a SQL query to find the number of matches managed by each referee. 
-- Return referee name, country name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country

select * from match_mast;
select * from referee_mast; 
select * from soccer_country;

select rm.referee_name, sc.country_name, count(mm.match_no) as no_of_matches
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id
group by rm.referee_name, sc.country_name
order by no_of_matches desc;


# #################################################################################################################################
# 52(IMP). From the following tables, write a SQL query to find those referees who managed most of the matches. 
-- Return referee name, country name and number of matches.
-- use tables: match_mast, referee_mast, soccer_country
-- ----------------------------------------------------------------------------------------------------------
select * from match_mast;
select * from referee_mast; 
select * from soccer_country;

select rm.referee_name, sc.country_name, count(mm.match_no) as no_of_matches
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id
group by rm.referee_name, sc.country_name
order by no_of_matches desc
limit 3;

-- ---------------------------------------------------------------------------------------------------------------------------------
select rm.referee_name, sc.country_name, count(mm.match_no) as no_of_matches
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id
group by rm.referee_name, sc.country_name
having no_of_matches >= all(select count(match_no) 
							from match_mast mm 
							join referee_mast rm on mm.referee_id=rm.referee_id 
                            join soccer_country sc on sc.country_id=rm.country_id 
                            group by country_name, referee_name);
-- ------------------------------------------------------------------------------------------------------------------------------------

-- subquery which gives count(match_no) when group by country_name, referee_name
select count(match_no) 
from match_mast mm 
join referee_mast rm on mm.referee_id=rm.referee_id 
join soccer_country sc on sc.country_id=rm.country_id 
group by country_name, referee_name;
# #################################################################################################################################


# 53. From the following tables, write a SQL query to find those referees who managed the number of matches at each venue. 
-- Return referee name, country name, venue name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country, soccer_venue

select * from match_mast;
select * from referee_mast;
select * from soccer_country;
select * from soccer_venue;

select rm.referee_name, sc.country_name, sv.venue_name, count(mm.match_no) as no_of_matches
from match_mast as mm 
join referee_mast as rm on mm.referee_id = rm.referee_id
join soccer_country as sc on rm.country_id = sc.country_id
join soccer_venue as sv on mm.venue_id = sv.venue_id
group by rm.referee_name, sc.country_name, sv.venue_name;

# 54. From the following tables, write a SQL query to find the referees and the number of bookings they made. 
-- Return referee name, number of matches.
-- use tables: player_booked, match_mast, referee_mast

select * from player_booked;
select * from match_mast;
select * from referee_mast;

select rm.referee_name, count(pb.match_no) as no_of_matches
from player_booked as pb
join match_mast as mm on pb.match_no = mm.match_no
join referee_mast as rm on mm.referee_id = rm.referee_id
group by rm.referee_name
order by no_of_matches desc;

# #################################################################################################################
# 55(IMP). From the following tables, write a SQL query to find those referees who booked the most number of matches. 
-- Return referee name, number of matches.
-- use tables: player_booked, match_mast, referee_mast
-- --------------------------------------------------------------------------------------------------------------
select * from player_booked;
select * from match_mast;
select * from referee_mast;

select rm.referee_name, count(pb.match_no) as no_of_matches
from player_booked as pb
join match_mast as mm on pb.match_no = mm.match_no
join referee_mast as rm on mm.referee_id = rm.referee_id
group by rm.referee_name
order by no_of_matches desc
limit 1;

-- -------------------------------------------------------------------------------------------------------------

select rm.referee_name, count(pb.match_no) as no_of_matches
from player_booked as pb
join match_mast as mm on pb.match_no = mm.match_no
join referee_mast as rm on mm.referee_id = rm.referee_id
group by rm.referee_name
having no_of_matches >= all(select count(pb.match_no) 
							from player_booked as pb 
							join match_mast as mm on pb.match_no = mm.match_no  
							join referee_mast as rm on mm.referee_id = rm.referee_id  
							group by referee_name);

-- -------------------------------------------------------------------------------------------------------------
-- subquery to find count(match_no) when group by referee_name
select count(pb.match_no) 
from player_booked as pb 
join match_mast as mm on pb.match_no = mm.match_no  
join referee_mast as rm on mm.referee_id = rm.referee_id  
group by referee_name;

# #####################################################################################################################


# 56. From the following tables, write a SQL query to find those players on each team who wore jersey number 10. 
-- Return country name, player name, position to play, age and playing club.  
-- use tables: player_mast, soccer_country

select * from player_mast;
select * from soccer_country;

select sc.country_name, pm.player_name, pm.posi_to_play, pm.age, pm.playing_club
from player_mast as pm 
join soccer_country as sc on pm.team_id = sc.country_id
where pm.jersey_no = 10;


# 57. From the following tables, write a SQL query to find the defenders who scored goals for their team. 
-- Return player name, jersey number, country name, age and playing club.
-- use tables: goal_details, player_mast, soccer_country

select * from goal_details;
select * from player_mast;
select * from soccer_country;

select pm.player_name, pm.jersey_no, sc.country_name, pm.age, pm.playing_club
from goal_details as gd
join player_mast as pm on gd.player_id = pm.player_id
join soccer_country as sc on gd.team_id = sc.country_id
where pm.posi_to_play = 'DF';

# 58. From the following table, write a SQL query to find out which players scored against his own team by accident. 
-- Return player name, jersey number, country name, age, position to play, and playing club.
-- use tables: goal_details, player_mast, soccer_country

select * from goal_details;
select * from player_mast;
select * from soccer_country;

select pm.player_name, pm.jersey_no, sc.country_name, pm.age, pm.posi_to_play, pm.playing_club
from goal_details as gd
join player_mast as pm on gd.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where goal_type = 'O';

# 59. From the following table, write a SQL query to find the results of penalty shootout matches. 
-- Return match number, play stage, country name and penalty score.
-- use tables: match_details, soccer_country

select * from match_details;
select * from soccer_country;

select md.match_no, md.play_stage, sc.country_name, md.penalty_score
from match_details as md 
join soccer_country as sc on md.team_id = sc.country_id
where md.decided_by = 'P'
order by md.match_no;

# 60. From the following table, write a SQL query to find the goal scored by each player according to their position. 
-- Return country name, position to play, and number of goals.
-- use tables: goal_details, player_mast, soccer_country

select * from goal_details;
select * from player_mast;
select * from soccer_country;

select sc.country_name, pm.posi_to_play, count(gd.goal_id) as no_of_goals
from goal_details as gd
join player_mast as pm on gd.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
group by sc.country_name, pm.posi_to_play
order by sc.country_name;


# 61. From the following tables, write a SQL query to find those players who came into the field at the end of play. 
-- Return match number, country name, player name, jersey number and time in out.
-- use tables: player_in_out, player_mast, soccer_country

select * from player_in_out;
select * from player_mast;
select * from soccer_country;

select pio.match_no, sc.country_name, pm.player_name, pm.jersey_no, pio.time_in_out
from player_in_out as pio
join player_mast as pm on pio.player_id = pm.player_id
join soccer_country as sc on pm.team_id = sc.country_id
where pio.in_out = 'I' and pio.time_in_out in (select max(time_in_out) from player_in_out);
