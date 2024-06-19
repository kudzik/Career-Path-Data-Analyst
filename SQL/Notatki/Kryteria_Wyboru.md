# Kryteria wyboru w SQL

Kryteria wyboru w SQL służą do filtrowania wyników zapytania i wybierania tylko tych wierszy, które spełniają określone warunki. Pozwala to na precyzyjne wydobywanie potrzebnych danych z dużych tabel.

**Główne kryteria wyboru:**

1. **WHERE:**

Najważniejsza klauzula służąca do filtrowania danych. Określa warunek, który musi być spełniony, aby wiersz został uwzględniony w wynikach.

Składnia:

```sql
SELECT * FROM tabela
WHERE warunek;
```

* `warunek`: Wyrażenie logiczne, które ocenia się jako prawda lub fałsz dla każdego wiersza.

Przykład:

```sql
SELECT * FROM klienci
WHERE miasto = 'Kraków' AND kod_pocztowy LIKE '3%'
```

Wybierze wszystkich klientów z Krakowa, których kod pocztowy zaczyna się na "3".

2. **TOP:**

Umożliwia wybranie określonej liczby wierszy z początku wyników zapytania.

Składnia:

```sql
SELECT TOP n * FROM tabela
[ORDER BY kolumna];
```

* `n`: Liczba wierszy do wybrania.
* `ORDER BY`: Opcjonalna klauzula sortowania wierszy przed ich pobraniem.

Przykład:

```sql
SELECT TOP 5 * FROM produkty
ORDER BY cena ASC;
```

Wybierze 5 najtańszych produktów z tabeli `produkty`.

3. **PERCENT:**

Podobnie jak `TOP`, ale pobiera określony procent wierszy zamiast stałej liczby.

Składnia:

```sql
SELECT PERCENT n * FROM tabela
[ORDER BY kolumna];
```

* `n`: Procent wierszy do wybrania (wartość liczbowa z przedrostkiem "%").
* `ORDER BY`: Opcjonalna klauzula sortowania wierszy przed ich pobraniem.

Przykład:

```sql
SELECT PERCENT 10 * FROM zamówienia
ORDER BY data_zamówienia DESC;
```

Wybierze 10% najnowszych zamówień z tabeli `zamówienia`.

4. **LIKE:**

Umożliwia wyszukiwanie wzorców w wartościach tekstowych.

Składnia:

```sql
SELECT * FROM tabela
WHERE kolumna_tekstowa LIKE wzór;
```

* `wzór`: Wzorzec do wyszukiwania. Może zawierać znaki wieloznaczne:
    * `%`: Dowolny ciąg znaków.
    * `_`: Pojedynczy znak.
    * `[ ]`: Zakres znaków (np. `[A-Za-z]`).
    * `^`: Zaczyna się od
    * `$`: Kończy się na

Przykład:

```sql
SELECT * FROM klienci
WHERE nazwisko LIKE '%ski';
```

Wybierze wszystkich klientów z nazwiskiem kończącym się na "-ski".

5. **SOUNDEX:**

Używany do wyszukiwania przybliżeń fonetycznych słów. Pozwala znaleźć wiersze, których wartości tekstowe brzmią podobnie, nawet jeśli nie są identycznie zapisane.

Składnia:

```sql
SELECT * FROM tabela
WHERE SOUNDEX(kolumna_tekstowa) = kod_soundex;
```

* `kod_soundex`: Kod Soundex wygenerowany dla wyszukiwanego słowa.

Przykład:

```sql
SELECT * FROM produkty
WHERE SOUNDEX(nazwa) = 'A-261';
```

Wybierze produkty o nazwach fonetycznie brzmiących jak "Anna" (np. "Hanna", "Aneta").

### Operatorzy, które mog  wystapi w WHERE

