-- Please find the names of all men from Moscow or Samara who order either pepperoni or mushroom pizza (or both).
-- Please sort the result by person names in descending order.

SELECT pe.name
FROM person pe
         INNER JOIN person_order po ON pe.id = po.person_id
         INNER JOIN menu m ON po.menu_id = m.id
WHERE gender = 'male'
  AND address in ('Moscow', 'Samara')
  AND pizza_name in ('pepperoni pizza', 'mushroom pizza')
ORDER BY 1 DESC;