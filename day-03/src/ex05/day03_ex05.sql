-- Write an SQL statement that returns a list of pizzerias that Andrey visited but did not order from.
-- Please order by the name of the pizzeria.

(SELECT p.name AS pizzeria_name
 FROM person_visits pv
          INNER JOIN person pe ON pv.person_id = pe.id
          INNER JOIN pizzeria p ON pv.pizzeria_id = p.id
 WHERE pe.name = 'Andrey')
EXCEPT
(SELECT p.name AS pizzeria_name
 FROM person_order po
          INNER JOIN menu m ON po.menu_id = m.id
          INNER JOIN person pe ON po.person_id = pe.id
          INNER JOIN pizzeria p ON m.pizzeria_id = p.id
 WHERE pe.name = 'Andrey')
ORDER BY 1;