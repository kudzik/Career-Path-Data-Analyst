-- database: /Users/kudzik/Repo/Career-Path-Data-Analyst/SQLite/DB/northwind.db
-- Use the ▷ button in the top right corner to run the entire file.
SELECT
    *
FROM
    Employee;

/* 
Zadanie 1:
Wybierz wszystkie kolumny z tabeli Product i posortuj je rosnąco według kolumny ProductName.
*/
SELECT
    *
FROM
    Product
ORDER BY
    ProductName ASC;

/* 
Zadanie 2:
Wybierz wszystkie kolumny z tabeli Employee i posortuj je malejąco według kolumny LastName.
*/
SELECT
    *
FROM
    Employee
ORDER BY
    LastName DESC;

/* 
Zadanie 3:
Wybierz ProductName i UnitPrice z tabeli Product i posortuj wyniki według UnitPrice rosnąco.
*/
SELECT
    ProductName,
    UnitPrice
FROM
    Product
ORDER BY
    UnitPrice ASC;

/*
Zadanie 4:
Wybierz FirstName, LastName, Title z tabeli Employee i posortuj wyniki najpierw według 
Title rosnąco, a następnie według LastName malejąco.
*/
SELECT
    FirstName,
    LastName,
    Title
FROM
    Employee
ORDER BY
    Title ASC,
    LastName DESC;

/*
Zadanie 5 (Trudniejsze):
Wybierz ProductName, QuantityPerUnit oraz UnitsInStock z tabeli Product. 
Posortuj wyniki tak, aby produkty, dla których wartość UnitsInStock wynosi 0, 
pojawiły się na końcu, a pozostałe produkty były posortowane według UnitsInStock rosnąco.
*/
SELECT
    ProductName,
    QuantityPerUnit,
    UnitsInStock
FROM
    Product
ORDER BY
    UnitsInStock = 0 ASC,
    UnitsInStock ASC;

SELECT
    ProductName,
    QuantityPerUnit,
    UnitsInStock
FROM
    Product
ORDER BY
    UnitsInStock > 0 DESC,
    UnitsInStock ASC;

/*
```sql
SELECT ProductName, QuantityPerUnit, UnitsInStock
FROM Product
ORDER BY UnitsInStock > 0 DESC, UnitsInStock ASC;
```

## Wyjaśnienie zapytania:

* **`SELECT ProductName, QuantityPerUnit, UnitsInStock FROM Product`:**
* Ta część, jak już wiesz, wybiera określone kolumny z tabeli `Product`.
* **`ORDER BY UnitsInStock > 0 DESC, UnitsInStock ASC`:**
* Tutaj kryje się klucz do sortowania:
* **`UnitsInStock > 0 DESC`:**
* Porównuje `UnitsInStock` z 0.
* Jeśli wynik jest `TRUE` (czyli `UnitsInStock` jest większe od 0), to dla tego wiersza przypisuje wartość `1`, a jeśli `FALSE` (czyli `UnitsInStock` jest równe 0), to przypisuje wartość `0`.
* Następnie sortuje te wartości w porządku malejącym (`DESC`). Oznacza to, że wiersze, gdzie `UnitsInStock` jest większe od 0 (czyli produkty dostępne), będą na początku.
* **`UnitsInStock ASC`:**
* To jest dodatkowe sortowanie, które działa tylko w obrębie wierszy, które mają taką samą wartość w pierwszym kryterium sortowania.
* Sortuje produkty dostępne (`UnitsInStock` > 0) według rosnącej liczby sztuk na magazynie.

## Jak działa to sortowanie?

1. **Produkty dostępne:** Wszystkie produkty, które mają jakąkolwiek ilość na magazynie (`UnitsInStock` > 0), zostaną umieszczone na początku.
2. **Produkty wyprzedane:** Produkty, które są całkowicie wyprzedane (`UnitsInStock` = 0), zostaną umieszczone na końcu.
3. **W ramach produktów dostępnych:** Produkty zostaną posortowane według rosnącej liczby sztuk na magazynie.

**Dzięki temu zapytaniu otrzymasz listę produktów, gdzie najpierw będą te dostępne, a na końcu te wyprzedane. W obrębie produktów dostępnych, będą one uporządkowane według ilości na magazynie.**

## Dlaczego ten sposób sortowania jest lepszy od poprzedniego?

W poprzednim zapytaniu użyliśmy `UnitsInStock = 0 ASC` jako pierwszego kryterium sortowania. Chociaż to działa, to ten sposób może być mniej wydajny dla większych zbiorów danych. Porównywanie każdej wartości z 0 może być bardziej czasochłonne niż proste porównanie logiczne (`UnitsInStock > 0`).

**Nowe zapytanie jest bardziej zoptymalizowane i powinno działać szybciej, zwłaszcza dla dużych tabel.**

*/
/*
Zadanie 6:
Wybierz ContactName, Fax z tabeli Customer i posortuj wyniki malejąco. 
Dla kolumny Fax posortuj wyniki rosnąco. Wartość NULL musi być umieszczona na koncu.
Ogranicz wyniki do 10 wierszy.
*/
SELECT
    ContactName,
    Fax
