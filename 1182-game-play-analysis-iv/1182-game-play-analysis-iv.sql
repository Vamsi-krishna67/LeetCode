# Write your MySQL query statement below
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
NextDayLogins AS (
    SELECT 
        A.player_id
    FROM 
        Activity A
    JOIN 
        FirstLogin FL 
    ON 
        A.player_id = FL.player_id
        AND A.event_date = DATE_ADD(FL.first_login_date, INTERVAL 1 DAY)
)
SELECT 
    ROUND(COUNT(DISTINCT ND.player_id) * 1.0 / COUNT(DISTINCT FL.player_id), 2) AS fraction
FROM 
    FirstLogin FL
LEFT JOIN 
    NextDayLogins ND
ON 
    FL.player_id = ND.player_id;
