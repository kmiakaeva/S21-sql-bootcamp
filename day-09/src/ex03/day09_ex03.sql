DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_update_audit();
DROP FUNCTION fnc_trg_person_delete_audit();

TRUNCATE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL AS
$BODY$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        VALUES (current_timestamp, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    ELSEIF TG_OP = 'UPDATE' THEN
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        VALUES (current_timestamp, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    ELSE
        INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
        VALUES (current_timestamp, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    END IF;
    RETURN NULL;
END;
$BODY$;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

-- check
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE
FROM person
WHERE id = 10;

SELECT *
FROM person_audit
ORDER BY created;