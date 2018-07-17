SELECT *
FROM survey
LIMIT 10;


 SELECT question, COUNT(DISTINCT user_id)
 FROM survey
 GROUP BY 1
 ORDER BY 1;


SELECT * 
FROM quiz
LIMIT 5;
 
SELECT *
FROM home_try_on
LIMIT 5;
 
SELECT *
FROM purchase
LIMIT 5;


SELECT h.number_of_pairs AS 'pairs_tried_on',
COUNT(p.user_id IS NOT NULL) AS 'total_purchases'
FROM home_try_on AS 'h'
LEFT JOIN purchase AS 'p'
  ON h.user_id = p.user_id
GROUP BY h.number_of_pairs;


SELECT h.number_of_pairs AS 'pairs_tried_on',
ROUND(AVG(p.price), 2) AS 'average_purchase_price'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
	ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
	ON q.user_id = p.user_id
WHERE h.number_of_pairs IS NOT NULL
GROUP BY 1;



SELECT DISTINCT q.user_id,
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
  ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
  ON q.user_id = p.user_id
LIMIT 10;


SELECT
SUM(h.user_id IS NOT NULL) AS 'total_try_on',
SUM(p.user_id IS NOT NULL) AS 'total_purchased'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
	ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
	ON q.user_id = p.user_id;


SELECT ROUND(AVG(p.price), 2) AS 'average_purchase_price'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
	ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
	ON q.user_id = p.user_id;


SELECT model_name,
COUNT(*) AS 'number_purchased'
FROM purchase
GROUP BY model_name
ORDER BY 2 DESC;


