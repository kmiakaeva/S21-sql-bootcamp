-- Find complete information about all possible pizzeria names and prices to get mushroom or pepperoni pizza.
-- Then sort the result by pizza name and pizzeria name.

SELECT pizza_name, name AS pizzeria_name, price
FROM menu AS m
         INNER JOIN pizzeria AS p ON m.pizzeria_id = p.id
WHERE pizza_name in ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name;