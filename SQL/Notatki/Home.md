# Bazy_Danych wiki

Bazy danych są systemami umożliwiającymi przechowywanie, organizowanie i zarządzanie dużymi ilościami danych w sposób efektywny i uporządkowany. W zależności od modelu danych, bazy danych można podzielić na kilka rodzajów:

* **Relacyjne Bazy Danych (RDBMS)**: W tym modelu dane są przechowywane w tabelach, które składają się z wierszy (rekordów) i kolumn (pól). Każda tabela ma unikalny klucz główny (primary key), który identyfikuje każdy rekord. Przykłady RDBMS to MySQL, PostgreSQL, Oracle Database i Microsoft SQL Server.

* **NoSQL**: Bazy danych NoSQL są przeznaczone do przechowywania i zarządzania nieustrukturyzowanymi lub półstrukturyzowanymi danymi. NoSQL obejmuje kilka typów baz danych, takich jak bazy dokumentowe (np. MongoDB), bazy kolumnowe (np. Cassandra), bazy grafowe (np. Neo4j) i bazy klucz-wartość (np. Redis).

* **Hierarchiczne i Sieciowe Bazy Danych**: Te typy baz danych były bardziej popularne w przeszłości. Hierarchiczne bazy danych przechowują dane w strukturze drzewa, natomiast sieciowe bazy danych pozwalają na bardziej skomplikowane relacje między danymi niż relacyjne bazy danych.

## Język SQL

SQL (**Structured Query Language**) to standardowy język używany do komunikacji z relacyjnymi bazami danych. SQL umożliwia użytkownikom definiowanie, manipulowanie i kontrolowanie danych oraz zarządzanie bazą danych. Główne funkcje SQL obejmują:

**Definicja Danych** (DDL - Data Definition Language): Umożliwia tworzenie, modyfikowanie i usuwanie struktur baz danych, takich jak tabele i indeksy. Przykłady poleceń DDL to `CREATE`, `ALTER`, `DROP`.

```sql
CREATE TABLE Użytkownicy (
    ID INT PRIMARY KEY,
    Imię VARCHAR(50),
    Nazwisko VARCHAR(50),
    Email VARCHAR(100)
);
```

**Manipulacja Danymi** (DML - Data Manipulation Language): Umożliwia wstawianie, aktualizowanie, usuwanie i pobieranie danych z tabel. Przykłady poleceń DML to `INSERT`, `UPDATE`, `DELETE`, `SELECT`.

```sql
INSERT INTO Użytkownicy (ID, Imię, Nazwisko, Email)
VALUES (1, 'Jan', 'Kowalski', 'jan.kowalski@example.com');

SELECT * FROM Użytkownicy WHERE Imię = 'Jan';

```

**Kontrola Danych** (DCL - Data Control Language): Umożliwia zarządzanie dostępem do danych. Przykłady poleceń DCL to `GRANT`, `REVOKE`.

```sql
GRANT SELECT ON Użytkownicy TO 'użytkownik';
```

**Transakcje** (Transakcje (TCL - Transaction Control Language): Umożliwia zarządzanie transakcjami w bazie danych, zapewniając integralność danych. Przykłady poleceń TCL to `COMMIT`, `ROLLBACK`.

```sql
BEGIN;
INSERT INTO Użytkownicy (ID, Imię, Nazwisko, Email)
VALUES (2, 'Anna', 'Nowak', 'anna.nowak@example.com');
COMMIT;
```
