-- Please write a SQL statement that returns the person's name and the corresponding number of visits to any pizzerias
-- if the person has visited more than 3 times (> 3).

SELECT pe.name,
       COUNT(*) AS count_of_visits
FROM person_visits pv
         INNER JOIN person pe
                    ON pe.id = pv.person_id
GROUP BY pe.name
HAVING COUNT(*) > 3;