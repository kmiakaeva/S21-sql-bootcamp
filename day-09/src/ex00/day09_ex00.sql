CREATE TABLE person_audit
(
    created    TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
    type_event CHAR(1)                  DEFAULT 'I'               NOT NULL
        CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
    row_id     BIGINT                                             NOT NULL,
    name       VARCHAR,
    age        INTEGER,
    gender     VARCHAR,
    address    VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL AS
$BODY$
BEGIN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (current_timestamp, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$BODY$;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- check
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

SELECT *
FROM person_audit;