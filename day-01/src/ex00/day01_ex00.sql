-- Please write a SQL statement that returns the menu identifier and pizza names from the menu table and the person
-- identifier and person name from the person table in one global list ordered by object_id and then by object_name columns.

SELECT id         AS object_id,
       pizza_name AS object_name
FROM menu
UNION
SELECT id   AS object_id,
       name AS object_name
FROM person
ORDER BY object_id, object_name;