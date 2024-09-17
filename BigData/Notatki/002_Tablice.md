# Tablice [] w BigQuery

## 1. Definicja

Tablice w BigQuery to uporządkowane kolekcje elementów tego samego typu danych. Są reprezentowane za pomocą nawiasów kwadratowych []. Tablice umożliwiają przechowywanie wielu wartości w jednej kolumnie, co jest szczególnie przydatne w przypadku danych zagnieżdżonych lub powtarzających się.

## 2. Tworzenie tablic

### 2.1 W zapytaniach

```sql
SELECT ['apple', 'banana', 'cherry'] AS fruits
```

### 2.2 W definicji schematu

```sql
CREATE TABLE mydataset.mytable
(
  id INT64,
  tags ARRAY<STRING>
)
```

## 3. Operacje na tablicach

### 3.1 Dostęp do elementów

- Indeksowanie zaczyna się od 1 (nie od 0 jak w większości języków programowania)

```sql
SELECT fruits[1] AS first_fruit
FROM (SELECT ['apple', 'banana', 'cherry'] AS fruits)
```

### 3.2 Funkcje tablicowe

- ARRAY_LENGTH(): Zwraca liczbę elementów w tablicy
- ARRAY_TO_STRING(): Konwertuje tablicę na string
- ARRAY_CONCAT(): Łączy tablice
- ARRAY_REVERSE(): Odwraca kolejność elementów w tablicy

### 3.3 Unnesting (rozwijanie tablic)

```sql
SELECT fruit
FROM mydataset.mytable,
UNNEST(fruits) AS fruit
```

## 4. Zapytania z użyciem tablic

### 4.1 Filtrowanie

```sql
SELECT *
FROM mydataset.mytable
WHERE 'apple' IN UNNEST(fruits)
```

### 4.2 Agregacje

```sql
SELECT 
  ANY_VALUE(id) AS id,
  ARRAY_AGG(DISTINCT fruit) AS unique_fruits
FROM mydataset.mytable,
UNNEST(fruits) AS fruit
GROUP BY id
```

## 5. Typowe zastosowania

- Przechowywanie tagów lub kategorii
- Zapisywanie historii zmian
- Reprezentacja danych hierarchicznych
- Optymalizacja zapytań poprzez denormalizację danych

## 6. Ograniczenia

- Maksymalna liczba elementów w tablicy: 10,000
- Tablice nie mogą zawierać innych tablic (brak zagnieżdżania tablic)
- Niektóre operacje na tablicach mogą być mniej wydajne niż na znormalizowanych danych

## 7. Najlepsze praktyki

- Używaj tablic do przechowywania powiązanych danych tego samego typu
- Rozważ denormalizację danych za pomocą tablic dla poprawy wydajności niektórych zapytań
- Pamiętaj o ograniczeniach przy projektowaniu schematu danych
