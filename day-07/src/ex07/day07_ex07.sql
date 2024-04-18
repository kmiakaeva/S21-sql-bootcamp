-- Write an SQL statement that returns a common average rating (the output attribute name is global_rating) for all restaurants.
-- Round your average rating to 4 floating point numbers.

SELECT ROUND(AVG(rating), 4) AS global_rating
FROM pizzeria;