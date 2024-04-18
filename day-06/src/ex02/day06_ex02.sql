-- Write a SQL statement that returns the orders with actual price and price with discount applied for each person in the
-- corresponding pizzeria restaurant, sorted by person name and pizza name.

SELECT pe.name,
       m.pizza_name,
       m.price,
       (m.price - m.price * (pd.discount / 100)) AS discount_price,
       p.name                                    AS pizzeria_name
FROM person_order po
         INNER JOIN menu m on m.id = po.menu_id
         INNER JOIN person_discounts pd on pd.person_id = po.person_id AND pd.pizzeria_id = m.pizzeria_id
         INNER JOIN person pe on pe.id = po.person_id
         INNER JOIN pizzeria p on p.id = m.pizzeria_id
ORDER BY 1, 2;