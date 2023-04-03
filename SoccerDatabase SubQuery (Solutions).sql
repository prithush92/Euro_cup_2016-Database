use soccerdatabase;

# 1. From the following table, write a SQL query to find out which teams played the first match of the 2016 Euro Cup. 
-- Return match number, country name.
-- use tables match_details, soccer_country

select * from match_details;
select * from soccer_country;

select match_no, country_name
from match_details as md, soccer_country as sc
where md.team_id = sc.country_id and md.match_no = 1;

# 2. From the following tables, write a SQL query to find the winner of EURO cup 2016. 
-- Return country name.
-- use tables soccer_country, match_details

select * from soccer_country;
select * from match_details;

select country_name
from match_details as md, soccer_country as sc
where md.team_id = sc.country_id and md.play_stage = 'F' and md.win_lose = 'W';

# 3. From the following table, write a SQL query to find the highest audience match. 
-- Return match_no, play_stage, goal_score, audience.
-- use table match_mast

select * from match_mast;

select match_no, play_stage, goal_score, audence
from match_mast
where audence in (select max(audence) from match_mast);

# ###########################################################################################################################
# 4(IMP). From the following tables, write a SQL query to find the match number in which Germany played against Poland. 
-- Group the result set on match number. 
-- Return match number.
-- use table match_details, soccer_country

select * from match_details;
select * from soccer_country;

# METHOD 1
select md.match_no
from match_details as md, soccer_country as sc
where md.team_id = sc.country_id
and sc.country_name in ('Germany', 'Poland')
group by md.match_no
having count(team_id) = 2;
-- ------------------------------------------------

# METHOD 2
select g.match_no
from (select match_no 
		from match_details as md
		join soccer_country as sc 
        on md.team_id = sc.country_id
        where sc.country_name = 'Germany') as g
join
(select match_no 
		from match_details as md
		join soccer_country as sc 
        on md.team_id = sc.country_id
        where sc.country_name = 'Poland') as p
on g.match_no = p.match_no;

# ###########################################################################################################################

# 5. From the following tables, write a SQL query to find the result of the match where Portugal played against Hungary. 
-- Return match_no, play_stage, play_date, results, goal_score.
-- use tables match_mast, match_details, soccer_country

select * from match_mast;
select * from match_details;
select * from soccer_country;

select mm.match_no, mm.play_stage, mm.play_date, mm.results, mm.goal_score
from match_mast as mm, match_details as md, soccer_country as sc
where mm.match_no = md.match_no and md.team_id = sc.country_id
and sc.country_name in ('Portugal', 'Hungary')
group by mm.match_no, mm.play_stage, mm.play_date, mm.results, mm.goal_score
having count(md.team_id) = 2;

			
# 6. Write a SQL query to find the players who scored goals in each match. 
-- Group the result set on match number, country name and player name. 
-- Sort the result-set in ascending order by match number. 
-- Return match number, country name, player name and number of goals.
-- use tables goal_details, soccer_country, player_mast

select * from goal_details;
select * from soccer_country;
select * from player_mast;

select gd.match_no, sc.country_name, pm.player_name, count(goal_id) as no_of_goals
from goal_details as gd, soccer_country as sc, player_mast as pm
where gd.player_id = pm.player_id and pm.team_id = sc.country_id
group by gd.match_no, sc.country_name, pm.player_name
order by gd.match_no asc;


# 7. From the following tables, write a SQL query to find the highest audience match. 
-- Return country name of the teams.
-- use table soccer_country, goal_details, match_mast

select * from soccer_country;
select * from goal_details;
select * from match_mast;

select distinct sc.country_name
from match_mast as mm, soccer_country as sc, goal_details as gd
where mm.match_no = gd.match_no and gd.team_id = sc.country_id and mm.audence in (select max(audence) from match_mast);

# 8. Write a SQL query to find the player who scored the last goal for Portugal against Hungary. 
-- Return player name.
-- use tables player_mast, goal_details, match_details, soccer_country 

select * from player_mast;
select * from goal_details;
select * from match_details;
select * from soccer_country;

-- select 
-- from player_mast as pm, goal_details as gd, match_details as md, soccer_country as sc
-- where gd.player_id = pm.player_id and md.match_no = gd.match_no and sc.country_id = md.team_id;

# 9. Write a SQL query to find the second-highest stoppage time in the second half.
-- Return Stoppage time.
-- use table match_mast

select * from match_mast;

select stop2_sec
from match_mast
where stop2_sec in (select max(stop2_sec) 
					from match_mast 
                    where stop2_sec < (select max(stop2_sec) 
										from match_mast));

