-- Please register a new pizza with the name "Greek pizza" (use id = 19) with the price of 800 rubles in the restaurant
-- "Dominos" (pizzeria_id = 2). Warning: this exercise is likely to cause the modification of data in the wrong way.
-- Actually, you can restore the original database model with data from the link in the "Rules of the day" section.

INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);