-- Lost Update for Repeatable Read.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
--
-- Please check a rating for "Pizza Hut" in a transaction mode for both sessions and then make an UPDATE of the rating to a
-- value of 4 in Session #1 and make an UPDATE of the rating to a value of 3.6 in Session #2.

-- ISOLATION LEVEL REPEATABLE READ - guarantees that all data reads within a transaction will see the same data, even if
-- other transactions make changes to that data.

-- session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';