-- Let's make a simple aggregation, please write a SQL statement that returns person identifiers and corresponding number
-- of visits in any pizzerias and sorts by number of visits in descending mode and sorts by person_id in ascending mode.

SELECT person_id, COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1;