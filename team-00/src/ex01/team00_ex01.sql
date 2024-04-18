-- Please add a way to see additional rows with the most expensive cost to the SQL from the previous exercise.
-- Please sort the data by total_cost and then by trip.

WITH max_length AS (SELECT MAX(ARRAY_LENGTH(tour, 1)) AS length
                    FROM all_tours),
     min_cost AS (SELECT MIN(total_cost) AS cost
                  FROM all_tours,
                       max_length
                  WHERE ARRAY_LENGTH(tour, 1) = max_length.length),
     max_cost AS (SELECT MAX(total_cost) AS cost
                  FROM all_tours,
                       max_length
                  WHERE ARRAY_LENGTH(tour, 1) = max_length.length)
SELECT DISTINCT total_cost, tour
FROM all_tours at,
     at min_cost mc, max_cost mac
WHERE at.total_cost = mc.cost OR at.total_cost = mac.cost
ORDER BY total_cost, tour;