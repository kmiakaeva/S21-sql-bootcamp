-- Please write a SQL statement that returns a difference (minus) of person_id column values while saving duplicates
-- between person_order table and person_visits table for order_date and visit_date are for January 7, 2022.

SELECT person_id
FROM person_order
WHERE order_date = '2022-01-07'
EXCEPT ALL
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-07';