-- database: ../DB/MyDB.db
CREATE TABLE
    user_only AS
SELECT
    role_name,
    opis
FROM
    user_role
WHERE
    role_name LIKE '%user%';
