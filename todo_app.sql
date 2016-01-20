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
ALTER TABLE tasks ALTER COLUMN updated_at DEFAULT now();

-- insert new task
INSERT INTO tasks ( title, description, created_at, updated_at, completed_at )
VALUES ( 'Study SQL', 'Complete this exercise', now(), now(), NULL );

-- create new task for title and description
INSERT INTO tasks ( title, description )
VALUES ( 'Study PostgreSQL', 'Read all the documentation' );

SELECT * FROM tasks;

-- select column_name, data_type
-- from information_schema.columns
-- where table_name = 'tasks';