-- database: ../DB/MyDB.db
DROP TABLE IF EXISTS departaments;

DROP TABLE IF EXISTS employee;

CREATE TABLE
    departaments (
        id INTEGER PRIMARY KEY,
        dept_name TEXT NOT NULL,
        dept_code TEXT NOT NULL
    );

CREATE TABLE
    employee (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        hire_date TEXT NOT NULL,
        departament_id INTEGER NOT NULL REFERENCES departaments (id)
    );

INSERT INTO
    departaments (dept_name, dept_code)
VALUES
    ('IT', 'IT01'),
    ('HR', 'HR01'),
    ('Sales', 'SL01');

INSERT INTO
    employee (name, hire_date, departament_id)
VALUES
    ('John Doe', '2022-01-01', 1),
    ('Jane Doe', '2022-02-01', 2),
    ('Peter Pan', '2022-03-01', 3),
    ('Jan Nowak', '2021-03-01', 3);
