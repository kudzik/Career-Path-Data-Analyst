# DQL - SELECT

Zapytania DQL są podstawowym narzędziem do pobierania danych z bazy danych. Poniżej znajduje się pełen szablon zapytania SQL DQL, który można dostosować do różnych potrzeb, wraz z omówieniem poszczególnych części.

```sql
SELECT kolumny
FROM tabela
WHERE warunek
GROUP BY kolumny_grupujące
HAVING warunek_grupy
ORDER BY kolumny_sortujące
LIMIT liczba_wierszy;
```

### Omówienie poszczególnych elementów zapytania

1. **SELECT**

   - **Opis**: Określa, które kolumny chcesz pobrać z bazy danych.
   - **Przykład**:

     ```sql
     SELECT title, author
     ```

   - Możesz użyć `*`, aby pobrać wszystkie kolumny:

     ```sql
     SELECT *
     ```

2. **FROM**

   - **Opis**: Określa tabelę (lub tabele), z której mają być pobrane dane.
   - **Przykład**:

     ```sql
     FROM books
     ```

3. **WHERE** _(Opcjonalne)_

   - **Opis**: Filtruje wyniki zapytania, aby zwrócić tylko te wiersze, które spełniają określone warunki.
   - **Przykład**:

     ```sql
     WHERE author = 'Andrzej Sapkowski'
     ```

   - Można użyć różnych operatorów, takich jak `=`, `>`, `<`, `BETWEEN`, `LIKE` itp.

4. **GROUP BY** _(Opcjonalne)_

   - **Opis**: Grupuje wyniki na podstawie jednej lub więcej kolumn. Używane głównie z funkcjami agregującymi (np. `COUNT`, `SUM`, `AVG`).
   - **Przykład**:

     ```sql
     GROUP BY author
     ```

5. **HAVING** _(Opcjonalne)_

   - **Opis**: Filtruje grupy utworzone przez `GROUP BY`. Używane do określania warunków dla grup.
   - **Przykład**:

     ```sql
     HAVING COUNT(*) > 1
     ```

6. **ORDER BY** _(Opcjonalne)_

   - **Opis**: Sortuje wyniki zapytania według jednej lub więcej kolumn. Możesz sortować rosnąco (`ASC`) lub malejąco (`DESC`).
   - **Przykład**:

     ```sql
     ORDER BY published_year DESC
     ```

7. **LIMIT** _(Opcjonalne)_

   - **Opis**: Ogranicza liczbę zwróconych wierszy. Jest to przydatne, gdy chcesz zobaczyć tylko pierwsze n wierszy.
   - **Przykład**:

     ```sql
     LIMIT 10
     ```

### Przykładowe zapytanie

Poniżej znajduje się przykład kompletnego zapytania, które używa większości z powyższych elementów:

```sql
SELECT author, COUNT(*) AS book_count
FROM books
WHERE published_year > 1980
GROUP BY author
HAVING COUNT(*) > 2
ORDER BY book_count DESC
LIMIT 5;
```

**Omówienie przykładu:**

- **SELECT author, COUNT(\*) AS book_count**: Pobiera kolumnę `author` oraz liczbę książek dla każdego autora.
- **FROM books**: Zapytanie przeszukuje tabelę `books`.
- **WHERE published_year > 1980**: Filtruje książki, które zostały opublikowane po 1980 roku.
- **GROUP BY author**: Grupuje wyniki według autora.
- **HAVING COUNT(\*) > 2**: Filtruje grupy, aby zwrócić tylko tych autorów, którzy mają więcej niż dwie książki.
- **ORDER BY book_count DESC**: Sortuje wyniki malejąco według liczby książek.
- **LIMIT 5**: Ogranicza liczbę wyników do 5 wierszy.

### Podsumowanie

Ten szablon jest uniwersalnym narzędziem do tworzenia zapytań SQL w ramach DQL. Pozwala na precyzyjne określenie, jakie dane mają zostać pobrane i w jaki sposób mają być przetworzone. Zapamiętanie struktury i kolejności elementów ułatwi Ci tworzenie zapytań oraz manipulowanie danymi w bazie.

## Kolejność wykonywania zapytania SQL w SQLite

Chociaż zapytania SQL są pisane w określonej kolejności, rzeczywista kolejność, w jakiej są przetwarzane przez silnik bazy danych, różni się od kolejności, w jakiej są zapisywane. Zrozumienie tej kolejności jest kluczowe, aby właściwie rozumieć i optymalizować zapytania SQL.

Poniżej znajduje się typowa kolejność wykonywania zapytania SQL:

