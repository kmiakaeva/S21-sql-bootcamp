-- To comply with Data Governance Policies, you need to add comments for the table and the table's columns. Let's apply
-- this policy to the person_discounts table. Please add English or Russian comments (it is up to you) explaining what
-- is a business goal of a table and all its attributes.

COMMENT ON TABLE person_discounts IS 'Discounts for person';
COMMENT ON COLUMN person_discounts.id IS 'Id field';
COMMENT ON COLUMN person_discounts.person_id IS 'Person id field';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria id field';
COMMENT ON COLUMN person_discounts.discount IS 'Person discount (percentage) in a pizzeria';