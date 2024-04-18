-- Please find pizzerias that have been visited more often by women or by men. Save duplicates for any SQL operators
-- with sets (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). Please sort a result by the name of the pizzeria.

(SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
          INNER JOIN person pe ON pv.person_id = pe.id
 WHERE gender = 'female'
 EXCEPT ALL
 SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
          INNER JOIN person pe ON pv.person_id = pe.id
 WHERE gender = 'male')
UNION ALL
(SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
          INNER JOIN person pe ON pv.person_id = pe.id
 WHERE gender = 'male'
 EXCEPT ALL
 SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
          INNER JOIN person pe ON pv.person_id = pe.id
 WHERE gender = 'female')
ORDER BY 1;