1. **FROM**
2. **WHERE**
3. **GROUP BY**
4. **HAVING**
5. **SELECT**
6. **ORDER BY**
7. **LIMIT**

### Szczegółowe omówienie kolejności

1. **FROM**

   - **Opis**: Proces przetwarzania zapytania zaczyna się od identyfikacji, które tabele są zaangażowane w zapytanie. W tej fazie są również łączone tabele, jeśli zapytanie obejmuje więcej niż jedną tabelę.
   - **Przykład**:

     ```sql
     FROM books
     ```

2. **WHERE**

   - **Opis**: Na tym etapie są filtrowane wiersze na podstawie warunków określonych w klauzuli `WHERE`. Tylko te wiersze, które spełniają warunki, przechodzą do kolejnych etapów.
   - **Przykład**:

     ```sql
     WHERE published_year > 1980
     ```

3. **GROUP BY**

   - **Opis**: Jeśli zapytanie zawiera `GROUP BY`, dane są grupowane na podstawie wskazanych kolumn. Ten etap jest kluczowy dla funkcji agregujących, takich jak `COUNT`, `SUM`, `AVG`, itp.
   - **Przykład**:

     ```sql
     GROUP BY author
     ```

4. **HAVING**

   - **Opis**: Po pogrupowaniu danych klauzula `HAVING` filtruje grupy danych na podstawie warunków. Jest to podobne do `WHERE`, ale działa na poziomie grup.
   - **Przykład**:

     ```sql
     HAVING COUNT(*) > 2
     ```

5. **SELECT**

   - **Opis**: Na tym etapie następuje wybór kolumn, które mają zostać zwrócone jako wynik zapytania. Dopiero teraz dane są rzeczywiście "pobierane".
   - **Przykład**:

     ```sql
     SELECT author, COUNT(*) AS book_count
     ```

6. **ORDER BY**

   - **Opis**: Po wybraniu danych są one sortowane zgodnie z warunkami określonymi w klauzuli `ORDER BY`. Można sortować dane rosnąco (`ASC`) lub malejąco (`DESC`).
   - **Przykład**:

     ```sql
     ORDER BY book_count DESC
     ```

7. **LIMIT**

   - **Opis**: Ostateczny krok, który ogranicza liczbę zwracanych wierszy. Tylko określona liczba wierszy trafia do wyniku końcowego.
   - **Przykład**:

     ```sql
     LIMIT 5
     ```

### Przykład zastosowania

Rozważmy poniższe zapytanie:

```sql
SELECT author, COUNT(*) AS book_count
FROM books
WHERE published_year > 1980
GROUP BY author
HAVING COUNT(*) > 2
ORDER BY book_count DESC
LIMIT 5;
```

**Kolejność przetwarzania tego zapytania:**

1. **FROM**: Wybierane są dane z tabeli `books`.
2. **WHERE**: Wiersze są filtrowane na podstawie warunku `published_year > 1980`.
3. **GROUP BY**: Dane są grupowane według `author`.
4. **HAVING**: Filtracja grup, aby pozostawić tylko te, gdzie liczba książek (liczba wierszy) jest większa niż 2.
5. **SELECT**: Zostają wybrane kolumny `author` i liczba książek dla każdego autora (`COUNT(*)`).
6. **ORDER BY**: Wyniki są sortowane malejąco według liczby książek (`book_count DESC`).
7. **LIMIT**: Wynik zostaje ograniczony do 5 wierszy.

### Podsumowanie

Zrozumienie kolejności wykonywania zapytania SQL jest kluczowe, aby tworzyć wydajne i poprawne zapytania. Kolejność ta różni się od kolejności pisania zapytania i jest zarządzana przez silnik bazy danych w taki sposób, aby uzyskać najlepszą wydajność i zgodność z logiką zapytania.

## Klauzula DISTINCT w SQLite

### Wstęp

Klauzula DISTINCT to bardzo użyteczne narzędzie w SQL, które pomaga nam uzyskać unikalne wartości z kolumny lub kombinacji kolumn. Wyobraź sobie, że masz koszyk pełen owoców i chcesz wiedzieć, jakie rodzaje owoców w nim są, bez liczenia powtórzeń. DISTINCT działa podobnie w świecie baz danych.

### Podstawowe użycie DISTINCT

Klauzula DISTINCT używana jest w zapytaniu SELECT, aby usunąć duplikaty z wyników. Oto jak to działa:

1. Umieszczamy DISTINCT zaraz po słowie SELECT.
2. DISTINCT wpływa na wszystkie wybrane kolumny.
3. Wynik zawiera tylko unikalne kombinacje wartości.

### Przykład

Załóżmy, że mamy tabelę `owoce` z następującymi danymi:

