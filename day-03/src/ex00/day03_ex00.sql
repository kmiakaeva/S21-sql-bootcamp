-- Please write a SQL statement that returns a list of pizza names, pizza prices, pizzeria names, and visit dates for
-- Kate and for prices ranging from 800 to 1000 rubles. Please sort by pizza, price, and pizzeria name.

SELECT pizza_name, price, p.name AS pizzeria_name, visit_date
FROM menu m
         INNER JOIN pizzeria p ON m.pizzeria_id = p.id
         INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
         INNER JOIN person pe ON pv.person_id = pe.id
WHERE pe.name = 'Kate'
  AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;