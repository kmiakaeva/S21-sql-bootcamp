-- Find the names of all females over the age of 25 and sort the result by name.

SELECT name
FROM person
WHERE gender = 'female'
  AND age > 25
ORDER BY name;