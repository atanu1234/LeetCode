# Write your MySQL query statement below
SELECT ROUND(COUNT(DISTINCT player_id)/ (SELECT COUNT( DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity
WHERE (Player_id, date_sub(event_date, INTERVAL 1 DAY))
IN( SELECT player_id, MIN(event_date) AS first_login FROM Activity
GROUP BY player_id)