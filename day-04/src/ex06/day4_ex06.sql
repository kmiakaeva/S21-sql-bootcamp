-- Please create a Materialized View mv_dmitriy_visits_and_eats (with data included) based on the SQL statement that finds
-- the name of the pizzeria where Dmitriy visited on January 8, 2022 and could eat pizzas for less than 800 rubles
-- (this SQL can be found at Day #02 Exercise #07).
--
-- To check yourself, you can write SQL to the Materialized View mv_dmitriy_visits_and_eats and compare the results
-- with your previous query.

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name AS pizzeria_name
FROM person_visits pv
         INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
         INNER JOIN person pe ON pv.person_id = pe.id
         INNER JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
WHERE pe.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800;

-- for checking
SELECT *
FROM mv_dmitriy_visits_and_eats;

-- delete materialized view
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;