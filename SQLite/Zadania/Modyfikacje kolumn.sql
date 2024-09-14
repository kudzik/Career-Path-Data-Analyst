-- database: ../DB/MyDB.db
ALTER TABLE user_role
ADD COLUMN opis TEXT;

ALTER TABLE user_role
DROP COLUMN opis;

ALTER TABLE user_role
RENAME COLUMN opis TO nowa_nazwa;
