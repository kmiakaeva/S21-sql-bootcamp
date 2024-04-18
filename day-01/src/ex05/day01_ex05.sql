-- Please write a SQL statement that returns all possible combinations between person and pizzeria tables, and please
-- set the order of the person identifier columns and then the pizzeria identifier columns. Please note that the column
-- names may be different for you.

SELECT *
FROM person pe
         CROSS JOIN pizzeria p
ORDER BY pe.id, p.id;