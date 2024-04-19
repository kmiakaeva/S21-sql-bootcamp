-- Non-Repeatable Reads for Serialization.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
--
-- Please check a rating for "Pizza Hut" in a transaction mode for Session #1, and then make an UPDATE of the rating to a
-- value of 3.0 in Session #2.
--
-- ISOLATION LEVEL SERIALIZABLE - the results of concurrently executing transactions will be the same as if they were executed
-- sequentially, without simultaneous execution.

-- session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';