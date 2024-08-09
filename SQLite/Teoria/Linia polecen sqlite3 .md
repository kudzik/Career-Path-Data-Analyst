# Polecenia z wiersza poleceń SQLite3

SQLite3 posiada wiele przydatnych poleceń, które mogą znacznie ułatwić zarządzanie bazami danych. Oto przegląd najważniejszych z nich:

## 1. Uruchamianie SQLite3

Aby rozpocząć pracę z SQLite3, musisz uruchomić jego wiersz poleceń. W terminalu wpisz:

```sh
sqlite3 nazwabazy.db
```

Jeśli baza danych `nazwabazy.db` nie istnieje, zostanie utworzona.

## 2. Wyjście z SQLite3

Aby wyjść z wiersza poleceń SQLite3, wpisz:

```sh
.exit
```

## 3. Przeglądanie tabel

Aby wyświetlić listę wszystkich tabel w bazie danych, użyj:

```sh
.tables
```

## 4. Przeglądanie schematu tabeli

Aby zobaczyć szczegóły dotyczące struktury konkretnej tabeli, użyj:

```sh
.schema nazwatabeli
```

## 5. Ładowanie pliku SQL

Aby załadować i wykonać polecenia SQL z pliku, użyj:

```sh
.read nazwapliku.sql
```

## 6. Wyświetlanie wyników w bardziej czytelny sposób

Domyślnie, wyniki są wyświetlane w postaci "czytelnej dla maszyn". Możesz zmienić format wyświetlania wyników na bardziej przyjazny dla człowieka:

```sh
.mode column
.headers on
```

## 7. Eksportowanie danych do pliku CSV

Aby wyeksportować dane z tabeli do pliku CSV, użyj:

```sh
.mode csv
.output nazwapliku.csv
SELECT * FROM nazwatabeli;
.output stdout
```

## 8. Importowanie danych z pliku CSV

Aby zaimportować dane z pliku CSV do tabeli, użyj:

```sh
.mode csv
.import nazwapliku.csv nazwatabeli
```

## 9. Wyświetlanie pomocy

Aby zobaczyć listę wszystkich dostępnych poleceń, wpisz:

```sh
.help
```

## Przykładowa sesja SQLite3

Oto przykładowa sesja, która pokazuje, jak wykorzystać niektóre z powyższych poleceń:

```sh
sqlite3 bibliotekadb.db
SQLite version 3.32.3 2020-06-18 14:00:33
Enter ".help" for usage hints.
sqlite> .tables
sqlite> .schema books
CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    published_year INTEGER
);
sqlite> .mode column
sqlite> .headers on
sqlite> SELECT * FROM books;
id          title       author         published_year
----------  ----------  --------------  --------------
1           Wiedźmin    Andrzej Sapkowski 1990
sqlite> .output books.csv
sqlite> SELECT * FROM books;
sqlite> .output stdout
```
