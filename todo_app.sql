DROP USER IF EXISTS Michael;

CREATE USER Michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title character varying(255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL DEFAULT false
  );

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp NULL DEFAULT NULL;

-- to change column to not allow Null values and have default value of now()
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

-- insert new task
INSERT INTO tasks ( title, description, created_at, updated_at, completed_at )
VALUES ( 'Study SQL', 'Complete this exercise', now(), now(), NULL );

-- create new task for title and description
INSERT INTO tasks ( title, description )
VALUES ( 'Study PostgreSQL', 'Read all the documentation' );

-- select all the titles of tasks that are not yet completed
SELECT title FROM tasks WHERE completed_at IS NULL;

-- update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks
SET completed_at= now()
WHERE title= 'Study SQL';

-- select all titles and descriptions of tasks that are not yet completed
SELECT title, description FROM tasks WHERE completed_at IS NULL;

-- select all fields of every task sorted by creation date in descending order
SELECT * FROM tasks
ORDER BY created_at DESC;

-- create a new task
-- title = 'mistake 1'
-- description = 'a test entry'
INSERT INTO tasks ( title, description )
VALUES ( 'mistake 1', 'a test entry' );

-- create a new task
-- title = 'mistake 2'
-- description = 'another test entry'
INSERT INTO tasks ( title, description )
VALUES ( 'mistake 2', 'another test entry' );

-- create a new task
-- title = 'third mistake'
-- description = 'another test entry'
INSERT INTO tasks ( title, description )
VALUES ( 'third mistake', 'another test entry' );

-- select title fields of all tasks with a title that includes the word 'mistake'
SELECT * FROM tasks
WHERE title LIKE '%mistake%';

-- delete the task that has a title of mistake 1
DELETE FROM tasks
WHERE title= 'mistake 1';

-- select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description FROM tasks
WHERE title LIKE '%mistake%';

-- delete all tasks that includes the word 'mistake' in the title
DELETE FROM tasks
WHERE title LIKE '%mistake%';

 \dt

SELECT * FROM tasks;

-- select column_name, data_type
-- from information_schema.columns
-- where table_name = 'tasks';