| Operator | Opis |
| --- | --- |
| `=` | równe |
| `<>` | różne |
| `<` | mniejsze |
| `>` | większe |
| `<=` | mniejsze lub równe |
| `>=` | większe lub równe |
| `IN` | zawiera się w |
| `NOT IN` | nie zawiera się w |
| `IS NULL` | jest puste |
| `IS NOT NULL` | nie jest puste |
| `LIKE` | podobne do |
| `NOT LIKE` | nie podobne do |
| `BETWEEN` | wartość jest między dwoma liczbami |
| `EXISTS` | istnieje w |
| `NOT EXISTS` | nie istnieje w |



:bulb: Operator `>` możemy wykożystać również do tekstu. np. 
```sql
WHERE NazwiskoKlienta > 'K'
```

# Kryteria wyboru w SQL

Kryteria wyboru w SQL służą do filtrowania wyników zapytania i wybierania tylko tych wierszy, które spełniają określone warunki. Pozwala to na precyzyjne wydobywanie potrzebnych danych z dużych tabel.

**Główne kryteria wyboru:**

1. **WHERE:**

Najważniejsza klauzula służąca do filtrowania danych. Określa warunek, który musi być spełniony, aby wiersz został uwzględniony w wynikach.

Składnia:

```sql
SELECT * FROM tabela
WHERE warunek;
```

* `warunek`: Wyrażenie logiczne, które ocenia się jako prawda lub fałsz dla każdego wiersza.

Przykład:

```sql
SELECT * FROM klienci
WHERE miasto = 'Kraków' AND kod_pocztowy LIKE '3%'
```

Wybierze wszystkich klientów z Krakowa, których kod pocztowy zaczyna się na "3".

2. **TOP:**

Umożliwia wybranie określonej liczby wierszy z początku wyników zapytania.

Składnia:

```sql
SELECT TOP n * FROM tabela
[ORDER BY kolumna];
```

* `n`: Liczba wierszy do wybrania.
* `ORDER BY`: Opcjonalna klauzula sortowania wierszy przed ich pobraniem.

Przykład:

```sql
SELECT TOP 5 * FROM produkty
ORDER BY cena ASC;
```

Wybierze 5 najtańszych produktów z tabeli `produkty`.

3. **PERCENT:**

Podobnie jak `TOP`, ale pobiera określony procent wierszy zamiast stałej liczby.

Składnia:

```sql
SELECT PERCENT n * FROM tabela
[ORDER BY kolumna];
```

* `n`: Procent wierszy do wybrania (wartość liczbowa z przedrostkiem "%").
* `ORDER BY`: Opcjonalna klauzula sortowania wierszy przed ich pobraniem.

Przykład:

```sql
SELECT PERCENT 10 * FROM zamówienia
ORDER BY data_zamówienia DESC;
```

Wybierze 10% najnowszych zamówień z tabeli `zamówienia`.

4. **LIKE:**

Umożliwia wyszukiwanie wzorców w wartościach tekstowych.

Składnia:

```sql
SELECT * FROM tabela
WHERE kolumna_tekstowa LIKE wzór;
```

* `wzór`: Wzorzec do wyszukiwania. Może zawierać znaki wieloznaczne:
    * `%`: Dowolny ciąg znaków.
    * `_`: Pojedynczy znak.
    * `[ ]`: Zakres znaków (np. `[A-Za-z]`).

Przykład:

```sql
SELECT * FROM klienci
WHERE nazwisko LIKE '%ski';
```

Wybierze wszystkich klientów z nazwiskiem kończącym się na "-ski".

5. **SOUNDEX:**

Używany do wyszukiwania przybliżeń fonetycznych słów. Pozwala znaleźć wiersze, których wartości tekstowe brzmią podobnie, nawet jeśli nie są identycznie zapisane.

Składnia:

```sql
SELECT * FROM tabela
WHERE SOUNDEX(kolumna_tekstowa) = kod_soundex;
```

* `kod_soundex`: Kod Soundex wygenerowany dla wyszukiwanego słowa.

Przykład:

```sql
SELECT * FROM produkty
WHERE SOUNDEX(nazwa) = 'A-261';
```

Wybierze produkty o nazwach fonetycznie brzmiących jak "Anna" (np. "Hanna", "Aneta").

6. **DIFFERENCE:**

