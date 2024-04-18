-- Before proceeding, please write an SQL statement that returns pizzas and the corresponding pizzeria names.
-- The sample proof is the output of the EXPLAIN ANALYZE command.
-- ...
-- ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
-- ...

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYSE
SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
         INNER JOIN pizzeria p ON m.pizzeria_id = p.id;