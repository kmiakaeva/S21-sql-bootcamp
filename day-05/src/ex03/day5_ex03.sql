-- Please create a better multi-column B-Tree index named idx_person_order_multi.
--
-- The EXPLAIN ANALYZE command should return the next pattern. Please pay attention to "Index Only Scan" scanning!
-- Index Only Scan using idx_person_order_multi on person_order ...

CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYSE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8
  AND menu_id = 19;