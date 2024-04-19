-- Phantom Reads Anomaly.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
--
-- Please summarize all ratings for all pizzerias in one transaction mode for Session #1 and then UPDATE the rating to 1
-- value for "Pizza Hut" restaurant in Session #2.

-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;

COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

COMMIT;

SELECT SUM(rating) FROM pizzeria;