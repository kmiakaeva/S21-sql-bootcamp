-- Write an SQL statement that returns the order date from the person_order table and the corresponding person name
-- who made an order from the person table. Add a sort by both columns in ascending order.

SELECT order_date,
       CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order
         INNER JOIN person ON person_order.person_id = person.id
ORDER BY order_date, person_information;