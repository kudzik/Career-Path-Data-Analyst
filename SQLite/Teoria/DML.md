# DML

DML (Data Manipulation Language), czyli języka manipulacji danymi w SQL. DML to zestaw instrukcji, które pozwalają nam na bezpośrednią interakcję z danymi przechowywanymi w bazie danych.

1. **Zapytania DML: Wprowadzenie**
   * Czym są zapytania DML i dlaczego są ważne?
   * Podstawowe operacje DML: `INSERT`, `UPDATE`, `DELETE`

2. **`INSERT` - Dodawanie nowych wierszy**
   * Składnia `INSERT INTO`
   * Wstawianie wartości do wszystkich kolumn
   * Wstawianie wartości do wybranych kolumn

3. **`UPDATE` - Modyfikowanie istniejących wierszy**
   * Składnia `UPDATE`
   * Ustawianie nowych wartości dla kolumn
   * Stosowanie klauzuli `WHERE` do wybierania wierszy do modyfikacji

4. **`DELETE` - Usuwanie wierszy**
   * Składnia `DELETE FROM`
   * Stosowanie klauzuli `WHERE` do wybierania wierszy do usunięcia
   * Ostrożność przy usuwaniu danych

5. **Ćwiczenia praktyczne**
   * Tworzenie przykładowej tabeli
   * Dodawanie, modyfikowanie i usuwanie wierszy
   * Stosowanie klauzuli `WHERE`

---

**Czym są zapytania DML?**

Zapytania DML (Data Manipulation Language), czyli język manipulacji danymi, to zestaw instrukcji w SQL, które pozwalają nam bezpośrednio wpływać na dane przechowywane w bazie danych. Możemy je porównać do narzędzi, które umożliwiają nam dodawanie nowych rekordów do tabeli (jak dodawanie nowych książek do biblioteki), modyfikowanie istniejących rekordów (jak aktualizacja informacji o książce) oraz usuwanie rekordów (jak wycofanie książki z biblioteki).

**Dlaczego zapytania DML są ważne?**

Zapytania DML są kluczowe, ponieważ umożliwiają nam dynamiczne zarządzanie danymi w bazie danych. Dzięki nim możemy:

* **Aktualizować informacje:** Gdy coś się zmienia, możemy łatwo zmodyfikować odpowiednie rekordy w bazie danych, aby odzwierciedlić te zmiany.
* **Dodawać nowe dane:** Gdy pojawiają się nowe informacje, możemy je łatwo dodać do bazy danych, aby były dostępne dla innych użytkowników i aplikacji.
* **Usuwać niepotrzebne dane:** Gdy dane stają się nieaktualne lub niepotrzebne, możemy je usunąć z bazy danych, aby zwolnić miejsce i utrzymać porządek.

**Podstawowe operacje DML**

SQL oferuje trzy podstawowe operacje DML:

1. `INSERT`: Służy do dodawania nowych wierszy (rekordów) do tabeli.
2. `UPDATE`: Służy do modyfikowania istniejących wierszy w tabeli.
3. `DELETE`: Służy do usuwania wierszy z tabeli.

Te trzy operacje stanowią podstawę manipulacji danymi w SQL i pozwalają nam na pełną kontrolę nad zawartością naszych tabel.

## INSERT INTO

**Składnia `INSERT INTO`**

Podstawowa składnia instrukcji `INSERT` wygląda następująco:

```sql
INSERT INTO nazwa_tabeli (kolumna1, kolumna2, ...)
VALUES (wartość1, wartość2, ...);
```

* `nazwa_tabeli`: Nazwa tabeli, do której chcemy dodać nowy wiersz.
* `(kolumna1, kolumna2, ...)`: Lista kolumn, do których chcemy wstawić wartości. Możemy pominąć tę część, jeśli chcemy wstawić wartości do wszystkich kolumn tabeli (w takiej samej kolejności, w jakiej zostały zdefiniowane).
* `(wartość1, wartość2, ...)`: Lista wartości, które chcemy wstawić do odpowiednich kolumn. Wartości muszą być podane w takiej samej kolejności, jak kolumny w liście kolumn.

**Wstawianie wartości do wszystkich kolumn**

Jeśli chcemy wstawić wartości do wszystkich kolumn tabeli, możemy pominąć listę kolumn w instrukcji `INSERT`. Na przykład:

```sql
INSERT INTO Klienci 
VALUES (1, 'Jan', 'Kowalski', 'jan.kowalski@example.com');
```

Ten kod wstawi nowy wiersz do tabeli `Klienci`, przypisując wartości 1, 'Jan', 'Kowalski' i '<jan.kowalski@example.com>' do kolejnych kolumn tabeli (zakładając, że kolumny są zdefiniowane w takiej właśnie kolejności).

**Wstawianie wartości do wybranych kolumn**

Jeśli chcemy wstawić wartości tylko do niektórych kolumn, możemy jawnie określić listę kolumn w instrukcji `INSERT`. Na przykład:

```sql
INSERT INTO Klienci (imie, nazwisko, email)
VALUES ('Anna', 'Nowak', 'anna.nowak@example.com');
```

