-- Please create a partially unique BTree index named idx_person_order_order_date on the person_order table for the
-- person_id and menu_id attributes with partial uniqueness for the order_date column for the date '2022-01-01'.
--
-- The EXPLAIN ANALYZE command should return the next pattern.
-- Index Only Scan using idx_person_order_order_date on person_order …

CREATE UNIQUE INDEX idx_person_order_order_dat ON person_order (person_id, menu_id)
    WHERE order_date = '2022-01-01';

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT person_id
FROM person_order
WHERE menu_id = 13
  AND order_date = '2022-01-01';