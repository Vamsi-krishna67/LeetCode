# Write your MySQL query statement below
SELECT 
    A.machine_id,
    ROUND(AVG(E.timestamp - S.timestamp), 3) AS processing_time
FROM 
    Activity A
JOIN 
    Activity S ON A.machine_id = S.machine_id 
               AND A.process_id = S.process_id 
               AND S.activity_type = 'start'
JOIN 
    Activity E ON A.machine_id = E.machine_id 
               AND A.process_id = E.process_id 
               AND E.activity_type = 'end'
GROUP BY 
    A.machine_id;

