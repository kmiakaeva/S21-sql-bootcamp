-- Please write a SQL statement that returns the missing days from January 1 through January 10, 2022
-- (including all days) for visits by people with identifiers 1 or 2 (i.e., days missed by both).
-- Please order by visit days in ascending mode.

SELECT gs:: date AS missing_date
FROM (SELECT pv.visit_date FROM person_visits pv WHERE pv.person_id BETWEEN 1 and 2) AS pv
         RIGHT JOIN generate_series('2022-01-01', '2022-01-10', '1 day':: interval) AS gs ON pv.visit_date = gs
WHERE pv.visit_date IS NULL
ORDER BY missing_date;