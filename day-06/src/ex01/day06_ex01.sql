-- Please write a DML statement that makes inserts new records into the person_discounts table based on the following rules.
--
-- Take aggregated state from person_id and pizzeria_id columns.
--
-- Calculate personal discount value by the next pseudo code:
--
-- if “amount of orders” = 1 then “discount” = 10.5 else if “amount of orders” = 2 then “discount” = 22 else “discount” = 30
--
-- To create a primary key for the person_discounts table, use the following SQL construct (this construct is from the
-- WINDOW FUNCTION SQL section).
--
-- ... ROW_NUMBER( ) OVER ( ) AS id ...

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id,
       po.person_id,
       m.pizzeria_id,
       CASE
           WHEN COUNT(*) = 1 THEN 10.5
           WHEN COUNT(*) = 2 THEN 22
           ELSE 30
           END              AS discount
FROM person_order po
         INNER JOIN menu m ON m.id = po.menu_id
GROUP BY po.person_id, m.pizzeria_id;
