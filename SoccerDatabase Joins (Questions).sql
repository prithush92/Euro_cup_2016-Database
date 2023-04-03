# 1. From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played. 
-- Return venue name, city.
-- use tables: soccer_venue, soccer_city, match_mast

# 2. From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play. 
-- Return match number, country name and goal score. 
-- use tables: match_details, soccer_country

# 3. From the following table, write a SQL query to count the number of goals scored by each player within a normal play schedule. 
-- Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. 
-- Return player name, number of goals and country name.
-- use tables: goal_details, player_mast, soccer_country 

# 4. From the following table, write a SQL query to find out who scored the most goals in the 2016 Euro Cup. 
-- Return player name, country name and highest individual scorer. 
-- use tables: goal_details, player_mast, soccer_country 

# 5. From the following table, write a SQL query to find out who scored in the final of the 2016 Euro Cup. 
-- Return player name, jersey number and country name.
-- use tables: goal_details, player_mast, soccer_country

# 6. From the following tables, write a SQL query to find out which country hosted the 2016 Football EURO Cup. 
-- Return country name.
-- use tables: soccer_country, soccer_city, soccer_venue

# 7. From the following tables, write a SQL query to find out who scored the first goal of the 2016 European Championship. 
-- Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half.
-- use tables: soccer_country, player_mast, goal_details

# 8. From the following tables, write a SQL query to find the referee who managed the opening match. 
-- Return referee name, country name.
-- use tables: soccer_country, match_mast, referee_mast

# 9. From the following tables, write a SQL query to find the referee who managed the final match. 
-- Return referee name, country name.
-- use tables: soccer_country, match_mast, referee_mast

# 10. From the following tables, write a SQL query to find the referee who assisted the referee in the opening match. 
-- Return associated referee name, country name.
-- use tables: asst_referee_mast, soccer_country, match_details

# 11. From the following tables, write a SQL query to find the referee who assisted the referee in the final match. 
-- Return associated referee name, country name.
-- use tables: asst_referee_mast, soccer_country, match_details

# 12. From the following table, write a SQL query to find the city where the opening match of EURO cup 2016 took place. 
-- Return venue name, city.
-- use tables: soccer_venue, soccer_city, match_mast

# 13. From the following tables, write a SQL query to find out which stadium hosted the final match of the 2016 Euro Cup. 
-- Return venue_name, city, aud_capacity, audience.
-- use tables: soccer_venue, soccer_city, match_mast

# 14. From the following tables, write a SQL query to count the number of matches played at each venue. 
-- Sort the result-set on venue name. 
-- Return Venue name, city, and number of matches.
-- use tables: soccer_venue, soccer_city, match_mast

# 15. From the following tables, write a SQL query to find the player who was the first player to be sent off at the tournament EURO cup 2016. 
-- Return match Number, country name and player name.
-- use tables: player_booked, player_mast, soccer_country

# 16. From the following tables, write a SQL query to find the teams that have scored one goal in the tournament. 
-- Return country_name as "Team", team in the group, goal_for.
-- use tables: soccer_team, soccer_country

# 17. From the following tables, write a SQL query to count the number of yellow cards each country has received. 
-- Return country name and number of yellow cards.
-- use tables: soccer_country, player_booked

# 18. From the following tables, write a SQL query to count the number of goals that have been seen. 
-- Return venue name and number of goals.
-- use tables: soccer_country, goal_details, match_mast, soccer_venue

# 19. From the following tables, write a SQL query to find the match where there was no stoppage time in the first half. 
-- Return match number, country name.
-- use tables: match_details, match_mast, soccer_country

# 20. From the following tables, write a SQL query to find the team(s) who conceded the most goals in EURO cup 2016. 
-- Return country name, team group and match played.
-- use tables: soccer_team, soccer_country

# 21. From the following tables, write a SQL query to find those matches where the highest stoppage time was added in 2nd half of play. 
-- Return match number, country name, stoppage time(sec.).
-- use tables: match_details, match_mast, soccer_country

# 22. From the following tables, write a SQL query to find the matches that ended in a goalless draw at the group stage. 
-- Return match number, country name.
-- use tables: match_details, soccer_country

# 23. From the following tables, write a SQL query to find those match(s) where the second highest amount of stoppage time was added in the second half of the match. 
-- Return match number, country name and stoppage time.
-- use tables: match_mast, match_details, soccer_country

# 24. From the following tables, write a SQL query to find the number of matches played by a player as a goalkeeper for his team. 
-- Return country name, player name, number of matches played as a goalkeeper.
-- use tables: player_mast, match_details, soccer-country

# 25. From the following tables, write a SQL query to find the venue where the most goals have been scored. 
-- Return venue name, number of goals.
-- use tables: goal_details, soccer_country, match_mast, soccer_venue

# 26. From the following tables, write a SQL query to find the oldest player to have appeared in a EURO 2016 match. 
-- Return country name, player name, jersey number and age.
-- use tables: player_mast, soccer_country

# 27. From the following tables, write a SQL query to find the two teams in this tournament that have scored three goals in a single game. 
-- Return match number and country name.
-- use tables: match_details, soccer_country

# 28. From the following tables, write a SQL query to find which teams finished at the bottom of their respective groups after conceding four goals in three games. 
-- Return country name, team group and match played.
-- use tables: soccer_team, soccer_country

# 29. From the following tables, write a SQL query to find those players, who were contracted to the Lyon club and participated in the final of the EURO cup 2016. 
-- Return player name, jerseyno, position to play, age, and country name.
-- use tables: player_mast, soccer_country, match_details

# 30. From the following tables, write a SQL query to find the final four teams in the tournament. 
-- Return country name.
-- use tables: soccer_country, match_details

