DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
    RETURNS TABLE
            (
                id      person.id%TYPE,
                name    person.name%TYPE,
                age     person.age%TYPE,
                gender  person.gender%TYPE,
                address person.address%TYPE
            )
    LANGUAGE SQL
AS
$BODY$
SELECT *
FROM person
WHERE gender = $1;
$BODY$;

-- check
SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();