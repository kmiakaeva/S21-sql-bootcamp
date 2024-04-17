-- Please make 2 syntax different select statements which return a list of pizzerias
-- (pizzeria name and rating) with rating between 3.5 and 5 points (including limit points)
-- and ordered by pizzeria rating.
--
-- the 1st select statement must contain comparison signs (<=, >=);
-- the 2nd select statement must contain BETWEEN keyword.

SELECT name, rating
FROM pizzeria
WHERE rating >= 3.5
  AND rating <= 5
ORDER BY rating;

SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;