-- database: ../DB/northwind.db
-- Utwórz zapytanie, które wyświetli wersję SQLite.
SELECT
    sqlite_version();

-- Utwórz zapytanie, które zwróci aktualny czas.
SELECT
    time();

-- Utwórz zapytanie, które zwróci wynik dzielenia 23 przez 4.
SELECT
    23.0 / 4.0;

-- Wyświetl całą tabelę Employee (baza Northwind).
SELECT
    *
FROM
    Employee;

-- Wyświetl całą tabelę Order.
SELECT
    *
FROM
    `Order`;

-- Wyświetl kolumny:
--     * FirstName
--     * LastName
--     * Country
--     * City
-- z tabeli Employee w podanej powyżej kolejności.
SELECT
    FirstName,
    LastName,
    Country,
    City
FROM
    Employee;

-- Wyświetl całą tabelę Customer (zwróć uwagę na kolumnę Id).
SELECT
    *
FROM
    Customer;

-- Wyświetl całą tabelę Customer razem z kolumną ROWID umieszczoną jako pierwszą.
SELECT
    ROWID,
    *
FROM
    Customer;

-- Wyświetl kolumny:
--     * ProductName
--     * UnitPrice
-- z tabeli Product w podanej kolejności i posortuj rosnąco po kolumnie UnitPrice.
-- Wyświetl kolumny:
--     * ProductName
--     * UnitPrice
-- z tabeli Product w podanej kolejności i posortuj malejąco po kolumnie UnitPrice.
SELECT
    ProductName,
    UnitPrice
FROM
    Product
ORDER BY
    UnitPrice DESC;

-- Wyświetl kolumny:
--     * CompanyName
--     * Country
--     * City
-- z tabeli Customer w podanej powyżej kolejności. Tabelę wynikową posortuj rosnąco
-- po kolumnie Country i następnie rosnąco po kolumnie City.
SELECT
    CompanyName,
    Country,
    City
FROM
    Customer
ORDER BY
    Country,
    City;

-- Wyświetl kolumny:
--     * CompanyName
--     * Country
--     * City
-- z tabeli Customer w podanej powyżej kolejności. Tabelę wynikową posortuj rosnąco
-- po kolumnie Country i następnie malejąco po kolumnie City.
SELECT
    CompanyName,
    Country,
    City
FROM
    Customer
ORDER BY
    Country,
    City DESC;

-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate rosnąco.
-- Zwróć uwagę na braki danych (NULL).
SELECT
    *
FROM
    `Order`
ORDER BY
    ShippedDate;

-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate rosnąco.
-- Braki danych (NULL) pozostaw na końcu sortowania.
SELECT
    *
FROM
    `Order`
ORDER BY
    ShippedDate NULLS LAST;

-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate malejąco.
-- Zwróć uwagę na braki danych (NULL).
SELECT
    *
FROM
    `Order`
ORDER BY
    ShippedDate DESC;

-- Wyświetl tabelę Order posortowaną po kolumnie ShippedDate malejąco.
-- Braki danych (NULL) pozostaw na początku sortowania.
SELECT
    *
FROM
    `Order`
ORDER BY
    ShippedDate DESC NULLS FIRST;

-- Wyświetl 5 wierszy z tabeli Supplier.
SELECT
    *
FROM
    Supplier
LIMIT
    5;

-- Wyświetl 5 najtańszych produktów (UnitPrice) z tabeli Product.
SELECT
    *
FROM
    Product
ORDER BY
    UnitPrice
LIMIT
    5;

-- Wyświetl 10 najdroższych produktów (UnitPrice) z tabeli Product.
SELECT
    *
FROM
    Product
ORDER BY
    UnitPrice DESC
LIMIT
    10;

-- Wyświetl (tylko) nazwy 10 najdroższych produktów (UnitPrice) z tabeli Product.
SELECT
    ProductName
FROM
    Product
ORDER BY
    UnitPrice DESC
LIMIT
    10;