Ten kod wstawi nowy wiersz do tabeli `Klienci`, przypisując wartości 'Anna', 'Nowak' i '<anna.nowak@example.com>' odpowiednio do kolumn `imie`, `nazwisko` i `email`. Pozostałe kolumny otrzymają wartości domyślne (jeśli zostały zdefiniowane) lub wartości NULL.

**Podsumowanie**

Instrukcja `INSERT` to potężne narzędzie do dodawania nowych danych do tabel w bazie danych SQLite. Dzięki niej możemy łatwo i elastycznie wstawiać nowe wiersze, zarówno ze wszystkimi wartościami, jak i tylko z wybranymi.

## Update

`UPDATE` to zapytanie, które pozwala nam **modyfikować istniejące wiersze** w tabeli. Dzięki niej możemy wprowadzać zmiany w danych, które już przechowujemy w bazie, na przykład aktualizować adres klienta, zmieniać status zamówienia czy poprawiać błędy w danych.

**Składnia `UPDATE`**

Podstawowa składnia instrukcji `UPDATE` wygląda następująco:

```sql
UPDATE nazwa_tabeli
SET kolumna1 = wartość1, kolumna2 = wartość2, ...
WHERE warunek;
```

* `nazwa_tabeli`: Nazwa tabeli, w której chcemy zmodyfikować wiersze.
* `SET kolumna1 = wartość1, kolumna2 = wartość2, ...`: Lista przypisań, które określają, które kolumny mają zostać zaktualizowane i jakie mają być nowe wartości.
* `WHERE warunek`: Opcjonalna klauzula, która pozwala nam wybrać konkretne wiersze do modyfikacji. Jeśli pominiemy tę klauzulę, wszystkie wiersze w tabeli zostaną zaktualizowane.

**Ustawianie nowych wartości dla kolumn**

Za pomocą instrukcji `UPDATE` możemy zmieniać wartości w jednej lub wielu kolumnach jednocześnie. Na przykład:

```sql
UPDATE Klienci
SET email = 'nowy.email@example.com'
WHERE id_klienta = 1;
```

Ten kod zaktualizuje adres e-mail klienta o `id_klienta = 1` na '<nowy.email@example.com>'.

Możemy również zaktualizować wiele kolumn jednocześnie:

```sql
UPDATE Produkty
SET cena = 50.00, ilość_na_stanie = 10
WHERE id_produktu = 3;
```

Ten kod zaktualizuje cenę i ilość na stanie produktu o `id_produktu = 3`.

**Stosowanie klauzuli `WHERE`**

Klauzula `WHERE` pozwala nam wybrać konkretne wiersze do modyfikacji, na podstawie określonego warunku. Na przykład:

```sql
UPDATE Zamowienia
SET status = 'zrealizowane'
WHERE data_zamowienia < '2023-09-01';
```

Ten kod zaktualizuje status wszystkich zamówień złożonych przed 1 września 2023 roku na 'zrealizowane'.

**Podsumowanie**

Instrukcja `UPDATE` to niezwykle przydatne narzędzie do modyfikowania istniejących danych w bazie danych SQLite. Dzięki niej możemy łatwo i precyzyjnie wprowadzać zmiany w wybranych wierszach, dostosowując dane do aktualnych potrzeb.

## DELETE

Świetnie, przejdźmy do instrukcji `DELETE`! To narzędzie pozwala nam **usuwać wiersze** z tabeli. Dzięki niej możemy pozbyć się danych, które stały się nieaktualne lub niepotrzebne, na przykład usunąć klienta, który zrezygnował z usług, anulować zamówienie, które nie zostało opłacone, czy usunąć produkt, który został wycofany ze sprzedaży.

**Składnia `DELETE FROM`**

Podstawowa składnia instrukcji `DELETE` wygląda następująco:

```sql
DELETE FROM nazwa_tabeli
WHERE warunek;
```

* `nazwa_tabeli`: Nazwa tabeli, z której chcemy usunąć wiersze.
* `WHERE warunek`: Opcjonalna klauzula, która pozwala nam wybrać konkretne wiersze do usunięcia. Jeśli pominiemy tę klauzulę, wszystkie wiersze w tabeli zostaną usunięte.

**Stosowanie klauzuli `WHERE`**

Klauzula `WHERE` pozwala nam wybrać konkretne wiersze do usunięcia, na podstawie określonego warunku. Na przykład:

```sql
DELETE FROM Zamowienia
WHERE status = 'anulowane';
```

Ten kod usunie wszystkie zamówienia, których status jest ustawiony na 'anulowane'.

**Ostrożność przy usuwaniu danych**

Usuwanie danych to operacja nieodwracalna, dlatego należy zachować szczególną ostrożność podczas korzystania z instrukcji `DELETE`. Zawsze upewnij się, że warunek w klauzuli `WHERE` jest poprawny i że usuwasz tylko te wiersze, które rzeczywiście chcesz usunąć.

**Podsumowanie**

Instrukcja `DELETE` to potężne, ale jednocześnie niebezpieczne narzędzie do usuwania danych z bazy danych SQLite. Dzięki niej możemy łatwo i precyzyjnie usuwać wybrane wiersze, ale zawsze należy zachować ostrożność, aby uniknąć przypadkowego usunięcia ważnych danych.
