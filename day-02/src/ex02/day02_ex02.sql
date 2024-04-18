-- Please write an SQL statement that will return the entire list of names of people who visited (or did not visit)
-- pizzerias during the period from January 1 to January 3, 2022 on one side and the entire list of names of pizzerias
-- that were visited (or did not visit) on the other side. Please note the replacement value '-' for NULL values in
-- the columns person_name and pizzeria_name. Please also add the order for all 3 columns.

SELECT COALESCE(pe.name, '-') AS person_name,
       pv.visit_date,
       COALESCE(p.name, '-')  AS pizzeria_name
FROM person pe
         FULL JOIN (SELECT * FROM person_visits pv WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv
                   ON pe.id = pv.person_id
         FULL JOIN pizzeria p ON pv.pizzeria_id = p.id
ORDER BY person_name, pv.visit_date, pizzeria_name;