-- Write an SQL statement to see how restaurants are grouped by visits and by orders, and joined together by restaurant name.
-- You can use the internal SQL from Exercise 02 (Restaurants by Visits and by Orders) without any restrictions on the number of rows.
-- In addition, add the following rules.
--
-- Compute a sum of orders and visits for the corresponding pizzeria (note that not all pizzeria keys are represented in both tables).
-- Sort the results by the total_count column in descending order and by the name column in ascending order.

SELECT COALESCE(po.name, pv.name)                    AS name,
       COALESCE(po.count, 0) + COALESCE(pv.count, 0) AS total_count
FROM (SELECT p.name, COUNT(*) AS count
      FROM person_order po
               INNER JOIN menu m ON m.id = po.menu_id
               INNER JOIN pizzeria p ON p.id = m.pizzeria_id
      GROUP BY p.name) AS po
         FULL OUTER JOIN (SELECT p.name, COUNT(*) AS count
                          FROM person_visits pv
                                   INNER JOIN pizzeria p ON p.id = pv.pizzeria_id
                          GROUP BY p.name) AS pv ON po.name = pv.name
ORDER BY total_count DESC, name;