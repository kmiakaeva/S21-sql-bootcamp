-- Please create a table with named nodes using structure {point1, point2, cost} and fill data based on a picture
-- (remember there are direct and reverse paths between 2 nodes). Please write a SQL statement that returns all tours
-- (aka paths) with minimum travel cost if we start from city "a". Remember, you need to find the cheapest way to visit
-- all cities and return to your starting point. For example, the tour looks like a -> b -> c -> d -> a.
--
-- Please sort the data by total_cost and then by tour.

CREATE TABLE nodes
(
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost   INTEGER NOT NULL
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);

CREATE VIEW all_tours AS
WITH RECURSIVE r_all_tours (tour, last_point, result) AS
                   (SELECT ARRAY [point1] AS tour,
                           point1         AS last_point,
                           0              AS result
                    FROM nodes n
                    WHERE n.point1 = 'a'

                    UNION

                    SELECT r.tour || ARRAY [n.point2] AS tour,
                           n.point2                   AS last_point,
                           r.result + n.cost          AS total_cost
                    FROM r_all_tours r
                             INNER JOIN nodes n ON r.last_point = n.point1
                    WHERE ARRAY_POSITION(r.tour, n.point2) IS NULL)
SELECT r.result + n.cost          AS total_cost,
       r.tour || ARRAY [n.point2] AS tour
FROM r_all_tours r
         INNER JOIN nodes n ON r.last_point = n.point1
    AND n.point2 = 'a';

WITH max_length AS (SELECT MAX(ARRAY_LENGTH(tour, 1)) AS length
                    FROM all_tours),
     min_cost AS (SELECT MIN(total_cost) AS cost
                  FROM all_tours,
                       max_length
                  WHERE ARRAY_LENGTH(tour, 1) = max_length.length)
SELECT DISTINCT total_cost, tour
FROM all_tours at,
     min_cost mc
WHERE at.total_cost = mc.cost
ORDER BY total_cost, tour;