-- Simple transaction.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
-- Session #1
--
-- Update of rating for "Pizza Hut" to 5 points in a transaction mode.
-- Check that you can see a changes in session #1.
--
-- Session #2
--
-- Check that you can’t see a changes in session #2.
--
-- Session #1
--
-- Publish your changes for all parallel sessions.
--
-- Session #2
--
-- Check that you can see a changes in session #2.

-- session #1
BEGIN TRANSACTION;

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

-- session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';