| id  | nazwa   | kolor    |
| --- | ------- | -------- |
| 1   | jabłko  | czerwony |
| 2   | banan   | żółty    |
| 3   | jabłko  | zielony  |
| 4   | gruszka | zielony  |
| 5   | jabłko  | czerwony |

Aby uzyskać listę unikalnych nazw owoców, użyjemy:

```sql
SELECT DISTINCT nazwa FROM owoce;
```

Wynik:

```
jabłko
banan
gruszka
```

### DISTINCT z wieloma kolumnami

DISTINCT może być również używany z wieloma kolumnami. W tym przypadku unikalne będą kombinacje wartości ze wszystkich wybranych kolumn.

```sql
SELECT DISTINCT nazwa, kolor FROM owoce;
```

Wynik:

```
jabłko, czerwony
banan, żółty
jabłko, zielony
gruszka, zielony
```

### Dobre praktyki

1. Używaj DISTINCT tylko wtedy, gdy jest to naprawdę potrzebne, ponieważ może wpływać na wydajność zapytania.
2. Rozważ użycie GROUP BY jako alternatywy, szczególnie gdy potrzebujesz dodatkowych agregacji.
3. Pamiętaj, że NULL jest traktowane jako unikalna wartość przez DISTINCT.

## LIKE i GLOB w SQL: Porównanie

**LIKE** i **GLOB** to operatory stosowane w zapytaniach SQL do porównywania wartości tekstowych z określonymi wzorcami. Chociaż oba służą do wyszukiwania, mają różne zestawy znaków specjalnych i reguły dopasowywania.

### LIKE

- **Najczęściej używany:** Jest to operator standardowy w SQL, obsługiwany przez większość systemów baz danych.
- **Znak specjalny `%`:** Zastępuje dowolną sekwencję znaków (w tym zero znaków).
- **Znak specjalny `_`:** Zastępuje pojedynczy znak.
- **Przykład:**

  ```sql
  SELECT * FROM products WHERE product_name LIKE 'A%';
  ```

  To zapytanie zwróci wszystkie produkty, których nazwa zaczyna się na literę "A".

### GLOB

- **Specyficzny dla niektórych baz danych:** Jest to operator charakterystyczny dla systemów baz danych, takich jak SQLite i PostgreSQL.
- **Znak specjalny `*`:** Zastępuje dowolną sekwencję znaków (podobnie jak `%` w LIKE).
- **Znak specjalny `?`:** Zastępuje pojedynczy znak (podobnie jak `_` w LIKE).
- **Dodatkowe znaki specjalne:** GLOB często oferuje dodatkowe znaki specjalne, takie jak klasy znaków (np. `[a-z]` dla małych liter) lub negacje (np. `[^0-9]` dla znaków innych niż cyfry).
- **Przykład:**

  ```sql
  SELECT * FROM products WHERE product_name GLOB 'A*';
  ```

  To zapytanie zwróci dokładnie te same wyniki co poprzednie, ponieważ `*` w GLOB działa tak samo jak `%` w LIKE.

## Tabela porównawcza

| Cecha                                  | LIKE                                          | GLOB                                                                                  |
| -------------------------------------- | --------------------------------------------- | ------------------------------------------------------------------------------------- |
| **Standard**                           | SQL standardowy                               | Specyficzny dla niektórych baz danych                                                 |
| **Znak dla dowolnej sekwencji znaków** | %                                             | \*                                                                                    |
| **Znak dla pojedynczego znaku**        | \_                                            | ?                                                                                     |
| **Dodatkowe znaki specjalne**          | Zwykle mniej                                  | Często więcej, np. klasy znaków, negacje                                              |
| **Wydajność**                          | Może się różnić w zależności od implementacji | Może być bardziej wydajny w niektórych przypadkach, zwłaszcza przy złożonych wzorcach |

## Kiedy używać którego operatora?

- **LIKE:** Jest to bezpieczny wybór, który działa w większości systemów baz danych. Jest odpowiedni dla prostych wzorców wyszukiwania.
- **GLOB:** Może być bardziej wydajny i elastyczny w przypadku złożonych wzorców, zwłaszcza jeśli potrzebujesz użyć dodatkowych znaków specjalnych. Jednakże, jego użycie jest ograniczone do systemów baz danych, które go obsługują.

**Podsumowanie:**

Oba operatory są przydatne do wyszukiwania danych na podstawie wzorców tekstowych. Wybór między LIKE a GLOB zależy od konkretnych wymagań zapytania, systemu baz danych i preferencji programisty.

**Kiedy używać GLOB:**

