-- database: ../DB/northwind.db
DROP TABLE IF EXISTS sales;

CREATE TABLE
    sales (
        id INTEGER PRIMARY KEY,
        quarter TEXT NOT NULL,
        revenue REAL NOT NULL CHECK (revenue > 0)
    );

INSERT INTO
    sales (quarter, revenue)
VALUES
    ('Q1', 150000),
    ('Q2', 180000),
    ('Q3', 210000),
    ('Q4', 250000);

SELECT
    *
FROM
    sales;

SELECT
    *
FROM
    sales AS t1
    JOIN sales AS t2;

SELECT
    *
FROM
    sales AS t1
    JOIN sales AS t2 ON t1.id = t2.id - 1;

SELECT
    t1.quarter || ' ~ ' || t2.quarter AS period,
    t1.revenue AS revenue_Q1,
    t2.revenue AS revenue_Q2,
    (t2.revenue - t1.revenue) AS quarter_change,
    (t2.revenue - t1.revenue) / t1.revenue AS pct_change
FROM
    sales AS t1
    JOIN sales AS t2 ON t1.id = t2.id - 1;
