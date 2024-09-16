-- database: :memory:
-- Usuń tabele company oraz stock_exchange o ile istnieją.
DROP TABLE IF EXISTS company;

DROP TABLE IF EXISTS stock_exchange;

-- Utwórz tabelę o nazwie stock_exchange i kolumnach:
--     * id -> liczba całkowita, klucz główny
--     * name -> tekst, bez wartości NULL
--     * country -> tekst, bez wartości NULL
CREATE TABLE IF NOT EXISTS
	stock_exchange (
		id INTEGER NOT NULL PRIMARY KEY,
		name TEXT NOT NULL,
		country TEXT NOT NULL
	);

-- Utwórz tabelę o nazwie company i kolumnach:
--     * id -> liczba całkowita, klucz główny
--     * company_name -> tekst, bez wartości NULL
--     * country -> tekst, domyślnie 'USA'
--     * stock_exchange_id -> liczba całkowita, bez wartości NULL
CREATE TABLE IF NOT EXISTS
	company (
		id INTEGER NOT NULL PRIMARY KEY,
		company_name TEXT NOT NULL,
		country TEXT NOT NULL,
		stock_exchange_id INTEGER NOT NULL,
		FOREIGN KEY (stock_exchange_id) REFERENCES stock_exchange (id)
	);

-- Dodaj ograniczenie klucza obcego na poziomie tabeli do kolumny stock_exchange_id, 
-- która odnosi się do kolumny id tabeli stock_exchange.
-- Wykonaj poniższe polecenie.
INSERT INTO
	stock_exchange (name, country)
VALUES
	('London Stock Exchange Group', 'United Kingdom'),
	('Nasdaq', 'USA'),
	('Shanghai Stock Exchange', 'Shanghai'),
	('New York Stock Exchange', 'USA');

-- Wyświetl tabelę stock_exchange.	   
SELECT
	*
FROM
	stock_exchange;

-- Wstaw poniższe rekordy do tabeli company.	   
INSERT INTO
	company (company_name, country, stock_exchange_id)
VALUES
	('Microsoft', 'USA', 2);

INSERT INTO
	company (company_name, country, stock_exchange_id)
VALUES
	('Amazon', 'USA', 2);

INSERT INTO
	company (company_name, country, stock_exchange_id)
VALUES
	('JPMorgan', 'USA', 4);

-- Wyświetl tabelę company.	   
SELECT
	*
FROM
	company;

-- Wykonaj połączenie typu LEFT JOIN tabel company oraz stock_exchange. 
-- W tabeli wynikowej wyświetl kolumny:
--     * id z tabeli company
--     * company_name
--     * country z tabeli company
--     * name
SELECT
	c.id,
	c.company_name,
	c.country,
	s.name
FROM
	company c
	LEFT JOIN stock_exchange s ON c.stock_exchange_id = s.id
