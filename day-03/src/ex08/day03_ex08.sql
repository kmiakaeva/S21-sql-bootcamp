-- Please register a new pizza with the name "Sicilian pizza" (whose id should be calculated by the formula "maximum
-- id value + 1") with the price of 900 rubles in the restaurant "Dominos" (please use internal query to get the
-- identifier of the pizzeria). Warning: This exercise is likely to cause the modification of data in the wrong way.
-- Actually, you can restore the original database model with data from the link in the "Rules of the day" section and
-- replay the script from Exercise 07.

INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES ((SELECT MAX(id) + 1 FROM menu),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        'sicilian pizza',
        900);