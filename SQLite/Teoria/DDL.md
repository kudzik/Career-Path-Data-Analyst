# Główne Komendy DDL (Data Definition Language) w SQL

**DDL** (ang. *Data Definition Language*) to część języka SQL, która służy do definiowania i zarządzania strukturą bazy danych. DDL obejmuje komendy umożliwiające tworzenie, modyfikowanie i usuwanie obiektów w bazie danych, takich jak tabele, indeksy czy widoki.

## 1. CREATE

Komenda `CREATE` służy do tworzenia nowych obiektów w bazie danych, takich jak tabele, bazy danych, widoki czy indeksy. Używając tej komendy, definiujemy strukturę danych, z którą będziemy pracować.

### Tworzenie Tabeli (CREATE TABLE)

Tabele są podstawowym obiektem w bazach danych, przechowującym dane w formie wierszy i kolumn.

#### Składnia

```sql
CREATE TABLE nazwa_tabeli (
    nazwa_kolumny1 typ_danych [opcje],
    nazwa_kolumny2 typ_danych [opcje],
    ...
);
```

#### Przykład

```sql
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
);
```

### Tworzenie tabeli tymczasowej

Aby utworzyć tabelę tymczasową, używasz polecenia `CREATE TEMPORARY TABLE`. Oto podstawowa składnia:

```sql
CREATE TEMPORARY TABLE nazwa_tabeli (
    kolumna1 typ_danych,
    kolumna2 typ_danych,
    ...
);
```

### Przykład

Załóżmy, że chcesz utworzyć tymczasową tabelę do przechowywania wyników zapytania o studentów:

```sql
CREATE TEMPORARY TABLE temp_students (
    student_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    grade INTEGER
);
```

### Wykorzystanie tabeli tymczasowej

Tabele tymczasowe są dostępne tylko w ramach sesji, w której zostały utworzone. Oznacza to, że po zakończeniu sesji (np. zamknięciu połączenia z bazą danych), tabela tymczasowa zostanie automatycznie usunięta.

Możesz wstawiać dane do tabeli tymczasowej tak samo, jak do zwykłej tabeli:

```sql
INSERT INTO temp_students (student_id, first_name, last_name, grade)
VALUES (1, 'Jan', 'Kowalski', 5);
```

### Zalety tabel tymczasowych

- **Szybkość**: Operacje na tabelach tymczasowych są zazwyczaj szybsze, ponieważ są one przechowywane w pamięci.
- **Izolacja**: Dane w tabelach tymczasowych są izolowane od innych sesji, co zapewnia bezpieczeństwo i integralność danych.

### Tworzenie Bazy Danych (CREATE DATABASE)

Komenda `CREATE DATABASE` tworzy nową bazę danych.

#### Przykład

```sql
CREATE DATABASE MyDatabase;
```

### Tworzenie Widoków (CREATE VIEW)

Widoki to zapisane zapytania, które mogą być traktowane jak wirtualne tabele.

#### Przykład

```sql
CREATE VIEW CustomerView AS
SELECT CustomerName, Country FROM Customers;
```

### Tworzenie Indeksów (CREATE INDEX)

Indeksy poprawiają wydajność zapytań poprzez szybkie odnajdywanie danych w tabelach.

#### Przykład

```sql
CREATE INDEX idx_country ON Customers(Country);
```

### Tworzenie Tabeli z Relacjami

Możemy tworzyć tabele z relacjami, używając kluczy obcych (FOREIGN KEY).

#### Przykład

