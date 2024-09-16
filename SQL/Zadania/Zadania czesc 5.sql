-- database: ../DB/northwind.db
-- Pogrupuj dane z tabeli Order na poziomie OrderDate i wyznacz dla każdego klienta
-- liczbę zamównień.
SELECT
    CustomerId,
    COUNT(CustomerId)
FROM
    `Order`
GROUP BY
    CustomerId;

-- Pogrupuj dane z tabeli Order na poziomie CustomerId i wyznacz dla każdego klienta
-- liczbę zamównień. Wynik posortuj malejąco po liczbie zamównień. 
SELECT
    CustomerId,
    COUNT(CustomerId) as OrderCount
FROM
    `Order`
GROUP BY
    CustomerId
ORDER BY
    OrderCount DESC;

-- Pogrupuj dane z tabeli Order na poziomie OrderDate i wyznacz dla każdej daty
-- liczbę zamównień. Wynik posortuj malejąco po liczbie zamównień i ogranicz do
-- 10 pierwszych rekordów.
SELECT
    OrderDate,
    COUNT(OrderDate) as Liczba_Zamowien
FROM
    `Order`
GROUP BY
    OrderDate
ORDER BY
    Liczba_Zamowien DESC
LIMIT
    10;

-- Pogrupuj dane z tabeli Order na poziomie ShipCountry i wyznacz dla każdego kraju
-- liczbę zamównień. W wyniku pozostaw kraje, które mają więcej niż 50 zamówień.
-- Wynik posortuj malejąco po liczbie zamównień. 
SELECT
    ShipCountry,
    COUNT(ShipCountry) as Liczba_Zamowien
FROM
    `Order`
GROUP BY
    ShipCountry
HAVING
    Liczba_Zamowien >= 50
ORDER BY
    Liczba_Zamowien DESC;

-- Pogrupuj dane z tabeli Order na poziomie ShipCountry oraz ShipCity i wyznacz 
-- dla każdej pary kraj <-> miasto liczbę zamównień. Wynik posortuj po malejącej
-- liczbie zamówień.
SELECT
    ShipCountry,
    ShipCity,
    COUNT(*) as OrderCount
FROM
    `Order`
GROUP BY
    ShipCountry,
    ShipCity
ORDER BY
    OrderCount DESC;

-- Pogrupuj dane z tabeli Order na poziomie ShipCountry i wyznacz średnią wartość
-- dla kolumny Freight. Wynik posortuj malejąco po średniej wartości tej kolumny.
SELECT
    ShipCountry,
    AVG(Freight) as AvarageFreight
FROM
    `Order`
GROUP BY
    ShipCountry
ORDER BY
    AvarageFreight DESC;
