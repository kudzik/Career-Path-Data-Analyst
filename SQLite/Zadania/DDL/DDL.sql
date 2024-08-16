-- database: ../../DB/APP.db
CREATE TABLE IF NOT EXISTS
    user (
        Id INTEGER PRIMARY KEY,
        first_name TEXT,
        last_name TEXT,
        email TEXT
    );

DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS
    'user' (
        Id INTEGER,
        first_name TEXT,
        last_name TEXT,
        email TEXT,
        PRIMARY KEY (id)
    );

INSERT INTO
    user (first_name, last_name, email)
VALUES
    ('John', 'Doe', 'johndoe@example.com');

INSERT INTO
    user (first_name, last_name, email)
VALUES
    ('Jane', 'Smith', 'janesmith@example.com');

INSERT INTO
    user (first_name, last_name, email)
VALUES
    (
        'Michael',
        'Johnson',
        'michaeljohnson@example.com'
    );

INSERT INTO
    user (first_name, last_name, email)
VALUES
    ('Emily', 'Brown', 'emilybrown@example.com');

INSERT INTO
    user (first_name, last_name, email)
VALUES
    ('William', 'Wilson', 'williamwilson@example.com');

-- Tworzenie bazy tymczasowej
CREATE TEMPORARY TABLE IF NOT EXISTS
    temp_table_name (
        ID INTEGER NOT NULL PRIMARY KEY,
        name TEXT NOT NULL
    );

-- Tworzenie nowej tabeli na podstawie zapytania
CREATE TABLE
    results as
SELECT
    *
FROM
    'user'
where
    first_name == 'John'
