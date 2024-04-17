-- Use the SQL construction from Exercise 05 and add a new calculated column
-- (use column name ‘check_name’) with a check statement a pseudocode for this check is given below)
-- in the SELECT clause.
--
-- if (person_name == 'Denis') then return true
-- else return false

SELECT (SELECT name
        FROM person
        WHERE id = person_order.person_id) AS name,
       CASE
           WHEN (SELECT name
                 FROM person
                 WHERE id = person_order.person_id) = 'Denis' THEN true
           ELSE false
           END                             AS check_name
FROM person_order
WHERE (
    menu_id = 13
        OR menu_id = 14
        OR menu_id = 18
    )
  AND order_date = '2022-01-07';