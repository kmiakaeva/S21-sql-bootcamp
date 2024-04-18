-- Don’t use window functions like ROW_NUMBER( )
-- Don’t use atomic INSERT statements |
-- Please register new orders of all persons for "Greek pizza" on February 25, 2022. Warning: This exercise will probably
-- cause you to change data in the wrong way. Actually, you can restore the original database model with data from the
-- link in the "Rules of the Day" section and replay the script from Exercises 07, 08, 09, 10 and 11.

INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) FROM person_order) + gs                AS id,
       p.id                                                   AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25'                                           AS order_date
FROM person p
         INNER JOIN generate_series(1, (SELECT COUNT(*) FROM person)) AS gs ON p.id = gs;

SELECT COUNT(*) = 9 AS check
FROM person_order po
WHERE menu_id = (SELECT id FROM menu WHERE pizza_name = 'greek pizza')
  AND order_date = '2022-02-25';