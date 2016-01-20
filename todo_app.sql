DROP USER IF EXISTS Michael;

CREATE USER Michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id integer NOT NULL PRIMARY KEY,
  title character varying(255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL false
  );

-- ALTER TABLE tasks DROP COLUMN completed;