# 10. Write a SQL query to find the teams played the match where the second highest stoppage time had been added in the second half of play. 
-- Return country name of the teams.
-- use tables soccer_country, match_details, match_mast

select * from soccer_country;
select * from match_details;
select * from match_mast;

select sc.country_name
from soccer_country as sc, match_details as md, match_mast as mm
where sc.country_id = md.team_id and mm.match_no = md.match_no
and mm.stop2_sec in (select max(stop2_sec) 
					from match_mast 
                    where stop2_sec < (select max(stop2_sec) 
										from match_mast));


# 11. Write a SQL query to find the teams played the match where second highest stoppage time had been added in second half of play. 
-- Return match_no, play_date, stop2_sec.
-- use table match_mast

select * from match_mast;

select match_no, play_date, stop2_sec
from match_mast 
where stop2_sec in (select max(stop2_sec)
					from match_mast
					where stop2_sec < (select max(stop2_sec)
										from match_mast));

# 12. From the following tables, write a SQL query to find the team, which was defeated by Portugal in EURO cup 2016 final. 
-- Return the country name of the team. 
-- use tables soccer_country, match_details

select * from soccer_country;
select * from match_details;

select sc.country_name
from match_details as md, soccer_country as sc
where md.team_id = sc.country_id
and play_stage = 'F' and win_lose = 'L';

# 13. Write a SQL query to find the club, which supplied the most number of players to the 2016-EURO cup. 
-- Return club name, number of players. 
-- use table player_mast

select * from player_mast;

select playing_club, count(player_id)
from player_mast
group by playing_club
having count(player_id) >= all(select count(player_id)
							from player_mast
                            group by playing_club);

-- subquery to find count(player_id) group by playing_club                            
select count(player_id) from player_mast group by playing_club;
			

# 14. From the following tables, write a SQL query to find the player who scored the first penalty of the tournament. 
-- Return player name and Jersey number.
-- use table player_mast, goal_details

select * from player_mast;
select * from goal_details;

select pm.player_name, pm.jersey_no
from player_mast as pm, goal_details as gd
where pm.player_id = gd.player_id
and goal_id in (select min(goal_id) from goal_details where goal_type = 'P');

-- subquery to find all goal_id where goal_type = 'P'
select goal_id from goal_details where goal_type = 'P';

# 15. From the following tables, write a SQL query to find the player who scored the first penalty in the tournament. 
-- Return player name, Jersey number and country name.
-- use table player_mast, goal_details, soccer_country

select * from player_mast;
select * from goal_details;
select * from soccer_country;

select pm.player_name, pm.jersey_no, sc.country_name
from player_mast as pm, goal_details as gd, soccer_country as sc
where pm.player_id = gd.player_id and pm.team_id = sc.country_id
and goal_id in (select min(goal_id) from goal_details where goal_type = 'P');

# 16. Write a SQL query to find the goalkeeper for Italy in penalty shootout against Germany in Football EURO cup 2016. 
-- Return goalkeeper name.
-- use table player_mast, penalty_gk, soccer_country

select * from player_mast;
select * from penalty_gk;
select * from soccer_country;

select pm.player_name
from player_mast as pm, penalty_gk as pg, soccer_country as sc
where pm.player_id = pg.player_gk and pg.team_id = sc.country_id
and sc.country_name = 'Italy'
and pg.match_no in (select match_no
					from penalty_gk as pg, soccer_country as sc
					where pg.team_id = sc.country_id
					and sc.country_name in ('Germany', 'Italy')
					group by match_no
					having count(team_id) = 2);

-- subquery to find match_no where country in (Germany, Italy)
select match_no
from penalty_gk as pg, soccer_country as sc
where pg.team_id = sc.country_id
and sc.country_name in ('Germany', 'Italy')
group by match_no
having count(team_id) = 2;


# 17. Write a SQL query to find the number of goals Germany scored at the tournament.
-- Return number of goals
-- use tables goal_details, soccer_country

select * from goal_details;
select * from soccer_country;

select country_name, count(goal_id) as no_of_goals
from goal_details as gd, soccer_country as sc
where gd.team_id = sc.country_id
and sc.country_name = 'Germany'
group by sc.country_name;

# 18. Write a SQL query to find the players who were the goalkeepers of the England team that played in the 2016-EURO. 
-- Return player name, jersey number, club name
-- use tables player_mast, soccer_country

select * from player_mast;
select * from soccer_country;

select pm.player_name, pm.jersey_no, pm.playing_club
from player_mast as pm, soccer_country as sc
where pm.team_id = sc.country_id
and sc.country_name = 'England'
and pm.posi_to_play = 'GK';

