insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION nearest_date(i TIMESTAMP, j INTEGER, k INTEGER)
    RETURNS NUMERIC
AS
$$
BEGIN
    RETURN (
        CASE
            WHEN k = 1 THEN
                (SELECT rate_to_usd
                 FROM currency
                 WHERE id = j
                   AND updated = (SELECT MAX(updated) AS date FROM currency WHERE updated <= i AND id = j))
            ELSE (SELECT rate_to_usd
                  FROM currency
                  WHERE id = j
                    AND updated = (SELECT MIN(updated) AS date FROM currency WHERE updated >= i AND id = j))
            END
        );
END;
$$ LANGUAGE 'plpgsql';

WITH currency_names AS
             (SELECT currency.id, currency.name FROM currency GROUP BY id, name)
SELECT COALESCE("user".name, 'not defined')                            AS name,
       COALESCE("user".lastname, 'not defined')                        AS lastname,
       currency_names.name                                             AS currency_name,
       balance.money *
       COALESCE(nearest_date(balance.updated, balance.currency_id, 1),
                nearest_date(balance.updated, balance.currency_id, 0)) AS currency_in_usd
FROM balance
         FULL OUTER JOIN "user" ON "user".id = balance.user_id
         JOIN currency_names ON balance.currency_id = currency_names.id
ORDER BY name DESC, lastname, currency_name;

-- DROP FUNCTION nearest_past_date;
-- DROP FUNCTION nearest_future_date;