- **Złożone wzorce:** Jeśli potrzebujesz precyzyjnie dopasować wzorce, np. za pomocą klas znaków lub negacji.
- **Wydajność:** W niektórych przypadkach, GLOB może być bardziej wydajny niż LIKE, zwłaszcza przy dużych zbiorach danych.
- **Systemy baz danych:** Jeśli używasz systemu baz danych, który natywnie obsługuje GLOB (np. SQLite, PostgreSQL).

**Kiedy używać LIKE:**

- **Proste wzorce:** Dla większości prostych zapytań, LIKE jest wystarczający.
- **Kompatybilność:** Jeśli potrzebujesz, aby zapytanie działało w różnych systemach baz danych.

**Pamiętaj:** Zawsze sprawdzaj dokumentację konkretnego systemu baz danych, aby uzyskać szczegółowe informacje na temat obsługiwanych operatorów i ich składni.

## Funkcje agregujące w SQL: Podsumowanie kluczowych informacji

**Funkcje agregujące** to specjalne funkcje w SQL, które służą do obliczania wartości na podstawie zbioru wierszy w tabeli. Zamiast zwracać poszczególne wartości, jak zwykłe kolumny, funkcje agregujące zwracają jedną wartość, która jest wynikiem obliczeń na całym zbiorze danych.

### Najczęściej używane funkcje agregujące

- **COUNT(\*):** Zlicza liczbę wierszy w zbiorze danych.
- **SUM(kolumna):** Oblicza sumę wartości w określonej kolumnie.
- **AVG(kolumna):** Oblicza średnią arytmetyczną wartości w określonej kolumnie.
- **MIN(kolumna):** Zwraca najmniejszą wartość w określonej kolumnie.
- **MAX(kolumna):** Zwraca największą wartość w określonej kolumnie.

### Przykładowe zastosowania

- **Obliczanie sumy sprzedaży:**

  ```sql
  SELECT SUM(kwota_sprzedaży) AS całkowita_sprzedaż
  FROM zamówienia;
  ```

- **Znajdowanie najdroższego produktu:**

  ```sql
  SELECT MAX(cena) AS najwyższa_cena
  FROM produkty;
  ```

- **Liczenie liczby klientów w każdym mieście:**

  ```sql
  SELECT miasto, COUNT(*) AS liczba_klientow
  FROM klienci
  GROUP BY miasto;
  ```

### Klauzula GROUP BY

Aby stosować funkcje agregujące na podzbiorach danych, używamy klauzuli `GROUP BY`. Grupuje ona wiersze według wartości jednej lub więcej kolumn, a następnie funkcje agregujące są obliczane dla każdej grupy.

### Przykład z GROUP BY

```sql
SELECT kraj, COUNT(*) AS liczba_klientow
FROM klienci
GROUP BY kraj;
```

To zapytanie zliczy liczbę klientów w każdym kraju.

### Ważne uwagi

- **Kolumny w SELECT:** Oprócz funkcji agregujących, w klauzuli `SELECT` mogą pojawić się tylko kolumny, które są wymienione w `GROUP BY` lub znajdują się wewnątrz funkcji agregujących.
- **HAVING:** Klauzula `HAVING` służy do filtrowania wyników grupowania. Można jej użyć do wybrania tylko tych grup, które spełniają określone warunki.

- **COUNT(\*):** zlicza wszystkie wiersze, w tym te, które zawierają wartości NULL. To oznacza, że jeśli masz kolumnę z wieloma wartościami NULL, a użyjesz `COUNT(*)`, to zliczone zostaną wszystkie wiersze, niezależnie od tego, czy w tej kolumnie jest wartość, czy też NULL.
- **COUNT(kolumna):** Zlicza tylko wiersze, w których określona kolumna ma wartość inną niż NULL. Jeśli w kolumnie są wartości NULL, to one nie będą wliczane do wyniku.

**Przykład:**

Załóżmy, że mamy tabelę `klienci` z kolumnami `id` i `miasto`. Niektóre wiersze w kolumnie `miasto` mogą mieć wartość NULL (np. jeśli nie znamy miasta klienta).

- **`SELECT COUNT(*) FROM klienci;`:** To zapytanie zwróci liczbę wszystkich klientów, niezależnie od tego, czy znamy ich miasto, czy nie.
- **`SELECT COUNT(miasto) FROM klienci;`:** To zapytanie zwróci liczbę klientów, dla których znamy miasto (czyli nie mają wartości NULL w kolumnie `miasto`).

**Podsumowanie:**

- **Chcesz zliczyć wszystkie wiersze, niezależnie od wartości w kolumnach?** Użyj `COUNT(*)`.
- **Chcesz zliczyć tylko wiersze, które mają wartość inną niż NULL w określonej kolumnie?** Użyj `COUNT(kolumna)`.

