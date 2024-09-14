# Podstawowe operacje modyfikacji

W SQLite do modyfikacji tabel służy przede wszystkim instrukcja `ALTER TABLE`. Za jej pomocą możemy dodawać, usuwać i zmieniać nazwy kolumn. Przyjrzyjmy się każdej z tych operacji bliżej.

**1. `ADD COLUMN` - Dodawanie kolumny**

Składnia:

```sql
ALTER TABLE nazwa_tabeli ADD COLUMN nazwa_kolumny typ_danych;
```

Przykład:

```sql
ALTER TABLE Pracownicy ADD COLUMN data_urodzenia DATE;
```

Ten kod doda nową kolumnę o nazwie `data_urodzenia` typu `DATE` do istniejącej tabeli `Pracownicy`.

**2. `DROP COLUMN` - Usuwanie kolumny**

Składnia:

```sql
ALTER TABLE nazwa_tabeli DROP COLUMN nazwa_kolumny;
```

Przykład:

```sql
ALTER TABLE Pracownicy DROP COLUMN stanowisko;
```

Ten kod usunie kolumnę `stanowisko` z tabeli `Pracownicy`.

**3. `RENAME COLUMN` - Zmiana nazwy kolumny**

Składnia:

```sql
ALTER TABLE nazwa_tabeli RENAME COLUMN stara_nazwa TO nowa_nazwa;
```

Przykład:

```sql
ALTER TABLE Pracownicy RENAME COLUMN imie TO imie_nazwisko;
```

Ten kod zmieni nazwę kolumny `imie` na `imie_nazwisko` w tabeli `Pracownicy`.

**Ważne uwagi:**

* SQLite ma pewne ograniczenia w modyfikacji tabel. Na przykład, nie można bezpośrednio zmienić typu danych istniejącej kolumny.
* Przed wprowadzeniem zmian w strukturze tabeli zawsze warto zrobić kopię zapasową bazy danych, aby uniknąć utraty danych w przypadku błędu.
* Po wprowadzeniu zmian w strukturze tabeli należy upewnić się, że wszystkie zapytania i widoki, które korzystają z tej tabeli, nadal działają poprawnie.
