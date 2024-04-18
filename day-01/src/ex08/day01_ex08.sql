-- Please rewrite a SQL statement from Exercise #07 by using NATURAL JOIN construction.
-- The result must be the same like for Exercise #07.

SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM person_order
         NATURAL JOIN (SELECT id AS person_id, name, age FROM person) person
ORDER BY order_date, person_information;