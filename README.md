# Career-Path-Data-Analyst

## Bazy danych – Twój zorganizowany magazyn informacji

**Czym jest baza danych?**

Wyobraź sobie ogromną bibliotekę, w której książki są uporządkowane według określonych kryteriów (np. autor, tytuł, gatunek). Każda książka to pojedyncza informacja, a cała biblioteka to baza danych.

**W informatyce baza danych to zbiór uporządkowanych danych, które są przechowywane i zarządzane w sposób umożliwiający ich efektywne wyszukiwanie i modyfikację.**

**Po co nam bazy danych?**

* **Organizacja danych:** Zamiast przechowywać informacje w różnych plikach, możemy je scentralizować w jednej bazie danych, co ułatwia zarządzanie.
* **Szybki dostęp:** Dzięki odpowiednim indeksom i zapytaniom możemy szybko znaleźć potrzebne informacje.
* **Spójność danych:** Bazy danych zapewniają, że dane są spójne i wolne od błędów.
* **Współdzielenie danych:** Różne aplikacje mogą jednocześnie korzystać z tej samej bazy danych.

**Podstawowe pojęcia związane z bazami danych:**

* **Tabela:** To podstawowy element bazy danych. Możemy ją porównać do arkusza kalkulacyjnego, gdzie każda kolumna reprezentuje atrybut (np. imię, nazwisko), a każdy wiersz – rekord (np. informacja o jednej osobie).
* **Pole:** To pojedyncza komórka w tabeli, która przechowuje konkretny typ danych (np. tekst, liczba, data).
* **Rekord:** To pojedynczy wiersz w tabeli, reprezentujący komplet informacji o jednym obiekcie.
* **Klucz główny:** To unikalny identyfikator rekordu w tabeli.
* **Relacja:** To związek między dwoma tabelami. Na przykład tabela "Klienci" może być powiązana z tabelą "Zamówienia".

**Rodzaje baz danych:**

* **Relacyjne:** Najpopularniejszy rodzaj baz danych, oparty na modelu relacyjnym. Dane są przechowywane w tabelach powiązanych ze sobą relacjami.
* **NoSQL:** Nie-relacyjne bazy danych, które są bardziej elastyczne i mogą przechowywać duże ilości danych o różnym formacie (np. dokumenty, grafiki).
* **Hierarchiczne:** Przestarzały model, w którym dane są organizowane w strukturze drzewa.
* **Sieciowe:** Rozszerzenie modelu hierarchicznego, które pozwala na bardziej złożone relacje między danymi.

**Język SQL:**

* **SQL (Structured Query Language)** to standardowy język służący do zarządzania bazami danych relacyjnych.
* Za pomocą SQL można:
  * Tworzyć, modyfikować i usuwać tabele.
  * Wstawiać, aktualizować i usuwać dane.
  * Wyszukiwać dane za pomocą zapytań.

**Przykład prostego zapytania SQL:**

```sql
SELECT * FROM klienci
WHERE miasto = 'Warszawa';
```

To zapytanie zwróci wszystkie rekordy z tabeli "klienci", gdzie miasto ma wartość "Warszawa".

## Kategorie poleceń SQL: Podział i funkcje

**SQL (Structured Query Language)** to język, który służy do zarządzania bazami danych relacyjnych. Dzięki niemu możemy wykonywać na danych różnorodne operacje, od prostego wyszukiwania po złożone analizy. Aby lepiej zrozumieć możliwości SQL, warto podzielić jego polecenia na kilka głównych kategorii.

### 1. **Polecenia definiowania danych (DDL - Data Definition Language)**

Służą do tworzenia, modyfikowania i usuwania obiektów w bazie danych, takich jak:

* **CREATE:**
  * `CREATE TABLE`: Tworzy nową tabelę.
  * `CREATE DATABASE`: Tworzy nową bazę danych.
  * `CREATE INDEX`: Tworzy indeks dla tabeli, przyspieszając wyszukiwanie.
* **ALTER:**
  * `ALTER TABLE`: Modyfikuje istniejącą tabelę (dodaje, usuwa lub zmienia kolumny).
* **DROP:**
  * `DROP TABLE`: Usuwa tabelę.
  * `DROP DATABASE`: Usuwa bazę danych.

**Przykład:**

```sql
CREATE TABLE klienci (
  id INT PRIMARY KEY,
  imie VARCHAR(50),
  nazwisko VARCHAR(50),
  miasto VARCHAR(50)
);
```

### 2. **Polecenia manipulowania danymi (DML - Data Manipulation Language)**

Służą do wprowadzania, modyfikowania i usuwania danych w tabelach:

* **INSERT:**
  * `INSERT INTO`: Dodaje nowe wiersze do tabeli.
* **UPDATE:**
  * `UPDATE`: Modyfikuje istniejące wiersze w tabeli.
* **DELETE:**
  * `DELETE`: Usuwa wiersze z tabeli.

**Przykład:**

```sql
INSERT INTO klienci (id, imie, nazwisko, miasto)
VALUES (1, 'Jan', 'Kowalski', 'Warszawa');
```

### 3. **Polecenia kontroli danych (DCL - Data Control Language)**

Służą do zarządzania uprawnieniami dostępu do danych:

* **GRANT:**
  * `GRANT`: Przydziela uprawnienia użytkownikom lub rolom.
* **REVOKE:**
  * `REVOKE`: Odbiera przydzielone uprawnienia.

**Przykład:**

```sql
GRANT SELECT ON klienci TO user1;
```

### 4. **Polecenia zapytań (SELECT)**

Służą do wyszukiwania danych w bazie danych. To najbardziej zaawansowana część SQL, pozwalająca na złożone zapytania:

* **SELECT:**
  * Wybiera określone kolumny z jednej lub wielu tabel.
* **FROM:**
  * Określa tabelę, z której pobierane są dane.
* **WHERE:**
  * Określa warunki, które muszą być spełnione przez wiersze.
* **GROUP BY:**
  * Grupuje wyniki według określonej kolumny.
* **HAVING:**
  * Filtruje grupy utworzone przez GROUP BY.
* **ORDER BY:**
  * Sortuje wyniki według określonej kolumny.

**Przykład:**

```sql
SELECT imie, nazwisko FROM klienci
WHERE miasto = 'Warszawa'
ORDER BY nazwisko;
```

### 5. **Inne kategorie**

* **TCL (Transaction Control Language):** Zarządzanie transakcjami (COMMIT, ROLLBACK).
* **DDL for Views:** Tworzenie widoków (wirtualnych tabel).
* **DDL for Stored Procedures:** Tworzenie procedur składowanych.
