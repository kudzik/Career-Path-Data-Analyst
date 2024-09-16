-- database: ../DB/northwind.db
-- Wykonaj połączenie typu LEFT JOIN tabel Product oraz Category. Nie używaj aliasów.
-- Połącz tabele wykorzystując kolumny:
--     * CategoryId z tabeli Product
--     * Id z tabeli Category
SELECT
    *
FROM
    Product
    LEFT JOIN Category ON Product.CategoryId = Category.Id;

-- Wykonaj połączenie z poprzedniego ćwiczenia używając aliasów do tabel: t1 oraz t2.
SELECT
    *
FROM
    Product AS t1
    LEFT JOIN Category AS t2 ON t1.CategoryId = t2.Id;

-- Wykonaj połączenie typu LEFT JOIN tabel Product oraz Category używając aliasów.
-- Połącz tabele wykorzystując kolumny:
--     * CategoryId z tabeli Product
--     * Id z tabeli Category
-- W wyniku wyświetl tylko cztery kolumny:
--     * Id z tabeli Product
--     * ProductName
--     * CategoryName
--     * Description
SELECT
    t1.Id,
    t1.ProductName,
    t2.CategoryName,
    t2.Description
FROM
    Product AS t1
    LEFT JOIN Category AS t2 ON t1.CategoryId = t2.Id;
