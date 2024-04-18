-- Write an SQL statement that returns unique pizza names from the menu table and sorts them by the pizza_name column
-- in descending order. Please note the Denied section.

SELECT pizza_name
FROM menu
UNION
SELECT pizza_name
FROM menu
ORDER BY pizza_name DESC;