SELECT
    *
FROM
    `nauka-big-query.Testowa.tabela_testowa`
LIMIT
    1000;

-- CAST typu STRING na INT64
-- numeric_types.csv
SELECT
    var2,
    cast(var2 as INT64) AS var2_Int
FROM
    `nauka-big-query.Testowa.tabela_testowa`
LIMIT
    1000;

SELECT
    *
FROM
    `nauka-big-query.Testowa.boolean_types`
LIMIT
    1000;

-- boolean_types.csv
-- CAST INT na BOOLEAN
SELECT
    var1,
    CAST(var1 as BOOL) as int_to_bool
FROM
    `nauka-big-query.Testowa.boolean_types`;

-- string_types.csv
-- CAST STRING na INT64
SELECT
    var1,
    CAST(var1 AS INT64) AS sttring_to_int
FROM
    `nauka-big-query.Testowa.string_types`
LIMIT
    1000;

-- date_time_types.csv
-- TIMESTAMP TO DATE
SELECT
    var1,
    CAST(var1 as DATE) as TS_to_Date
FROM
    `nauka-big-query.Testowa.date_time_types`
LIMIT
    1000;

-- TIMESTAMP TO TIME
SELECT
    var1,
    CAST(var1 as TIME) as TS_to_Time
FROM
    `nauka-big-query.Testowa.date_time_types`
LIMIT
    1000;

-- TIMESTAMP TO STRING
SELECT
    var1,
    CAST(var1 as String) as TS_to_String
FROM
    `nauka-big-query.Testowa.date_time_types`
LIMIT
    1000;