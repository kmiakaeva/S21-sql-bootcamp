-- Deadlock.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
--
-- Please write any SQL statement with any isolation level (you can use the default setting) on the table pizzeria to
-- reproduce this deadlock situation.

-- session #1
BEGIN TRANSACTION;

UPDATE pizzeria SET rating = 5 WHERE id = 1;
UPDATE pizzeria SET rating = 4 WHERE id = 2;

COMMIT;

-- session #2
BEGIN TRANSACTION;

UPDATE pizzeria SET rating = 5 WHERE id = 2;
UPDATE pizzeria SET rating = 4 WHERE id = 1;

COMMIT;