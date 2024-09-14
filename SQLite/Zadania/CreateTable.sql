-- database: ../DB/MyDB.db
DROP TABLE IF EXISTS user;

CREATE TABLE
    user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT,
        last_name TEXT,
        email TEXT UNIQUE,
        country TEXT DEFAULT 'Poland',
        added_date DATE DEFAULT CURRENT_DATE
    );

INSERT INTO
    user (first_name, last_name, email)
VALUES
    ('Paweł', 'Nowak', 'pawel.nowak@data.org');

INSERT INTO
    user (first_name, last_name, email, country, added_date)
VALUES
    (
        'Paweł',
        'Nowak',
        'pawel.nowak5@data.org',
        'Romania',
        'ddd'
    );

---
DROP TABLE system_user;

DROP TABLE user_role;

CREATE TABLE IF NOT EXISTS
    system_user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT,
        last_name TEXT,
        email TEXT NOT NULL,
        user_group_id INTEGER,
        FOREIGN KEY (user_group_id) REFERENCES user_role (id)
    );

CREATE TABLE IF NOT EXISTS
    user_role (
        id INTEGER NOT NULL PRIMARY KEY,
        role_name TEXT NOT NULL
    );

INSERT INTO
    user_role (role_name)
VALUES
    ('admin'),
    ('user'),
    ('tester');

INSERT INTO
    system_user (first_name, last_name, email, user_group_id)
VALUES
    ('John', 'Doe', 'john@mail.com', 1),
    ('Anna', 'Nowak', 'anna@mail.com', 2),
    ('Bill', 'Gates', 'tom@mail.com', 3);

DELETE FROM user_role
where
    role_name == 'tester';

--------
DROP TABLE users;

DROP TABLE user_role;

CREATE TABLE
    user_role (
        id INT NOT NULL UNIQUE PRIMARY KEY,
        role_name TEXT NOT NULL UNIQUE
    );

CREATE TABLE
    users (
        id INT NOT NULL UNIQUE PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        id_role INT NOT NULL,
        FOREIGN KEY (id_role) REFERENCES user_role (id)
    );

-----
CREATE TABLE
    user_role (
        id_role INTEGER NOT NULL UNIQUE,
        role_name TEXT NOT NULL UNIQUE,
        PRIMARY KEY (id_role AUTOINCREMENT)
    );

CREATE TABLE
    users (
        id_user INTEGER NOT NULL UNIQUE,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        id_role INTEGER NOT NULL,
        PRIMARY KEY (id_user AUTOINCREMENT),
        FOREIGN KEY (id_role) REFERENCES user_role (id_role)
    );
