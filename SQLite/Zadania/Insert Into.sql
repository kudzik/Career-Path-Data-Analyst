-- database: ../DB/MyDB.db
INSERT INTO
    user_role (role_name, opis)
VALUES
    ('developer', 'Brak'),
    ('power user', 'Brak');

-- Tworzenie tabeli z SELECT
CREATE TABLE
    user_only AS
SELECT
    role_name,
    opis
FROM
    user_role
WHERE
    role_name LIKE '%user%';

SELECT
    rowid,
    *
FROM
    user_only;

---
-- Kopiwanie danych z instniejącej tabeli do istniejącej tabli
INSERT INTO
    tabela_docelowa (kolumna1, kolumna2)
SELECT
    kolumna1,
    kolumna2
FROM
    tabela_źródłowa
WHERE
    warunek;
