WITH r_currency AS (SELECT id, MAX(updated) AS updated
                    FROM currency
                    GROUP BY id),
     s_currency AS (SELECT *
                    FROM currency AS c
                             INNER JOIN r_currency AS rc USING (id, updated)),
     s_balance AS (SELECT user_id, SUM(money) AS money, type, currency_id
                   FROM balance AS b
                   GROUP BY user_id, type, currency_id)
SELECT COALESCE(u.name, 'not defined')                AS name,
       COALESCE(u.lastname, 'not defined')            AS lastname,
       b.type,
       b.money                                         AS volume,
       COALESCE(sc.name, 'not defined')               AS currency_name,
       COALESCE(sc.rate_to_usd, 1)                     AS last_rate_to_usd,
       b.money * COALESCE(sc.rate_to_usd, 1) AS total_volume_in_usd
FROM "user" AS u
         FULL JOIN s_balance AS b
                   ON b.user_id = u.id
         FULL JOIN s_currency AS sc ON sc.id = b.currency_id
ORDER BY name DESC, lastname, type;