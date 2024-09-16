-- database: ../DB/MyDB.db
UPDATE user_role
SET
    opis = 'Brak'
WHERE
    opis is NULL;
