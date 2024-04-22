CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
                                                              pprice NUMERIC DEFAULT 500,
                                                              pdate DATE DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                pizzeria_name pizzeria.name%TYPE
            )
    LANGUAGE PLPGSQL
AS
$BODY$
BEGIN
    RETURN QUERY
        SELECT p.name AS pizzeria_name
        FROM person pe
                 INNER JOIN person_visits pv ON pe.id = pv.person_id
                 INNER JOIN pizzeria p ON p.id = pv.pizzeria_id
                 INNER JOIN menu m ON m.pizzeria_id = p.id
        WHERE pe.name = $1
          AND m.price < $2
          AND pv.visit_date = $3
        ORDER BY p.rating DESC;
END;
$BODY$;

-- check
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');