# SQL DQL

## Zapytania DQL

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

3. **WHERE** *(Opcjonalne)*

    - **Opis**: Filtruje wyniki zapytania, aby zwrócić tylko te wiersze, które spełniają określone warunki.
    - **Przykład**:

      ```sql
      WHERE author = 'Andrzej Sapkowski'
      ```

    - Można użyć różnych operatorów, takich jak `=`, `>`, `<`, `BETWEEN`, `LIKE` itp.

4. **GROUP BY** *(Opcjonalne)*

    - **Opis**: Grupuje wyniki na podstawie jednej lub więcej kolumn. Używane głównie z funkcjami agregującymi (np. `COUNT`, `SUM`, `AVG`).
    - **Przykład**:

      ```sql
      GROUP BY author
      ```

5. **HAVING** *(Opcjonalne)*

    - **Opis**: Filtruje grupy utworzone przez `GROUP BY`. Używane do określania warunków dla grup.
    - **Przykład**:

      ```sql
      HAVING COUNT(*) > 1
      ```

6. **ORDER BY** *(Opcjonalne)*

    - **Opis**: Sortuje wyniki zapytania według jednej lub więcej kolumn. Możesz sortować rosnąco (`ASC`) lub malejąco (`DESC`).
    - **Przykład**:

      ```sql
      ORDER BY published_year DESC
      ```

7. **LIMIT** *(Opcjonalne)*

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

- **SELECT author, COUNT(*) AS book_count**: Pobiera kolumnę `author` oraz liczbę książek dla każdego autora.
- **FROM books**: Zapytanie przeszukuje tabelę `books`.
- **WHERE published_year > 1980**: Filtruje książki, które zostały opublikowane po 1980 roku.
- **GROUP BY author**: Grupuje wyniki według autora.
- **HAVING COUNT(*) > 2**: Filtruje grupy, aby zwrócić tylko tych autorów, którzy mają więcej niż dwie książki.
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
