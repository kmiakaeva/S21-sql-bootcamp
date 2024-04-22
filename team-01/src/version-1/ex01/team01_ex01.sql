insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT COALESCE(u.name, 'not defined')     AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name                              AS currency_name,
       balance.money * c.rate_to_usd       AS currency_in_usd
FROM balance
         LEFT JOIN "user" AS u ON balance.user_id = u.id
         INNER JOIN currency AS c
                    ON (balance.currency_id = c.id
                        AND c.updated = COALESCE(
                                (SELECT MAX(c1.updated)
                                 FROM currency AS c1
                                 WHERE c.id = c1.id
                                   AND balance.updated >= c1.updated
                                 GROUP BY c1.id),
                                (SELECT MIN(c2.updated)
                                 FROM currency AS c2
                                 WHERE c.id = c2.id
                                   AND balance.updated < c2.updated
                                 GROUP BY c2.id)))
ORDER BY name DESC, lastname, currency_name;