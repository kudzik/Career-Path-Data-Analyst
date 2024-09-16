-- database: ../DB/MyDB.db
-- Usuń tabelę customer jeśli istnieje. Użyj odpowiedniego polecenia.
DROP TABLE IF EXISTS customer;

-- Utwórz tabelę o nazwie customer posiadającą kolumny
--    * id - liczba całkowita, klucz główny 
--    * first_name - tekst, nie może być wartością NULL
--    * last_name - tekst, nie może być wartością NULL
--    * age - liczba całkowita, dodatnia, może być wartością NULL
CREATE TABLE
    customer (
        id INTEGER NOT NULL PRIMARY KEY,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        age INTEGER NOT NULL
    );

-- Wstaw jeden rekord do tabeli customer przekazując wartości dla wszystkich kolumn:
--     * 1
--     * 'Paul'
--     * 'Smith'
--     * 40
INSERT INTO
    customer (id, first_name, last_name, age)
VALUES
    (1, 'Paul', 'Smith', 40);

-- Wyświetl zawartość tabeli customer
SELECT
    *
FROM
    customer;

-- Wstaw jeden rekord do tabeli customer przekazując wartości dla kolumn:
--     * first_name -> 'John'
--     * last_name -> 'Murphy'
--     * age -> 24
INSERT INTO
    customer (first_name, last_name, age)
VALUES
    ('John', 'Murphy', 24);

-- Wyświetl zawartość tabeli customer
SELECT
    *
FROM
    customer;

-- Wstaw dwa rekordy do tabeli customer przekazując odpowiednio wartości:
--     * ('Michael', 'Scott', 24)
--     * ('Louis', 'Beck', 37)
-- Do wykonania tego ćwiczenia użyj jednego polecenia INSERT.
INSERT INTO
    customer (first_name, last_name, age)
VALUES
    ('Michael', 'Scott', 24),
    ('Louis', 'Beck', 37);

-- Wyświetl zawartość tabeli customer
SELECT
    *
FROM
    customer;

-- Zmodyfikuj wartość kolumny age dla rekordu o id == 3 na wartość 25. W odpowiedzi
UPDATE customer
SET
    age = 25
WHERE
    id == 3;

-- wyświetl tabelę.
SELECT
    *
FROM
    customer;

-- Usuń z tabeli customer rekord o id == 2. W odpowiedzi wyświetl tabelę.
DELETE FROM customer
WHERE
    id == 2;

-- Usuń wszystkie rekordy w tabeli customer.
DELETE FROM customer;

-- Usuń tabelę customer.
DROP TABLE IF EXISTS customer;
