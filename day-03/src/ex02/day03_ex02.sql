-- Please use the SQL statement from Exercise #01 and display the names of pizzas from the pizzeria that no one has
-- ordered, including the corresponding prices. The result should be sorted by pizza name and price.

SELECT pizza_name, price, p.name AS pizzeria_name
FROM menu m
         LEFT JOIN person_order po ON m.id = po.menu_id
         INNER JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE menu_id IS NULL
ORDER BY 1, 2;