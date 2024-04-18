-- Please create a Database View v_price_with_discount that returns the orders of a person with person name, pizza name,
-- real price and calculated column discount_price (with applied 10% discount and satisfying formula price - price*0.1).
-- Please sort the result by person names and pizza names and convert the discount_price column to integer type.

CREATE VIEW v_price_with_discount AS
SELECT name,
       pizza_name,
       price,
       ROUND(price - (price * 0.1)) AS discount_price
FROM person_order po
         INNER JOIN menu m ON po.menu_id = m.id
         INNER JOIN person p ON po.person_id = p.id
ORDER BY 1, 2;

-- for checking
SELECT *
FROM v_price_with_discount;

-- delete view
DROP VIEW v_price_with_discount;