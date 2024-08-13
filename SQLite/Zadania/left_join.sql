-- database: ../DB/northwind.db
DROP TABLE IF EXISTS user_group;

DROP TABLE IF EXISTS user;

CREATE TABLE
       user_group (id INTEGER PRIMARY KEY, group_name TEXT NOT NULL);

CREATE TABLE
       user (
              id INTEGER PRIMARY KEY,
              first_name TEXT,
              last_name TEXT,
              email TEXT UNIQUE,
              user_group_id INTEGER NOT NULL
       );

INSERT INTO
       user_group (group_name)
VALUES
       ('admin'),
       ('user'),
       ('tester'),
       ('developer');

INSERT INTO
       user (first_name, last_name, email, user_group_id)
VALUES
       ('John', 'Smith', 'john.smith@data.org', 1),
       ('John', 'Doe', 'john.doe@data.org', 2),
       ('Philip', 'Smith', 'philip.smith@data.org', 3),
       ('Adam', 'Nowak', 'adam.nowak@data.org', 10),
       ('Mark', 'Govic', 'mark.govic@data.org', 9);

SELECT
       *
FROM
       user_group;

SELECT
       *
FROM
       user;

SELECT
       *
FROM
       user
       LEFT JOIN user_group ON user.user_group_id = user_group.id;

SELECT
       *
FROM
       user
       LEFT JOIN user_group ON user.user_group_id = user_group.id;

SELECT
       first_name,
       last_name,
       group_name
FROM
       user
       LEFT JOIN user_group ON user.user_group_id = user_group.id;

SELECT
       user.id,
       user_group.id,
       first_name,
       last_name,
       group_name
FROM
       user
       LEFT JOIN user_group ON user.user_group_id = user_group.id;

SELECT
       t1.id,
       t2.id,
       first_name,
       last_name,
       group_name
FROM
       user AS t1
       LEFT JOIN user_group AS t2 ON t1.user_group_id = t2.id;

SELECT
       t1.id,
       t2.id,
       t1.first_name,
       t1.last_name,
       t2.group_name AS sector
FROM
       user AS t1
       LEFT JOIN user_group AS t2 ON t1.user_group_id = t2.id;

SELECT
       t1.first_name,
       t1.last_name,
       t2.group_name AS sector
FROM
       user AS t1
       LEFT JOIN user_group AS t2 ON t1.user_group_id = t2.id
ORDER BY
       1,
       2;
