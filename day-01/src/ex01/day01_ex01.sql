-- Please modify an SQL statement from "Exercise 00" by removing the object_id column. Then change the order by
-- object_name for part of the data from the person table and then from the menu table. Please save duplicates!

(SELECT name AS object_name
 FROM person
 ORDER BY object_name)
UNION ALL
(SELECT pizza_name AS object_name
 FROM menu
 ORDER BY object_name);