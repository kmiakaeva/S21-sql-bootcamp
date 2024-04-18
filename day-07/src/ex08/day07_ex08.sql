-- We know personal addresses from our data. Let's assume that this person only visits pizzerias in his city. Write a SQL
-- statement that returns the address, the name of the pizzeria, and the amount of the person's orders. The result should
-- be sorted by address and then by restaurant name.

SELECT pe.address, p.name, COUNT(*) AS count_of_orders
FROM person_order po
         INNER JOIN menu m ON m.id = po.menu_id
         INNER JOIN pizzeria p ON m.pizzeria_id = p.id
         INNER JOIN person pe ON pe.id = po.person_id
GROUP BY pe.address, p.name
ORDER BY 1, 2;