-- database: ../DB/northwind.db
-- Z tabeli Product wyświetl kolumnę UnitsInStock. Dodatkowo dodaj drugą kolumnę
-- o nazwie UnitsInStockLevel, która podzieli wartości w kolumnie UnitsInStock na
-- cztery poziomy:
--     * UnitsInStock == 0 -> 'none'
--     * UnitsInStock < 20 -> 'low'
--     * UnitsInStock pomiędzy 20 a 50 -> 'medium'
--     * UnitsInStock powyżej 50 -> 'high'
SELECT UnitsInStock,
       CASE 
           WHEN UnitsInStock == 0 THEN 'none'
           WHEN UnitsInStock < 20 THEN 'low'
           WHEN UnitsInStock BETWEEN 20 AND 50 THEN 'medium'
           WHEN UnitsInStock > 50 THEN 'high'
       END AS UnitsInStockLevel
FROM Product;

-- Wykorzystując zapytanie z powyższego ćwiczenia pogrupuj dane w kolumnie Product 
-- na poziomie UnitsInStockLevel i policz liczbę wystąpień dla każdej grupy.
SELECT CASE 
           WHEN UnitsInStock == 0 THEN 'none'
           WHEN UnitsInStock < 20 THEN 'low'
           WHEN UnitsInStock BETWEEN 20 AND 50 THEN 'medium'
           WHEN UnitsInStock > 50 THEN 'high'
       END AS UnitsInStockLevel,
COUNT(*) AS NumOfProducts
FROM Product
GROUP BY UnitsInStockLevel;