-- database: ../DB/northwind.db
-- Use the ▷ button in the top right corner to run the entire file.
-- Tworzenie nowej tabeli z zapytania SQL
CREATE TABLE
    Result_tmp as
SELECT
    Category.CategoryName,
    Product.ProductName
FROM
    Category,
    Product;

DROP TABLE IF EXISTS Result_tmp
