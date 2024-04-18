-- Create a new BTree index named idx_1 that should improve the "Execution Time" metric of this SQL.
-- Provide evidence (EXPLAIN ANALYZE) that the SQL has been improved.
--
-- Hint: This exercise looks like a "brute force" task to find a good cover index, so before your new test, remove the idx_1 index.

DROP INDEX IF EXISTS idx_1;

CREATE INDEX idx_1 ON pizzeria (rating);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT m.pizza_name                     AS pizza_name,
       max(rating) OVER (PARTITION BY rating
           ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING
               AND UNBOUNDED FOLLOWING) AS k
FROM menu m
         INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;