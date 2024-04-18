-- Please record new visits to Domino's restaurant by Denis and Irina on February 24, 2022. Warning: This exercise is
-- likely to cause the modification of data in the wrong way. Actually, you can restore the original database model
-- with data from the link in the "Rules of the Day" section and replay the script from Exercises 07 and 08.

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24');

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'), '2022-02-24');