FROM
    Customer
ORDER BY
    Fax ASC NULLS LAST
LIMIT
    10;

/*
Zadanie 7:
Wybierz ContactName, Fax z tabeli Customer i posortuj wyniki malejąco. 
Dla kolumny Fax posortuj wyniki rosnąco. Wartość NULL musi być umieszczona na koncu.
Ogranicz wyniki do 5 wierszy od 10 do 14.
*/
SELECT
    ContactName,
    Fax
FROM
    Customer
ORDER BY
    Fax ASC NULLS LAST
LIMIT
    5
OFFSET
    10;

/*
Limit i offset pozwalają na stronicowanie wyników zapytania.

* **Limit:** Określa maksymalną liczbę wierszy, które mają być zwrócone.
* **Offset:** Określa liczbę wierszy, które mają zostać pominiętych przed zwróceniem wyników.

*/
/*
Zadanie 8:
Wybierz unikalne wartości kolumny ContactTitle z tabeli Customer
*/
SELECT DISTINCT
    ContactTitle
FROM
    Customer;

-- WHERE --
SELECT
    ContactName,
    City,
    Country
FROM
    Customer
WHERE
    (
        Country == 'Germany'
        AND City == 'Brandenburg'
    )
    OR Country == 'Poland';

SELECT DISTINCT
    ContactTitle
FROM
    Customer;

-- IN --
SELECT
    ContactName,
    City,
    Country
FROM
    Customer
WHERE
    Country IN ('Poland', 'UK', 'Canada')
ORDER BY
    Country;

-- LIKE nie wrażliwy na wielkość liter
-- Kilka znaków `%` jeden znak `_`
SELECT
    ContactName,
    City,
    Country
FROM
    Customer
WHERE
    Country LIKE('U%')
ORDER BY
    Country;

-- GLOB -- Wrażliwy na wielkość liter
-- kilka znaków `*` jeden znak `?``
SELECT
    ContactName,
    City,
    Country
FROM
    Customer
WHERE
    Country GLOB('u*')
ORDER BY
    Country;

-- COUNT --
SELECT
    COUNT(*) as ProductCount
FROM
    Product;

SELECT
    Count(DISTINCT SupplierId) as numberSupplier -- tylko unikalne wartosci
    --COUNT(SupplierId) 
FROM
    Product;

-- SUM --
SELECT
    SUM(UnitPrice) AS TotalSum
FROM
    Product;

-- AVG --
SELECT
    AVG(UnitPrice) AS TotalAvarage
FROM
    Product;

-- MIN --
SELECT
    min(UnitPrice) AS MinProd
FROM
    Product;

-- MAX --
SELECT
    MAX(UnitPrice) AS MAXProd
FROM
    Product;

-- GROUP BY
SELECT
    EmployeeId,
    SUM(Freight) as SumFreight,
    AVG(Freight) as AVGFreight,
    COUNT(*) as COUNTFreight
FROM
    'Order'
GROUP BY
    EmployeeId;

-- HAVING
SELECT
    EmployeeId,
    SUM(Freight) as SumFreight,
    AVG(Freight) as AVGFreight,
    COUNT(*) as COUNTFreight
FROM
    'Order'
WHERE
    EmployeeId != 9
GROUP BY
    EmployeeId
HAVING
    SumFreight > 9000;
