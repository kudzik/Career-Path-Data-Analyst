# Główne Komendy DDL (Data Definition Language) w SQL

**DDL** (ang. *Data Definition Language*) to część języka SQL, która służy do definiowania i zarządzania strukturą bazy danych. DDL obejmuje komendy, które umożliwiają tworzenie, modyfikowanie i usuwanie obiektów w bazie danych, takich jak tabele, indeksy, widoki itp.

## 1. **CREATE**

Komenda `CREATE` służy do tworzenia nowych obiektów w bazie danych, takich jak tabele, widoki, indeksy itp.

**Przykład:** Tworzenie nowej tabeli `Customers`.

```sql
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
);
```

**Opis:**

- `CREATE TABLE` tworzy nową tabelę o nazwie `Customers`.
- `CustomerID` jest kluczem głównym (`PRIMARY KEY`), co oznacza, że wartości w tej kolumnie muszą być unikalne.
- `CustomerName` ma ustawioną klauzulę `NOT NULL`, co oznacza, że nie może przyjmować wartości `NULL`.

## 2. **ALTER**

Komenda `ALTER` służy do modyfikowania istniejących obiektów w bazie danych, takich jak dodawanie nowych kolumn, zmiana typu danych, usuwanie kolumn itp.

**Przykład:** Dodawanie nowej kolumny `Email` do tabeli `Customers`.

```sql
ALTER TABLE Customers
ADD COLUMN Email TEXT;
```

**Opis:**

- `ALTER TABLE` zmienia istniejącą tabelę `Customers`.
- `ADD COLUMN` dodaje nową kolumnę `Email` typu `TEXT`.

## 3. **DROP**

Komenda `DROP` służy do usuwania obiektów z bazy danych, takich jak tabele, widoki, indeksy itp. Jest to operacja destrukcyjna, co oznacza, że usunięte dane nie mogą być odzyskane.

**Przykład:** Usuwanie tabeli `Customers`.

```sql
DROP TABLE Customers;
```

**Opis:**

- `DROP TABLE` usuwa tabelę `Customers` wraz z całą jej zawartością.

## 4. **TRUNCATE**

Komenda `TRUNCATE` służy do szybkiego usuwania wszystkich wierszy z tabeli, ale pozostawia strukturę tabeli nienaruszoną. W odróżnieniu od `DROP`, `TRUNCATE` nie usuwa tabeli, a jedynie opróżnia jej zawartość.

**Przykład:** Opróżnianie tabeli `Customers`.

```sql
TRUNCATE TABLE Customers;
```

**Opis:**

- `TRUNCATE TABLE` usuwa wszystkie dane z tabeli `Customers`, ale tabela sama w sobie pozostaje w bazie danych.

## 5. **RENAME**

Komenda `RENAME` służy do zmiany nazwy istniejącego obiektu, takiego jak tabela.

**Przykład:** Zmiana nazwy tabeli `Customers` na `Clients`.

```sql
ALTER TABLE Customers
RENAME TO Clients;
```

**Opis:**

- `ALTER TABLE ... RENAME TO` zmienia nazwę tabeli `Customers` na `Clients`.

## Zasady i dobre praktyki

- **Tworzenie z planem:** Przed użyciem komend DDL warto dobrze zaplanować strukturę bazy danych, aby uniknąć późniejszych modyfikacji, które mogą być skomplikowane.
- **Ostrożność przy usuwaniu:** Komendy `DROP` i `TRUNCATE` są operacjami nieodwracalnymi. Należy upewnić się, że naprawdę chcemy usunąć dane lub obiekty, zanim wykonamy te komendy.
- **Bezpieczeństwo:** Zawsze tworzenie kopii zapasowych bazy danych przed wykonywaniem destrukcyjnych operacji jest dobrą praktyką.

## Przykład złożony

Załóżmy, że chcemy stworzyć nową tabelę `Orders`, a następnie dodać do niej kolumnę `OrderDate`, zmienić nazwę tabeli na `Purchases` i na końcu ją usunąć.

```sql
-- Tworzenie tabeli Orders
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    Amount REAL
);

-- Dodanie kolumny OrderDate
ALTER TABLE Orders
ADD COLUMN OrderDate DATE;

-- Zmiana nazwy tabeli na Purchases
ALTER TABLE Orders
RENAME TO Purchases;

-- Usunięcie tabeli Purchases
DROP TABLE Purchases;
```

### Podsumowanie

Komendy DDL są kluczowe dla zarządzania strukturą bazy danych. Pozwalają na tworzenie nowych tabel, modyfikowanie ich struktury, a także usuwanie tabel i innych obiektów, gdy są już niepotrzebne. Znajomość tych komend jest niezbędna do efektywnego projektowania i zarządzania bazami danych.