**Kiedy używać której opcji?**

- **COUNT(\*)** jest przydatne, gdy chcesz poznać całkowitą liczbę wierszy w tabeli lub w wyniku zapytania.
- **COUNT(kolumna)** jest przydatne, gdy chcesz zliczyć tylko wiersze, które spełniają określone kryterium dotyczące konkretnej kolumny.

**Dodatkowe uwagi:**

- **NULL** to specjalny wartość w SQL, która oznacza "brak wartości".
- **NULL** nie jest równy żadnej innej wartości, nawet samemu sobie. Dlatego nie można go porównywać za pomocą operatorów równości (`=`) lub nierówności (`<>`).
- Aby sprawdzić, czy wartość jest NULL, używa się operatora `IS NULL` lub `IS NOT NULL`.

## Funkcje na łańcuchach znaków w SQL

Funkcje operujące na łańcuchach znaków (stringach) są niezwykle przydatne w bazach danych, gdy chcemy manipulować, porównywać lub ekstrahować informacje z tekstowych danych. Oto szczegółowy przegląd najczęściej używanych funkcji, wraz z przykładami:

### Zmiana rejestru

- **UPPER(ciąg_znaków):** Konwertuje wszystkie litery na wielkie.

  ```sql
  SELECT UPPER('ala ma kota') AS wielkie_litery; -- wynik: ALA MA KOTA
  ```

- **LOWER(ciąg_znaków):** Konwertuje wszystkie litery na małe.

  ```sql
  SELECT LOWER('ALA MA KOTA') AS małe_litery; -- wynik: ala ma kota
  ```

### Wycinanie podciągów

- **SUBSTRING(ciąg_znaków, pozycja_początkowa, długość):** Wycina fragment ciągu.

  ```sql
  SELECT SUBSTRING('przykładowy_ciąg', 5, 4) AS wycinek; -- wynik: adowy
  ```

- **LEFT(ciąg_znaków, liczba_znaków):** Wycina znaki od początku.

  ```sql
  SELECT LEFT('przykładowy_ciąg', 3) AS pierwsze_3; -- wynik: przy
  ```

- **RIGHT(ciąg_znaków, liczba_tekstów):** Wycina znaki od końca.

  ```sql
  SELECT RIGHT('przykładowy_ciąg', 5) AS ostatnie_5; -- wynik: ciąg
  ```

### Łączenie ciągów

- **CONCAT(ciąg1, ciąg2, ...):** Łączy podane ciągi.

  ```sql
  SELECT CONCAT('Imię: ', 'Jan', ', Nazwisko: ', 'Kowalski') AS pełne_imię;
  ```

- **Operator ||:** W niektórych bazach danych (np. PostgreSQL) służy do konkatenacji.

  ```sql
  SELECT 'Imię: ' || 'Jan' || ', Nazwisko: ' || 'Kowalski';
  ```

### Wyszukiwanie podciągów

- **LOCATE(podciąg, ciąg):** Zwraca pozycję pierwszego wystąpienia podciągu.

  ```sql
  SELECT LOCATE('ma', 'Ala ma kota') AS pozycja; -- wynik: 5
  ```

- **INSTR(ciąg, podciąg):** Podobna do LOCATE, może mieć dodatkowe parametry.

### Manipulowanie długością ciągów

- **LENGTH(ciąg_znaków):** Zwraca liczbę znaków.

  ```sql
  SELECT LENGTH('przykładowy_ciąg') AS długość;
  ```

- **TRIM(ciąg_znaków):** Usuwa białe znaki z początku i końca.

- **LTRIM(ciąg_znaków):** Usuwa białe znaki z początku.
- **RTRIM(ciąg_znaków):** Usuwa białe znaki z końca.

### Zastępowanie znaków

- **REPLACE(ciąg, stary_podciąg, nowy_podciąg):** Zastępuje wszystkie wystąpienia.

  ```sql
  SELECT REPLACE('Ala ma kota', 'ma', 'lubi') AS nowy_tekst;
  ```

### Inne przydatne funkcje

- **SUBSTRING_INDEX(ciąg, separator, pozycja):** Wycina część ciągu przed lub po określonym separatorze.

- **REVERSE(ciąg):** Odwraca kolejność znaków w ciągu.
- **UPPER, LOWER, INITCAP:** Zmienia rejestr na wielkie, małe lub z pierwszą wielką literą.

### Zastosowania

- **Formatowanie danych:** Zmiana formatu daty, dodawanie prefiksów/sufiksów.

