-- Non-Repeatable Reads Anomaly.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
-- Please check a rating for "Pizza Hut" in a transaction mode for Session #1 and then make an UPDATE of the rating to
-- a value of 3.6 in Session #2
--
-- NON-REPEATABLE READ - this is a situation where within a single transaction, subsequent reads of data can yield different
-- results due to changes made by other transactions between these reads.

-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';