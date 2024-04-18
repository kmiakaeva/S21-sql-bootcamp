-- Write a SQL statement that returns missing days for people's visits in January 2022. Use the v_generated_dates view
-- for this task and sort the result by the missing_date column.

SELECT generated_date AS missing_date
FROM v_generated_dates
WHERE generated_date NOT IN (SELECT visit_date FROM person_visits)
ORDER BY 1;