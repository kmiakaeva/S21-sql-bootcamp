-- Please register new orders from Denis and Irina on February 24, 2022 for the new menu with "Sicilian Pizza".
-- Warning: This exercise will probably cause you to change data in the wrong way. Actually, you can restore the
-- original database model with data from the link in the Rules of the Day section and replay the script from
-- Exercises 07, 08 and 09.

INSERT INTO person_order(id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id) + 1 FROM person_order),
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24');

INSERT INTO person_order(id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id) + 1 FROM person_order),
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24');