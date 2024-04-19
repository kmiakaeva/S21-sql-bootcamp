-- Let's refresh the data in our Materialized View mv_dmitriy_visits_and_eats from Exercise #06. Before this action,
-- please create another Dmitriy visit that satisfies the SQL clause of the Materialized View except pizzeria, which we
-- can see in a result from Exercise #06. After adding a new visit, please update a data state for mv_dmitriy_visits_and_eats.

INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        ((SELECT p.id
          FROM pizzeria p
                   INNER JOIN menu m ON p.id = m.pizzeria_id
          WHERE m.price < 800)
         EXCEPT
         (SELECT p.id
          FROM pizzeria p
                   INNER JOIN mv_dmitriy_visits_and_eats mdvae ON p.name = mdvae.pizzeria_name)
         ORDER BY 1
         LIMIT 1), '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- for checking
SELECT *
FROM person_visits;

SELECT *
FROM mv_dmitriy_visits_and_eats;

-- delete visit
DELETE
FROM person_visits
WHERE person_id = (SELECT id FROM person WHERE name = 'Dmitriy')
  AND pizzeria_id = 3
  AND visit_date = '2022-01-08';