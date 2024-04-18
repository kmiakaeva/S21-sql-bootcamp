-- Please find the name of the pizzeria Dmitriy visited on January 8, 2022 and could eat pizza for less than 800 rubles.

SELECT p.name AS pizzeria_name
FROM person_visits pv
         INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
         INNER JOIN person pe ON pv.person_id = pe.id
         INNER JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
WHERE pe.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800;