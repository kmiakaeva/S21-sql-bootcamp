-- Find all pizza names (and corresponding pizzeria names using the menu table) ordered by Denis or Anna.
-- Sort a result by both columns.

SELECT pizza_name, p.name AS pizzeria_name
FROM person_order po
         INNER JOIN person pe ON po.person_id = pe.id
         INNER JOIN menu m ON po.menu_id = m.id
         INNER JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE pe.name in ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;