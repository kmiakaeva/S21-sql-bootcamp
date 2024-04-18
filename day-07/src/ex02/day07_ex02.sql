-- Please write a SQL statement to see 3 favorite restaurants by visits and by orders in a list (please add an action_type
-- column with values 'order' or 'visit', it depends ON the data from the corresponding table). The result should be sorted
-- in ascending order by the action_type column and in descending order by the count column.

(SELECT name, COUNT(*), 'order' AS action_type
 FROM person_order po
          INNER JOIN menu m ON m.id = po.menu_id
          INNER JOIN pizzeria p ON p.id = m.pizzeria_id
 GROUP BY name
 ORDER BY 2 DESC
 LIMIT 3)
UNION
(SELECT name, COUNT(*), 'visit' AS action_type
 FROM person_visits pv
          INNER JOIN pizzeria p ON p.id = pv.pizzeria_id
 GROUP BY name
 ORDER BY 2 DESC
 LIMIT 3)
ORDER BY 3, 2 DESC;