- **Wyszukiwanie:** Znalezienie konkretnych słów lub fraz.
- **Walidacja danych:** Sprawdzenie, czy dane spełniają kryteria (np. poprawny format email).
- **Ekstrakcja informacji:** Wyodrębnienie części z dłuższych ciągów.

**Przykład praktyczny:**

```sql
SELECT UPPER(imie) AS imie_wielkimi,
       LEFT(nazwisko, 3) AS pierwsze_3_litery_nazwiska
FROM klienci
WHERE miasto LIKE '%Warszawa%';
```

Zwraca imię klientów z Warszawy wielkimi literami i pierwsze 3 litery nazwiska.

## Grupowanie danych w SQLite

### Wstęp

Grupowanie danych to kluczowa koncepcja w SQL, która pozwala na agregację i analizę informacji w bardziej złożony sposób. W SQLite, podobnie jak w innych systemach bazodanowych, grupowanie umożliwia nam łączenie wierszy na podstawie wspólnych wartości w jednej lub kilku kolumnach.

### Szczegółowe omówienie

#### Klauzula GROUP BY

Klauzula GROUP BY jest głównym narzędziem do grupowania danych w SQL. Pozwala na podział wyników zapytania na grupy na podstawie wartości w jednej lub więcej kolumnach.

##### Podstawowa składnia

```sql
SELECT kolumna1, kolumna2, funkcja_agregująca(kolumna3)
FROM tabela
GROUP BY kolumna1, kolumna2;
```

#### Funkcje agregujące

Grupowanie często idzie w parze z funkcjami agregującymi. Najczęściej używane to:

1. COUNT() - zlicza liczbę wierszy
2. SUM() - sumuje wartości
3. AVG() - oblicza średnią
4. MAX() - znajduje maksymalną wartość
5. MIN() - znajduje minimalną wartość

#### Przykład tabeli

Załóżmy, że mamy tabelę `sprzedaz`:

```sql
CREATE TABLE sprzedaz (
    id INTEGER PRIMARY KEY,
    produkt TEXT,
    kategoria TEXT,
    cena DECIMAL(10, 2),
    data_sprzedazy DATE
);

INSERT INTO sprzedaz (produkt, kategoria, cena, data_sprzedazy) VALUES
('Laptop', 'Elektronika', 3500.00, '2023-01-15'),
('Smartfon', 'Elektronika', 1200.00, '2023-01-16'),
('Buty', 'Odzież', 250.00, '2023-01-15'),
('Kurtka', 'Odzież', 450.00, '2023-01-17'),
('Tablet', 'Elektronika', 1800.00, '2023-01-18'),
('Spodnie', 'Odzież', 180.00, '2023-01-18');
```

#### Przykłady grupowania

##### 1. Grupowanie po kategorii

```sql
SELECT kategoria, COUNT(*) as liczba_produktow, SUM(cena) as suma_sprzedazy
FROM sprzedaz
GROUP BY kategoria;
```

Wynik:

```
kategoria   | liczba_produktow | suma_sprzedazy
------------| ---------------- | --------------
Elektronika | 3                | 6500.00
Odzież      | 3                | 880.00
```

##### 2. Grupowanie po dacie sprzedaży

```sql
SELECT data_sprzedazy, COUNT(*) as liczba_transakcji, AVG(cena) as srednia_cena
FROM sprzedaz
GROUP BY data_sprzedazy;
```

Wynik:

```
data_sprzedazy | liczba_transakcji | srednia_cena
--------------- | ----------------- | ------------
2023-01-15     | 2                 | 1875.00
2023-01-16     | 1                 | 1200.00
2023-01-17     | 1                 | 450.00
2023-01-18     | 2                 | 990.00
```

#### Klauzula HAVING

HAVING jest używane z GROUP BY do filtrowania wyników grupowania, podobnie jak WHERE filtruje pojedyncze wiersze.

```sql
SELECT kategoria, AVG(cena) as srednia_cena
FROM sprzedaz
GROUP BY kategoria
HAVING srednia_cena > 1000;
```

Wynik:

```
kategoria   | srednia_cena
------------| ------------
Elektronika | 2166.67
```

#### Dobre praktyki

1. Używaj GROUP BY z funkcjami agregującymi, aby uzyskać znaczące wyniki.
2. Pamiętaj, że kolumny w SELECT, które nie są agregowane, muszą być wymienione w GROUP BY.
3. Używaj HAVING do filtrowania grup, a WHERE do filtrowania pojedynczych wierszy przed grupowaniem.
4. Uważaj na wydajność przy grupowaniu dużych zbiorów danych - rozważ użycie indeksów.

