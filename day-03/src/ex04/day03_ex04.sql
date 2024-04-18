-- Find a union of pizzerias that have orders from either women or men. In other words, you should find a set of names
-- of pizzerias that have been ordered only by women and make "UNION" operation with set of names of pizzerias that
-- have been ordered only by men. Please be careful with word "only" for both genders. For all SQL operators with sets
-- don't store duplicates (UNION, EXCEPT, INTERSECT). Please sort a result by the name of the pizzeria.

(SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN menu m ON p.id = m.pizzeria_id
          INNER JOIN person_order po ON m.id = po.menu_id
          INNER JOIN person pe ON po.person_id = pe.id
 WHERE gender = 'female'
 EXCEPT
 SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN menu m ON p.id = m.pizzeria_id
          INNER JOIN person_order po ON m.id = po.menu_id
          INNER JOIN person pe ON po.person_id = pe.id
 WHERE gender = 'male')
UNION
(SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN menu m ON p.id = m.pizzeria_id
          INNER JOIN person_order po ON m.id = po.menu_id
          INNER JOIN person pe ON po.person_id = pe.id
 WHERE gender = 'male'
 EXCEPT
 SELECT p.name AS pizzeria_name
 FROM pizzeria p
          INNER JOIN menu m ON p.id = m.pizzeria_id
          INNER JOIN person_order po ON m.id = po.menu_id
          INNER JOIN person pe ON po.person_id = pe.id
 WHERE gender = 'female')
ORDER BY 1;