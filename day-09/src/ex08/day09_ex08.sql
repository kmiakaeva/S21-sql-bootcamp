CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
    RETURNS TABLE
            (
                current BIGINT
            )
    LANGUAGE SQL
AS
$BODY$
WITH RECURSIVE f (current, next) AS
                   (SELECT 0::BIGINT, 1::BIGINT
                    UNION ALL
                    SELECT f.next, f.current + f.next
                    FROM f
                    WHERE f.next < pstop)
SELECT current
FROM f;
$BODY$;

-- check
SELECT *
FROM fnc_fibonacci(100);

SELECT *
FROM fnc_fibonacci(20);