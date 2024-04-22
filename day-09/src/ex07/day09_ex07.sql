CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) RETURNS NUMERIC
    LANGUAGE SQL
AS
$BODY$
SELECT MIN($1[i])
FROM generate_subscripts($1, 1) g(i);
$BODY$;

-- check
SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);