#### Różnica między WHERE a HAVING

- WHERE filtruje wiersze przed grupowaniem.
- HAVING filtruje grupy po grupowaniu.

```sql
SELECT kategoria, COUNT(*) as liczba_produktow
FROM sprzedaz
WHERE cena > 500
GROUP BY kategoria
HAVING liczba_produktow > 1;
```

### Podsumowanie

Grupowanie danych w SQLite jest potężnym narzędziem do analizy i agregacji informacji. Pozwala na tworzenie podsumowań, raportów i znajdowanie wzorców w danych. Umiejętne korzystanie z GROUP BY, funkcji agregujących i klauzuli HAVING może znacznie zwiększyć możliwości analizy danych w bazie.

## `CASE WHEN` w SQL

Instrukcja `CASE WHEN` w SQL jest potężnym narzędziem pozwalającym na warunkowe manipulowanie danymi w zapytaniach. Działa podobnie do instrukcji `if-else` znanej z innych języków programowania. Pozwala ona na wykonywanie różnych akcji w zależności od spełnienia określonych warunków.

### Składnia `CASE WHEN`

```sql
SELECT kolumny,
       CASE
           WHEN warunek1 THEN wartość1
           WHEN warunek2 THEN wartość2
           ...
           ELSE wartość_n
       END AS alias
FROM tabela;
```

- **`CASE`**: Rozpoczyna blok warunkowy.
- **`WHEN`**: Definiuje warunek do sprawdzenia.
- **`THEN`**: Określa, jaka wartość zostanie zwrócona, jeśli warunek jest spełniony.
- **`ELSE`**: (Opcjonalnie) Określa wartość domyślną, jeśli żaden warunek nie jest spełniony.
- **`END`**: Kończy blok `CASE`.

### Przykłady użycia

#### Przykład 1: Klasyfikacja na podstawie wartości

Załóżmy, że masz tabelę `Product` i chcesz skategoryzować produkty na podstawie ich ceny (`UnitPrice`).

```sql
SELECT ProductName, UnitPrice,
       CASE
           WHEN UnitPrice > 50 THEN 'Drogi'
           WHEN UnitPrice BETWEEN 20 AND 50 THEN 'Średni'
           ELSE 'Tani'
       END AS CenaKategoria
FROM Product;
```

**Opis:**

- Produkty z ceną powyżej 50 jednostek są oznaczane jako „Drogi”.
- Produkty z ceną między 20 a 50 jednostek jako „Średni”.
- W przeciwnym razie jako „Tani”.

#### Przykład 2: Wyświetlanie informacji o stanach magazynowych

Możesz również użyć `CASE WHEN`, aby pokazać informację o stanie magazynowym w tabeli `Product`, w zależności od liczby dostępnych jednostek (`UnitsInStock`).

```sql
SELECT ProductName, UnitsInStock,
       CASE
           WHEN UnitsInStock > 100 THEN 'Duży zapas'
           WHEN UnitsInStock BETWEEN 50 AND 100 THEN 'Średni zapas'
           WHEN UnitsInStock > 0 THEN 'Niski zapas'
           ELSE 'Brak zapasów'
       END AS StanMagazynowy
FROM Product;
```

**Opis:**

- Produkty z ponad 100 jednostkami w magazynie są oznaczane jako „Duży zapas”.
- Produkty z liczbą jednostek od 50 do 100 są oznaczane jako „Średni zapas”.
- Produkty z liczbą jednostek od 1 do 49 są oznaczane jako „Niski zapas”.
- Produkty, które mają 0 jednostek na stanie, są oznaczane jako „Brak zapasów”.

### Przykład 3: Użycie `CASE` w klauzuli `ORDER BY`

Możesz także użyć `CASE WHEN` w klauzuli `ORDER BY`, aby zmienić sposób sortowania danych na podstawie warunków.

```sql
SELECT ProductName, UnitsInStock
FROM Product
ORDER BY 
    CASE 
        WHEN UnitsInStock = 0 THEN 1 
        ELSE 0 
    END ASC, 
    UnitsInStock DESC;
```

**Opis:**

- Produkty, które mają `0` jednostek w magazynie, są sortowane na końcu, a pozostałe produkty są sortowane według liczby jednostek w magazynie malejąco.

### Podsumowanie

Instrukcja `CASE WHEN` to bardzo elastyczne narzędzie w SQL, które pozwala na tworzenie złożonych zapytań dostosowanych do różnych scenariuszy. Możesz ją używać w selekcji danych, do generowania kolumn, a także do kontrolowania kolejności sortowania.

## Podzapytania w SQL

