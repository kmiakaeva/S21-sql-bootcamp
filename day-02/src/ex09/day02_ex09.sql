-- Find the names of all women who ordered both pepperoni and cheese pizzas (at any time and in any pizzerias).
-- Make sure that the result is ordered by person's name.

SELECT pe.name
FROM person pe
         INNER JOIN person_order po ON pe.id = po.person_id
         INNER JOIN menu m ON po.menu_id = m.id
WHERE gender = 'female'
  AND pizza_name = 'pepperoni pizza'
INTERSECT
SELECT pe.name
FROM person pe
         INNER JOIN person_order po ON pe.id = po.person_id
         INNER JOIN menu m ON po.menu_id = m.id
WHERE gender = 'female'
  AND pizza_name = 'cheese pizza'
ORDER BY 1;