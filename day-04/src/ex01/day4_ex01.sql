-- Please use 2 Database Views from Exercise #00 and write SQL to get female and male person names in one list.
-- Please specify the order by person name.

SELECT name
FROM v_persons_female
UNION
SELECT name
FROM v_persons_male
ORDER BY 1;