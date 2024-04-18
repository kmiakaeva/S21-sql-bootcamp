-- Please add the following constraint rules for existing columns of the person_discounts table.
--
-- person_id column should not be NULL (use constraint name ch_nn_person_id);
-- pizzeria_id column should not be NULL (use constraint name ch_nn_pizzeria_id);
-- discount column should not be NULL (use constraint name ch_nn_discount);
-- discount column should be 0 percent by default;
-- discount column should be in a range values from 0 to 100 (use constraint name ch_range_discount).

ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL);

ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL);

ALTER TABLE person_discounts
    ADD CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL);

ALTER TABLE person_discounts
    ALTER COLUMN discount SET DEFAULT 0;

ALTER TABLE person_discounts
    ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100);
