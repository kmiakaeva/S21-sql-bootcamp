-- Please write a simple SQL query that returns a list of unique person names who have placed orders at any pizzerias.
-- The result should be sorted by person name.

SELECT DISTINCT name
FROM person pe
         INNER JOIN person_order po ON pe.id = po.person_id
ORDER BY 1;