-- Please write a SQL statement that returns the number of orders, the average price, the maximum price and the minimum price
-- for pizzas sold by each pizzeria restaurant. The result should be sorted by pizzeria name.
-- Round the average price to 2 floating numbers.

SELECT p.name,
       COUNT(p.name)          AS count_of_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price)           AS max_price,
       MIN(m.price)           AS min_price
FROM person_order po
         INNER JOIN menu m
                    ON m.id = po.menu_id
         INNER JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY p.name;