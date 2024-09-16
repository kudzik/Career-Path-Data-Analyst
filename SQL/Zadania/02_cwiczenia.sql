-- database: ../DB/MyDB.db
-- Usuń tabelę tymczasową company jeśli istnieje. Użyj odpowiedniego polecenia.
DROP TABLE IF EXISTS company;

-- Utwórz tabelę tymczasową o nazwie company posiadającą kolumny
--    * id - liczba całkowita, klucz główny 
--    * company_name - tekst, nie może być wartością NULL
--    * country - tekst z domyślną wartością 'Poland'
CREATE TEMPORARY TABLE
    company (
        id INTEGER NOT NULL PRIMARY KEY,
        company_name TEXT NOT NULL,
        country TEXT DEFAULT 'Poland'
    );

-- Wstaw jeden rekord do tabeli company przekazując wartości dla wszystkich kolumn:
--     * 1
--     * 'Microsoft'
--     * 'USA'
INSERT INTO
    company (id, company_name, country)
VALUES
    (1, 'Microsoft', 'USA');

-- Wyświetl zawartość tabeli company.
SELECT
    *
FROM
    company;

-- Wstaw jeden rekord do tabeli company przekazując wartość tylko dla kolumny: 
--     * company_name -> 'Playway'
INSERT INTO
    company (company_name)
VALUES
    ('Playway');

-- Wyświetl zawartość tabeli company.
-- Usuń tabelę tymczasową company.
DROP TABLE IF EXISTS company;