Służy do porównywania wartości z dwóch tabel i wybierania wierszy, których wartości w określonych kolumnach różnią się.

Składnia:

```sql
SELECT * FROM tabela1
EXCEPT
SELECT * FROM tabela2
WHERE kolumna = kolumna;
```

* `kolumna`: Nazwa kolumny, po której chcesz porównywać wartości.

Przykład:

Załóżmy, że masz tabele `klienci` i `zamówienia`, połączone kolumną `id_klienta`. Chcesz znaleźć klientów, którzy złożyli zamówienia, ale nie ma ich w tabeli `zamówienia`.

```sql
SELECT * FROM klienci
EXCEPT
SELECT k.* FROM klienci k
LEFT JOIN zamówienia o ON k.id_klienta = o.id_klienta
WHERE o.id_zamówienia IS NULL;
```

Wybierze klientów z tabeli

### Operatorzy, które mog  wystapi w WHERE

| Operator | Opis |
| --- | --- |
| `=` | równe |
| `<>` | różne |
| `<` | mniejsze |
| `>` | większe |
| `<=` | mniejsze lub równe |
| `>=` | większe lub równe |
| `IN` | zawiera się w |
| `NOT IN` | nie zawiera się w |
| `IS NULL` | jest puste |
| `IS NOT NULL` | nie jest puste |
| `LIKE` | podobne do |
| `NOT LIKE` | nie podobne do |
| `BETWEEN` | wartość jest między dwoma liczbami |
| `EXISTS` | istnieje w |
| `NOT EXISTS` | nie istnieje w |

### Znaki specjalne w LIKE

* `%`: Dowolny ciąg znakow
* `_`: Pojedynczy znak
* `[ ]`: Zakres znakow (np. `[A-Za-z]`)
* `^`: Zaczyna się od
* `$`: Kończy się na

:bulb: Operator `>` możemy wykożystać również do tekstu. np. 
```sql
WHERE NazwiskoKlienta > 'K'
```

Zapytanie SQL z wykorzystaniem `TOP` i `ORDER BY` do wyciągnięcia wierszy z największymi wartościami

**Przykład:**

Załóżmy, że masz tabelę `produkty` z kolumnami `id_produktu`, `nazwa`, `cena` i `kategoria`. Chcesz uzyskać listę 5 najdroższych produktów z kategorii "Elektronika".

```sql
SELECT TOP 5 id_produktu, nazwa, cena
FROM produkty
WHERE kategoria = 'Elektronika'
ORDER BY cena DESC;
```

**Wyjaśnienie:**

* `SELECT TOP 5`: Wybiera 5 pierwszych wierszy.
* `FROM produkty`: Określa tabelę, z której pobierane są dane.
* `WHERE kategoria = 'Elektronika'`: Filtruje wiersze tylko do kategorii "Elektronika".
* `ORDER BY cena DESC`: Sortuje wiersze malejąco według ceny, czyli od najdroższych do najtańszych.

**Dodatkowe informacje:**

* Możesz użyć dowolnych kryteriów filtrowania w klauzuli `WHERE`, aby zawęzić wyniki.
* Możesz sortować według wielu kolumn, podając je po przecinku w klauzuli `ORDER BY`.
* Możesz zmienić kierunek sortowania na rosnący (ASC) zamiast malejącego (DESC).

**Inne zastosowania:**

* Możesz użyć `TOP` do wyciągnięcia wierszy z najmniejszymi wartościami, stosując `ORDER BY ASC`.
* Możesz użyć `TOP` do wyciągnięcia określonego procentu wierszy, stosując `PERCENT`.
* Możesz użyć `TOP` w połączeniu z funkcjami agregującymi (np. `SUM`, `AVG`) do wyciągnięcia wierszy z największymi lub najmniejszymi wartościami agregowanymi.

Pamiętaj, że stosowanie `TOP` może powodować problemy z wydajnością, jeśli używasz go na dużych tabelach. W takich przypadkach warto rozważyć użycie alternatywnych metod, takich jak indeksowanie lub tworzenie widoków.

