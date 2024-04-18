-- Write an SQL statement that returns common rows for attributes order_date, person_id from the person_orders table
-- on one side and visit_date, person_id from the person_visits table on the other side. In other words, let's find
-- the identifiers of persons who visited and ordered a pizza on the same day. Actually, please add the order by
-- action_date in ascending mode and then by person_id in descending mode.

SELECT order_date AS action_date,
       person_id
FROM person_order
INTERSECT ALL
SELECT visit_date AS action_date,
       person_id
FROM person_visits
ORDER BY action_date, person_id DESC;