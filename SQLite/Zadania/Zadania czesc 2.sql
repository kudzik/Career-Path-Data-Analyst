-- database: ../DB/northwind.db
-- Pomiń 3 najtańsze produkty w tabeli Product i wyświetl kolejne 5 najtańszych 
-- produktów (UnitPrice) z tabeli Product.
SELECT
    *
FROM
    Product
ORDER BY
    UnitPrice
LIMIT
    5
OFFSET
    10;

-- Wyświetl jedenasty najdroższy produkt z tabeli Product.
SELECT
    ROWID,
    *
FROM
    Product
ORDER BY
    UnitPrice
LIMIT
    1
OFFSET
    10;

-- Wyświetl kolumny Country oraz City z tabeli Customer.
SELECT
    Country,
    City
FROM
    Customer;

-- Wyświetl unikalne nazwy krajów występujące w kolumnie Country tabeli Customer.
SELECT DISTINCT
    Country
FROM
    Customer;

-- Wyświetl unikalne nazwy krajów występujące w kolumnie Country tabeli Customer. 
-- Posortuj wyniki rosnąco.
SELECT DISTINCT
    Country
FROM
    Customer
ORDER BY
    Country ASC;

-- Wyświetl unikalne nazwy miast występujące w kolumnie City tabeli Customer.
SELECT DISTINCT
    City
FROM
    Customer;

-- Wyświetl unikalne pary kraj <-> miasto występujące w kolumnach Country oraz City 
-- tabeli Customer.
SELECT DISTINCT
    Country,
    City
FROM
    Customer;

-- Wyświetl unikalne nazwy regionów występujące w kolumnie Region tabeli Supplier.
SELECT DISTINCT
    Region
FROM
    Supplier