Podzapytanie, zwane także zapytaniem zagnieżdżonym (ang. _subquery_), to zapytanie, które znajduje się wewnątrz innego zapytania SQL. Wynik podzapytania jest używany przez zapytanie zewnętrzne (główne), aby dostarczyć dane do dalszego przetwarzania.

### Rodzaje podzapytań

Podzapytania można stosować w różnych miejscach w zapytaniu SQL, takich jak:

1. **Podzapytania w klauzuli `WHERE`** – używane do filtrowania wyników.
2. **Podzapytania w klauzuli `FROM`** – traktowane jako tymczasowa tabela.
3. **Podzapytania w klauzuli `SELECT`** – używane do obliczeń lub transformacji danych w kolumnach.

### Przykłady podzapytań

#### 1. Podzapytanie w klauzuli `WHERE`

Załóżmy, że chcemy znaleźć wszystkie produkty, które mają cenę wyższą niż średnia cena wszystkich produktów.

```sql
SELECT ProductName, UnitPrice
FROM Product
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Product);
```

**Opis:**

- Podzapytanie `(SELECT AVG(UnitPrice) FROM Product)` oblicza średnią cenę wszystkich produktów.
- Główne zapytanie zwraca tylko te produkty, których cena jest wyższa od średniej.

#### 2. Podzapytanie w klauzuli `FROM`

Podzapytania w klauzuli `FROM` mogą być traktowane jak tymczasowe tabele. Na przykład, możemy znaleźć średnią cenę dla każdej kategorii produktów:

```sql
SELECT CategoryID, AVG(UnitPrice) AS AvgPrice
FROM Product
GROUP BY CategoryID;
```

Następnie możemy użyć tego wyniku jako tymczasowej tabeli do dalszych analiz:

```sql
SELECT CategoryID, AvgPrice
FROM (SELECT CategoryID, AVG(UnitPrice) AS AvgPrice
      FROM Product
      GROUP BY CategoryID) AS AvgCategoryPrices
WHERE AvgPrice > 20;
```

**Opis:**

- Wewnętrzne zapytanie (podzapytanie) oblicza średnią cenę dla każdej kategorii produktów.
- Zewnętrzne zapytanie filtruje te wyniki, wybierając tylko kategorie z średnią ceną powyżej 20 jednostek.

#### 3. Podzapytanie w klauzuli `SELECT`

Podzapytania w klauzuli `SELECT` są używane do obliczeń w kolumnach. Na przykład, możemy wyświetlić nazwę produktu oraz liczbę zamówień dla każdego produktu:

```sql
SELECT ProductName,
       (SELECT COUNT(*) 
        FROM OrderDetail 
        WHERE Product.ProductID = OrderDetail.ProductID) AS OrdersCount
FROM Product;
```

**Opis:**

- Podzapytanie `(SELECT COUNT(*) FROM OrderDetail WHERE Product.ProductID = OrderDetail.ProductID)` liczy liczbę zamówień dla danego produktu.
- Wynik podzapytania jest wyświetlany jako nowa kolumna `OrdersCount` w wynikach zapytania głównego.

### Zasady i dobre praktyki

- **Złożoność:** Podzapytania mogą znacząco zwiększyć złożoność zapytania, dlatego warto je stosować z umiarem.
- **Wydajność:** Czasami używanie podzapytań może prowadzić do spadku wydajności, szczególnie w przypadku dużych zbiorów danych. W takich sytuacjach warto rozważyć inne podejścia, jak np. łączenie tabel (_JOIN_).
- **Czytelność:** Długie zapytania z wieloma podzapytań mogą być trudne do zrozumienia i utrzymania. W takich przypadkach warto rozważyć ich podział na mniejsze, łatwiejsze do zrozumienia części.

### Przykładowe zadanie

**Zadanie:** Wyświetl nazwę i cenę każdego produktu, który ma wyższą cenę niż średnia cena produktów w tej samej kategorii.

```sql
SELECT ProductName, UnitPrice
FROM Product AS p
WHERE UnitPrice > (SELECT AVG(UnitPrice)
                   FROM Product
                   WHERE CategoryID = p.CategoryID);
```

**Opis:**

- Podzapytanie oblicza średnią cenę dla produktów w tej samej kategorii (`CategoryID`).
- Główne zapytanie zwraca tylko te produkty, które mają wyższą cenę niż średnia w ich kategorii.

### Podsumowanie

Podzapytania są bardzo przydatnym narzędziem w SQL, pozwalającym na wykonywanie złożonych operacji w ramach jednego zapytania. Pozwalają na dynamiczne filtrowanie, grupowanie i transformację danych, co czyni je nieocenionym narzędziem w analizie danych.
