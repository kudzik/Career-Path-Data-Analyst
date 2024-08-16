-- database: ../DB/northwind.db
-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest mniejsza
-- niż 10.0.
SELECT
    *
FROM
    'Order'
WHERE
    Freight < 10.0;

-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest mniejsza
-- niż 10.0. Wynik posortuj rosnąco po kolumnie Freight.
SELECT
    *
FROM
    `Order`
WHERE
    Freight < 10
ORDER BY
    Freight ASC;

-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest większa
-- lub równa 10 i mniejsza niż 20.
SELECT
    *
FROM
    `Order`
WHERE
    Freight >= 10
    AND Freight < 20;

-- Wyświetl wszystkie rekordy tabeli Order dla których kolumna Freight jest mniejsza
-- lub równa 3.0 lub większa lub równa 300.0.
SELECT
    *
FROM
    `Order`
WHERE
    Freight <= 3.0
    OR Freight >= 300.0;

-- Wyświetl wsystkie zamówienia z tabeli Order z dnia '2014-05-05'
SELECT
    *
FROM
    `Order`
WHERE
    OrderDate = '2014-05-05';

-- Wyświetl wsystkie zamówienia z tabeli Order poza dniem '2014-05-05'
SELECT
    *
FROM
    `Order`
WHERE
    OrderDate != '2014-05-05';

-- Wyświetl wszystkie zamówienia z tabeli Order złożone w okresie od 2012-08-01 
-- do 2012-08-31 (włącznie). Wykorzystaj w tym celu kolumnę OrderDate.
SELECT
    *
FROM
    `Order`
WHERE
    --OrderDate >= '2012-08-01' AND OrderDate <= '2012-08-31';
    OrderDate BETWEEN '2012-08-01' AND '2012-08-31';

-- Wyświetl wszystkie zamówienia z tabeli Order złożone przez klientów o wartości
-- CustomerId: HANAR, HUNGO, GROSR.
SELECT
    *
FROM
    `Order`
WHERE
    CustomerId IN ('HANAR', 'HUNGO', 'GROSR');

-- Wyświetl wszystkie zamówienia z tabeli Order poza zamówieniami klientów o wartości
-- CustomerId: HANAR, HUNGO, GROSR.
SELECT
    *
FROM
    `Order`
WHERE
    CustomerId NOT IN ('HANAR', 'HUNGO', 'GROSR');

-- Wyświetl wszystkie zamówienia z tabeli Order z brakującymi wartościami dla kolumny
-- ShippedDate.
SELECT
    *
FROM
    `Order`
WHERE
    ShippedDate is NULL;

-- Wyświetl wszystkie zamówienia z tabeli Order bez brakujących wartości dla kolumny
-- ShippedDate.
SELECT
    *
FROM
    `Order`
WHERE
    ShippedDate is NOT NULL;

-- Wyświetl wszystkie zamówienia dla krajów rozpoczynających się na literę F.
SELECT
    *
FROM
    `Order`
WHERE
    ShipCountry LIKE('F%');

-- Wyświetl wszystkie zamówienia dla krajów, których nazwa nie rozpoczyna się od 
-- litery F.
SELECT
    *
FROM
    `Order`
WHERE
    ShipCountry NOT LIKE('F%');

-- Wyświetl wszystkie zamówienia dla krajów, których nazwa składa się dokładnie
-- z pięciu znaków.
SELECT
    *
FROM
    `Order`
WHERE
    ShipCountry LIKE('_____');

-- Wyświetl wszystkie zamówienia dla krajów, których nazwa rozpoczyna się od liter
-- P, L, N, O
SELECT
    *
FROM
    `Order`
WHERE
    ShipCountry LIKE 'P%'
    OR ShipCountry LIKE 'L%'
    OR ShipCountry LIKE 'N%'
    OR ShipCountry LIKE 'O%';
