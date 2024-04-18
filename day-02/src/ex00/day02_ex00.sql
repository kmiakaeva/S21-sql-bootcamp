-- Write a SQL statement that returns a list of pizzerias with the corresponding rating value that have not been
-- visited by people.

SELECT p.name, p.rating
FROM pizzeria p
         LEFT JOIN person_visits pv ON p.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;