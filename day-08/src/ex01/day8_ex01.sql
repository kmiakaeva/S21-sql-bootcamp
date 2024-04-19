-- Lost Update Anomaly.
--
-- We need two active sessions (i.e. 2 parallel sessions in the command line).
--
-- Before running a task, make sure you are at a standard isolation level in your database. Just run the following
-- statement SHOW TRANSACTION ISOLATION LEVEL; and the result should be "read committed".
-- If not, please set the read committed isolation level explicitly on a session level.
--
-- Please check a rating for "Pizza Hut" in a transaction mode for both sessions and then make an UPDATE of the rating
-- to a value of 4 in Session #1 and make an UPDATE of the rating to a value of 3.6 in Session #2

-- ISOLATION LEVEL READ COMMITTED - if another transaction makes changes and commits them after the start of the current
-- transaction, those changes will not be visible within the scope of the current transaction until it is completed (COMMIT).

-- session #1
BEGIN TRANSACTION;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- session #2
BEGIN TRANSACTION;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- will not work until the transaction for 1 session is completed via COMMIT
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';