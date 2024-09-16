-- database: ../DB/northwind.db
CREATE VIEW
    widok_nortwind AS
SELECT
    Id,
    City,
    Region,
    Country
FROM
    Customer
where
    Region == 'Western Europe';
