WITH currencies AS
         (SELECT currency.id,
                 currency.name AS currency_name,
                 currency.rate_to_usd,
                 updated       AS last_update
          FROM currency
                   JOIN (SELECT id, MAX(updated) AS last_update
                         FROM currency
                         GROUP BY id) AS tmp
                        ON tmp.last_update = currency.updated AND tmp.id = currency.id)
SELECT COALESCE("user".name, 'not defined')              AS name,
       COALESCE("user".lastname, 'not defined')          AS lastname,
       balance.type,
       SUM(money)                                        AS volume,
       COALESCE(currencies.currency_name, 'not defined') AS currency_name,
       COALESCE(currencies.rate_to_usd, 1)               AS last_rate_to_usd,
       SUM(money) * COALESCE(currencies.rate_to_usd, 1)  AS total_volume_in_usd
FROM balance
         FULL OUTER JOIN "user" ON "user".id = balance.user_id
         FULL OUTER JOIN currencies ON currencies.id = balance.currency_id
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name DESC, lastname, type;