# 19. From the following table, write a SQL query to find the Liverpool players who were part of England's squad at the 2016 Euro Cup. 
-- Return player name, jersey number, position to play and age.
-- use tables player_mast, soccer_country

select * from player_mast;
select * from soccer_country;

select pm.player_name, pm.jersey_no, pm.posi_to_play, pm.age
from player_mast as pm, soccer_country as sc
where pm.team_id = sc.country_id
and pm.playing_club = 'Liverpool' and sc.country_name = 'England';

# 20. Write a SQL query to find the players who scored the last goal in the second semi-final, i.e., the 50th match of the 2016-EURO Cup. 
-- Return player name, goal time, goal half, country name.
-- use tables player_mast, goal_details, soccer_country

select * from player_mast;
select * from goal_details;
select * from soccer_country;

select pm.player_name, gd.goal_time, gd.goal_half, sc.country_name
from player_mast as pm, goal_details as gd, soccer_country as sc
where pm.player_id = gd.player_id and gd.team_id = sc.country_id
and gd.match_no = 50
and goal_id in (select max(goal_id)
				from goal_details
                where match_no = 50);

-- subquery to find all goal_id in match_no = 50;
select goal_id
from goal_details
where match_no = 50;

# 21. From the following table, write a SQL query to find out who was the captain of Portugal's winning EURO cup 2016 team. 
-- Return the captain name.
-- use tables player_mast, match_captain, match_details

select * from player_mast;
select * from match_captain;
select * from match_details;

select distinct pm.player_name as Captain
from player_mast as pm, match_captain as mc, match_details as md
where pm.player_id = mc.player_captain and mc.team_id = md.team_id
and md.play_stage = 'F' and md.win_lose = 'W';

# 22. From the following tables, write a SQL query to count the number of players played for 'France’ in the final. 
-- Return 'Number of players shared fields'.
-- use tables player_in_out, match_mast, soccer_country

-- 11 players start the game and some players replace existing players(who were already playing) so players_shared_field = 11 + no_of_players with (in_out = 'I'))
select * from player_in_out;
select * from match_mast;
select * from soccer_country;

select count(player_id) + 11 as no_of_players_shared_fields
from player_in_out as pio, match_mast as mm, soccer_country as sc
where pio.match_no = mm.match_no and pio.team_id = sc.country_id
and mm.play_stage = 'F' and sc.country_name = 'France' and pio.in_out = 'I';

# 23. Write a SQL query to find the Germany goalkeeper who did not concede any goals in their group stage matches. 
-- Return goalkeeper name, jersey number.
-- use tables player_mast, match_details, soccer_country

select * from player_mast;
select * from match_details;
select * from soccer_country;

select pm.player_name, pm.jersey_no
from player_mast as pm, match_details as md, soccer_country as sc
where pm.player_id = md.player_gk and md.team_id = sc.country_id
and sc.country_name = 'Germany'
and md.play_stage = 'G'
and md.goal_score = '0';

# 24. Write a SQL query to find the runners-up in Football EURO cup 2016.
-- Return country name.
-- use tables match_details, soccer_country

select * from match_details;
select * from soccer_country;

select sc.country_name
from match_details as md, soccer_country as sc
where md.team_id = sc.country_id 
and md.play_stage = 'F'
and md.win_lose = 'L';

# 25. Write a SQL query to find the maximum penalty shots taken by the teams. 
-- Return country name, maximum penalty shots.
-- use tables soccer_country, penalty_shootout

select * from soccer_country;
select * from penalty_shootout;

select sc.country_name, count(kick_id) as max_penalty_shots
from penalty_shootout as ps, soccer_country as sc
where ps.team_id = sc.country_id
group by sc.country_name
having count(kick_id) >= all(select count(kick_id)
							from penalty_shootout as ps, soccer_country as sc
							where ps.team_id = sc.country_id
							group by sc.country_name);


-- subquery to find count(kick_id) when group by country_name
select count(kick_id)
from penalty_shootout as ps, soccer_country as sc
where ps.team_id = sc.country_id
group by sc.country_name;

# 26. Write a SQL query to find the maximum number of penalty shots taken by the players. 
-- Return country name, player name, jersey number and number of penalty shots.
-- use tables: player_mast, penalty_shootout, soccer_country

select * from player_mast;
select * from penalty_shootout;
select * from soccer_country;

