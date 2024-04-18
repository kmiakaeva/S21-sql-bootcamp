-- Let's go back to Exercise #01, please rewrite your SQL using the CTE (Common Table Expression) pattern.
-- Please go to the CTE part of your "day generator". The result should look similar to Exercise #01.

WITH day_generator AS (SELECT gs:: date
                       FROM generate_series('2022-01-01', '2022-01-10', '1 day':: interval) AS gs)
SELECT dg.gs:: date AS missing_date
FROM (SELECT pv.visit_date FROM person_visits pv WHERE pv.person_id BETWEEN 1 and 2) AS pv
         RIGHT JOIN day_generator dg ON pv.visit_date = dg.gs
WHERE pv.visit_date IS NULL
ORDER BY missing_date;