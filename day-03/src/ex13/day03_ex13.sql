-- Write 2 SQL (DML) statements that delete all new orders from Exercise #12 based on the order date. Then delete
-- "Greek Pizza" from the menu. Warning: This exercise is likely to cause you to modify data in the wrong way.
-- Actually, you can rebuild the original database model with data from the link in the "Rules of the Day section" and
-- replay the script from Exercises 07, 08, 09, 10, 11, 12, and 13.

DELETE
FROM person_order
WHERE menu_id = (SELECT id FROM menu WHERE pizza_name = 'greek pizza')
  AND order_date = '2022-02-25';

DELETE
FROM menu
WHERE pizza_name = 'greek pizza';