select sc.country_name, pm.player_name, pm.jersey_no, count(ps.kick_id) as no_of_penalty_shots
from player_mast as pm, penalty_shootout as ps, soccer_country as sc
where pm.player_id = ps.player_id and pm.team_id = sc.country_id
group by sc.country_name, pm.player_name, pm.jersey_no
having count(ps.kick_id) >= all(select count(kick_id)
								from player_mast as pm, penalty_shootout as ps
								where pm.player_id = ps.player_id
								group by pm.player_name);

-- subquery to find count(kick_id) when group by player_name
select count(kick_id)
from player_mast as pm, penalty_shootout as ps
where pm.player_id = ps.player_id
group by pm.player_name;


# 27. Write a SQL query to find the matches with the most penalty shots.
-- Return match number and no of shots
-- use tables: penalty_shootout

select * from penalty_shootout;

select match_no, count(kick_id) as no_of_shots
from penalty_shootout
group by match_no
having count(kick_id) >= all(select count(kick_id)
							from penalty_shootout
							group by match_no);

-- subquery to find count(kick_id) when group by match_no
select count(kick_id)
from penalty_shootout
group by match_no;

# #####################################################################################################################
# 28(IMP). Write a SQL query to determine the match number where the most penalty shots were taken. 
-- Return match number, country name.
-- use table: penalty_shootout, soccer_country

select * from penalty_shootout;
select * from soccer_country;

select distinct ps.match_no, sc.country_name
from penalty_shootout as ps, soccer_country as sc
where ps.team_id = sc.country_id
and ps.match_no in (select match_no
					from penalty_shootout
					group by match_no
					having count(kick_id) >= all(select count(kick_id)
												from penalty_shootout
												group by match_no));
                                                
-- subquery to find match_no where most penalty shots were taken
select match_no
from penalty_shootout
group by match_no
having count(kick_id) >= all(select count(kick_id)
							from penalty_shootout
							group by match_no);

# ##########################################################################################################################


# ##########################################################################################################################
# 29(IMP). Write a SQL query to find the player of ‘Portugal’ who took the seventh kick against ‘Poland’. 
-- Return match number, player name and kick number.
-- use tables: penalty_shootout, player_mast, soccer_country, match_details

select * from penalty_shootout;
select * from soccer_country;
select * from player_mast;

select ps.match_no, pm.player_name, ps.kick_no
from penalty_shootout as ps, player_mast as pm, soccer_country as sc
where ps.player_id = pm.player_id and pm.team_id = sc.country_id
and sc.country_name = 'Portugal'
and ps.kick_no = 7
and ps.match_no in (select md.match_no
					from match_details as md, soccer_country as sc
					where md.team_id = sc.country_id
					and sc.country_name in ('Portugal', 'Poland')
					group by md.match_no
					having count(team_id) = 2);

-- subquery to find match_id of the match between 'Portugal' and 'Poland'
select md.match_no
from match_details as md, soccer_country as sc
where md.team_id = sc.country_id
and sc.country_name in ('Portugal', 'Poland')
group by md.match_no
having count(team_id) = 2;

# ###############################################################################################################################

# 30. Write a SQL query to find the stage of the match where penalty kick number 23 was taken. 
-- Return match number, play_stage.
-- use tables: match_mast, penalty_shootout

select * from match_mast;
select * from penalty_shootout;

select ps.match_no, mm.play_stage
from match_mast as mm, penalty_shootout as ps
where mm.match_no = ps.match_no
and ps.kick_id = 23;

# 31. Write a SQL query to find the venues where penalty shoot-out matches were played. 
-- Return venue name.
-- use tables: soccer_venue, match_mast, penalty_shootout

select * from soccer_venue;
select * from match_mast;
select * from penalty_shootout;

select distinct sv.venue_name
from penalty_shootout as ps, match_mast as mm, soccer_venue as sv
where ps.match_no = mm.match_no and mm.venue_id = sv.venue_id;

# 32. Write a SQL query to find out when the penalty shootout matches were played. 
-- Return playing date.
-- use tables: match_mast, penalty_shootout

select * from match_mast;
select * from penalty_shootout;

select distinct mm.play_date
from penalty_shootout as ps, match_mast as mm
where ps.match_no = mm.match_no;

# 33. Write a SQL query to find the fastest goal at the EURO cup 2016, after 5 minutes. 
-- Return 'Quickest goal after 5 minutes'.
-- use tables: goal_details

select * from goal_details;

select goal_time
from goal_details
where goal_time in (select min(goal_time)
					from goal_details
					where goal_time > 5);
                    
-- ------------------------------------------
-- subquery to find all goal_time > 5
select goal_time
from goal_details
where goal_time > 5;