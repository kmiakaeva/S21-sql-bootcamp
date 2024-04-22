CREATE FUNCTION fnc_persons_male()
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
WHERE gender = 'male';
$BODY$;

CREATE FUNCTION fnc_persons_female()
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
WHERE gender = 'female';
$BODY$;

-- check
SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();