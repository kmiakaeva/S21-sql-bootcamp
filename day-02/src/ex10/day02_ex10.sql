-- Find the names of people who live at the same address. Make sure the result is sorted by 1st person's name,
-- 2nd person's name, and shared address.

SELECT pe1.name    AS person_name1,
       pe2.name    AS person_name2,
       pe1.address AS common_address
FROM person pe1
         INNER JOIN person pe2 ON pe1.address = pe2.address AND pe1.id > pe2.id
ORDER BY 1, 2, 3;