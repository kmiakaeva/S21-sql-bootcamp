-- Find all menu identifiers that are not ordered by anyone.

SELECT m.id AS menu_id
FROM menu m
         LEFT JOIN person_order po ON m.id = po.menu_id
WHERE menu_id IS NULL
ORDER BY 1;