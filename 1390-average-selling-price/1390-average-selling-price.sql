# Write your MySQL query statement below
SELECT 
    p.product_id,
    ROUND(SUM(p.price * u.units) / SUM(u.units), 2) AS average_price
FROM 
    Prices p
JOIN 
    UnitsSold u
ON 
    p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id
UNION
SELECT 
    product_id,
    0 AS average_price
FROM 
    Prices
WHERE 
    product_id NOT IN (SELECT DISTINCT product_id FROM UnitsSold);