# 31. From the following tables, write a SQL query to find the captains of the top four teams that competed in the semi-finals (matches 48 and 49) of the tournament. 
-- Return country name, player name, jersey number and position to play.
-- use tables: soccer_country, match_captain, player_mast

# 32. From the following tables, write a SQL query to find the captains of all the matches in the tournament. 
-- Return match number, country name, player name, jersey number and position to play.
-- use tables: soccer_country, match_captain, player_mast

# 33. From the following tables, write a SQL query to find the captain and goalkeeper of all the matches. 
-- Return match number, Captain, Goal Keeper and country name.
-- use tables: soccer_country, match_captain, match_details, player_mast

# 34. From the following table, write a SQL query to find out the player who was selected for the ‘Man of the Match’ award in the finals of EURO cup 2016. 
-- Return player name, country name.
-- use tables: soccer_country, match_mast, player_mast

# 35. From the following tables, write a SQL query to find the substitute players who entered the field during the first half of play within the normal time frame for the game. 
-- Return match_no, country_name, player_name, jersey_no and time_in_out.
-- use tables: player_in_out, player_mast, soccer_country

# 36. From the following table, write a SQL query to prepare a list for the “player of the match” against each match. 
-- Return match number, play date, country name, player of the Match, jersey number.
-- use tables: match_mast, player_mast, soccer_country

# 37. From the following tables, write a SQL query to find the player who took the penalty shot number 26. 
-- Return match number, country name, player name.
-- use tables: penalty_shootout, player_mast, soccer_country

# 38. From the following tables, write a SQL query to find the team against which the penalty shot number 26 was taken. 
-- Return match number, country name.
-- use tables: penalty_shootout, soccer_country

# 39. From the following tables, write a SQL query to find the captain who was also the goalkeeper. 
-- Return match number, country name, player name and jersey number.
-- use tables: match_captain, soccer_country, player_mast

# 40. From the following tables, write a SQL query to find the number of captains who was also the goalkeeper. 
-- Return number of captains.
-- use tables: match_captain, player_mast, soccer_country

# 41. From the following tables, write a SQL query to find out how many times a player had been booked in the tournament. 
-- Show the result according to the team and number of times booked in descending order. 
-- Return country name, player name, and booked number of times.
-- use tables: soccer_country, player_booked, player_mast

# 42. From the following tables, write a SQL query to count the players who booked the most number of times. 
-- Return player name, number of players who booked most number of times.
-- use tables: soccer_country, player_booked, player_mast

# 43. From the following tables, write a SQL query to find out how many players each team has booked. 
-- Return country name, number of players booked. 
-- use tables: soccer_country, player_booked

# 44. From the following tables, write a SQL query to find the matches in which the most cards are displayed. 
-- Return match number, number of cards shown.
-- use tables: soccer_country, player_booked, player_mast

# 45. From the following table, write a SQL query to find the assistant referees. 
-- Return match number, country name, assistant referee name.
-- use tables: match_details, asst_referee_mast, soccer_country

# 46. From the following table, write a SQL query to find the assistant referees of each country assist the number of matches. 
-- Sort the result-set in descending order on number of matches.
-- Return country name, number of matches.
-- use tables: match_details, asst_referee_mast, soccer_country

# 47. From the following table, write a SQL query to find the countries from where the assistant referees assist most of the matches. 
-- Return country name and number of matches.
-- use tables: match_details, asst_referee_mast, soccer_country

# 48. From the following table, write a SQL query to find the name of referees for each match. 
-- Sort the result-set on match number. 
-- Return match number, country name, referee name.
-- use tables: match_mast, referee_mast, soccer_country

# 49. From the following tables, write a SQL query to count the number of matches managed by referees of each country.
-- Return country name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country

# 50. From the following tables, write a SQL query to find the countries from where the referees managed most of the matches. 
-- Return country name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country

# 51. From the following tables, write a SQL query to find the number of matches managed by each referee. 
-- Return referee name, country name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country

# 52. From the following tables, write a SQL query to find those referees who managed most of the matches. 
-- Return referee name, country name and number of matches.
-- use tables: match_mast, referee_mast, soccer_country

# 53. From the following tables, write a SQL query to find those referees who managed the number of matches at each venue. 
-- Return referee name, country name, venue name, number of matches.
-- use tables: match_mast, referee_mast, soccer_country, soccer_venue

# 54. From the following tables, write a SQL query to find the referees and the number of bookings they made. 
-- Return referee name, number of matches.
-- use tables: player_booked, match_mast, referee_mast

# 55. From the following tables, write a SQL query to find those referees who booked the most number of players. 
-- Return referee name, number of matches.
-- use tables: player_booked, match_mast, referee_mast

# 56. From the following tables, write a SQL query to find those players on each team who wore jersey number 10. 
-- Return country name, player name, position to play, age and playing club.  
-- use tables: player_mast, soccer_country

# 57. From the following tables, write a SQL query to find the defenders who scored goals for their team. 
-- Return player name, jersey number, country name, age and playing club.
-- use tables: goal_details, player_mast, soccer_country

# 58. From the following table, write a SQL query to find out which players scored against his own team by accident. 
-- Return player name, jersey number, country name, age, position to play, and playing club.
-- use tables: goal_details, player_mast, soccer_country

# 59. From the following table, write a SQL query to find the results of penalty shootout matches. 
-- Return match number, play stage, country name and penalty score.
-- use tables: match_details, soccer_country

# 60. From the following table, write a SQL query to find the goal scored by each player according to their position. 
-- Return country name, position to play, and number of goals.
-- use tables: goal_details, player_mast, soccer_country

# 61. From the following tables, write a SQL query to find those players who came into the field at the end of play. 
-- Return match number, country name, player name, jersey number and time in out.
-- use tables: player_in_out, player_mast, soccer_country