```sql
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    OrderDate DATE,
    CustomerID INTEGER,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

## Tworzenie tabeli będącej wynikiem zapytania

Aby utworzyć tabelę będącą wynikiem zapytania w SQLite, możesz użyć polecenia `CREATE TABLE AS`. To polecenie pozwala na utworzenie nowej tabeli i jednoczesne wypełnienie jej danymi zwróconymi przez zapytanie SELECT. Oto jak to zrobić:

### Składnia

```sql
CREATE TABLE nowa_tabela AS
SELECT kolumna1, kolumna2, ...
FROM istniejąca_tabela
WHERE warunek;
```

### Przykład

Załóżmy, że masz tabelę `students` i chcesz utworzyć nową tabelę `top_students`, która będzie zawierała tylko tych studentów, którzy mają ocenę powyżej 90:

```sql
CREATE TABLE top_students AS
SELECT student_id, first_name, last_name, grade
FROM students
WHERE grade > 90;
```

### Kroki

1. **Tworzenie nowej tabeli**: Nowa tabela `top_students` zostanie utworzona z kolumnami `student_id`, `first_name`, `last_name` i `grade`.
2. **Wypełnienie danymi**: Tabela zostanie wypełniona danymi zwróconymi przez zapytanie SELECT, czyli tylko tymi studentami, którzy mają ocenę powyżej 90.

### Zalety

- **Prostota**: Możesz szybko utworzyć nową tabelę na podstawie wyników zapytania bez potrzeby ręcznego wstawiania danych.
- **Wydajność**: Operacja jest zazwyczaj szybka, ponieważ SQLite wykonuje zapytanie SELECT i tworzy tabelę w jednym kroku.

## 2. ALTER

Komenda `ALTER` służy do modyfikowania struktury istniejących obiektów w bazie danych.

### 1. Dodawanie nowej kolumny

#### Składnia

```sql
ALTER TABLE nazwa_tabeli
ADD COLUMN nazwa_kolumny typ_danych [opcje];
```

#### Przykład

```sql
ALTER TABLE Customers
ADD COLUMN Email TEXT;
```

### 2. Usuwanie kolumny

**Uwaga:** SQLite nie obsługuje bezpośrednio usuwania kolumny.

#### Przykład (w innych systemach baz danych)

```sql
ALTER TABLE Customers
DROP COLUMN ContactName;
```

### 3. Zmiana typu danych kolumny

**Uwaga:** SQLite nie obsługuje bezpośrednio tej funkcji.

#### Przykład (w innych systemach baz danych)

```sql
ALTER TABLE Customers
ALTER COLUMN CustomerName TEXT;
```

### 4. Zmiana nazwy kolumny

#### Składnia

```sql
ALTER TABLE nazwa_tabeli
RENAME COLUMN stara_nazwa_kolumny TO nowa_nazwa_kolumny;
```

#### Przykład

```sql
ALTER TABLE Customers
RENAME COLUMN ContactName TO ContactPerson;
```

### 5. Zmiana nazwy tabeli

#### Składnia

```sql
ALTER TABLE stara_nazwa_tabeli
RENAME TO nowa_nazwa_tabeli;
```

#### Przykład

```sql
ALTER TABLE Customers
RENAME TO Clients;
```

## 3. DROP

Komenda `DROP` służy do usuwania całych obiektów z bazy danych. Jest to potężna i potencjalnie niebezpieczna komenda, ponieważ usuwa wszystkie dane zawarte w obiekcie oraz jego strukturę.

### 1. Usuwanie tabeli (DROP TABLE)

#### Składnia

```sql
DROP TABLE nazwa_tabeli;
```

#### Przykład

```sql
DROP TABLE Orders;
```

### 2. Usuwanie bazy danych (DROP DATABASE)

#### Przykład

```sql
DROP DATABASE MyDatabase;
```

**Uwaga:** W SQLite nie ma bezpośredniej komendy `DROP DATABASE`. Usunięcie bazy danych polega na usunięciu pliku z systemu plików.

### 3. Usuwanie widoku (DROP VIEW)

#### Składnia

```sql
DROP VIEW nazwa_widoku;
```

#### Przykład

```sql
DROP VIEW CustomerView;
```

### 4. Usuwanie indeksu (DROP INDEX)

#### Składnia

```sql
DROP INDEX nazwa_indeksu;
```

#### Przykład

```sql
DROP INDEX idx_country;
```

## 4. TRUNCATE

Komenda `TRUNCATE` służy do szybkiego usuwania wszystkich danych z tabeli, zachowując jej strukturę.

#### Składnia

```sql
TRUNCATE TABLE nazwa_tabeli;
```

#### Przykład

```sql
TRUNCATE TABLE Orders;
```

**Uwaga:** SQLite nie obsługuje bezpośrednio komendy `TRUNCATE`. Zamiast tego należy użyć:

```sql
DELETE FROM nazwa_tabeli;
```

## 5. RENAME

Komenda `RENAME` służy do zmiany nazw obiektów w bazie danych.

#### Składnia

```sql
ALTER TABLE stara_nazwa_tabeli
RENAME TO nowa_nazwa_tabeli;
```

#### Przykład

```sql
ALTER TABLE Customers
RENAME TO Clients;
```

## Podsumowanie

Komendy DDL są kluczowe dla zarządzania strukturą bazy danych. Pozwalają na tworzenie nowych obiektów, modyfikowanie ich struktury oraz usuwanie, gdy są już niepotrzebne. Znajomość tych komend jest niezbędna do efektywnego projektowania i zarządzania bazami danych.
