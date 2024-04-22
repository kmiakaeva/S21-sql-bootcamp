CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL AS
$BODY$
BEGIN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (current_timestamp, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NULL;
END;
$BODY$;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

-- check
DELETE
FROM person
WHERE id = 10;

SELECT *
FROM person_audit;