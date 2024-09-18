# Funkcje

## Funkcje `CAST` i `SAFE_CAST` w BigQuery

### Wprowadzenie

W BigQuery, funkcje `CAST` i `SAFE_CAST` służą do konwersji danych między różnymi typami. To tak, jakbyś miał magiczną różdżkę, która potrafi zmienić jabłko w pomarańczę, a liczbę w tekst! Czasami potrzebujemy takiej transformacji, aby dane były zgodne z oczekiwaniami zapytania lub aby móc wykonać na nich określone operacje.

### `CAST`

Funkcja `CAST` próbuje przekonwertować wartość na określony typ danych. Jeśli konwersja się powiedzie, zwraca wartość w nowym typie. Jeśli konwersja się nie powiedzie, zapytanie zwróci błąd.

**Składnia:**

```sql
CAST(wyrażenie AS typ_docelowy)
```

**Przykład:**

```sql
SELECT CAST('123' AS INT64) AS liczba;  -- Zwróci 123
SELECT CAST('3.14' AS FLOAT64) AS liczba_zmiennoprzecinkowa;  -- Zwróci 3.14
SELECT CAST('2023-09-17' AS DATE) AS data;  -- Zwróci 2023-09-17
```

### `SAFE_CAST`

Funkcja `SAFE_CAST` działa podobnie do `CAST`, ale zamiast zwracać błąd w przypadku nieudanej konwersji, zwraca wartość `NULL`. To bezpieczniejsza opcja, jeśli nie jesteśmy pewni, czy wszystkie wartości można przekonwertować na docelowy typ danych.

**Składnia:**

```sql
SAFE_CAST(wyrażenie AS typ_docelowy)
```

**Przykład:**

```sql
SELECT SAFE_CAST('abc' AS INT64) AS liczba;  -- Zwróci NULL
SELECT SAFE_CAST('3.14' AS FLOAT64) AS liczba_zmiennoprzecinkowa;  -- Zwróci 3.14
SELECT SAFE_CAST('2023-09-17' AS DATE) AS data;  -- Zwróci 2023-09-17
```

### Kiedy używać `CAST` a kiedy `SAFE_CAST`?

* `CAST`: Używaj, gdy jesteś pewien, że wszystkie wartości można przekonwertować na docelowy typ danych.
* `SAFE_CAST`: Używaj, gdy istnieje ryzyko, że niektóre wartości nie będą mogły zostać przekonwertowane, a chcesz uniknąć błędów w zapytaniu.

## Łączanie funkcji `CAST` i `CONCAT`

```SQL
SELECT
  age, 
  CAST(age as FLOAT64) as Age_float,
  CAST(age as String) as Age_String,
  CONCAT(CAST(age as String), ' years old')
  
  name 
FROM
  `nauka-big-query.funkcje.people`
LIMIT
  1000
```

## Tworzenie własnych funkcji w BigQuery

### Wprowadzenie

W BigQuery, oprócz wbudowanych funkcji, możesz tworzyć własne funkcje, zwane **funkcjami zdefiniowanymi przez użytkownika (UDF)**. Dają Ci one możliwość rozszerzenia funkcjonalności BigQuery i dostosowania jej do swoich specyficznych potrzeb. To tak, jakbyś miał możliwość dodania nowych narzędzi do swojej skrzynki narzędziowej, które idealnie pasują do Twoich zadań!

### Rodzaje UDF

BigQuery obsługuje dwa rodzaje UDF:

1. **Funkcje SQL:** Definiowane są za pomocą standardowego języka SQL i są wykonywane bezpośrednio w silniku BigQuery. Są one zazwyczaj szybsze, ale mają pewne ograniczenia w zakresie dostępnych operacji.
2. **Funkcje JavaScript:** Definiowane są za pomocą języka JavaScript i są wykonywane w środowisku Node.js. Dają one większą elastyczność, ale mogą być wolniejsze od funkcji SQL.

### Tworzenie funkcji SQL

Aby utworzyć funkcję SQL, używamy instrukcji `CREATE FUNCTION`:

```sql
CREATE FUNCTION mój_zestaw_danych.moja_funkcja(argument1 typ_danych1, argument2 typ_danych2, ...)
RETURNS typ_zwracany
AS (
  -- Tutaj definiujemy logikę funkcji za pomocą zapytania SQL
  argument1 * argument2 -- np
);
```

**Przykład:**

```sql
CREATE FUNCTION mój_zestaw_danych.oblicz_podatek(cena FLOAT64, stawka_podatku FLOAT64)
RETURNS FLOAT64
AS (
  cena * stawka_podatku
);
```

### Tworzenie funkcji JavaScript

Aby utworzyć funkcję JavaScript, używamy również instrukcji `CREATE FUNCTION`, ale z dodatkowym określeniem języka:

```sql
CREATE FUNCTION mój_zestaw_danych.moja_funkcja_js(argument1 typ_danych1, argument2 typ_danych2, ...)
RETURNS typ_zwracany
LANGUAGE js AS """
  -- Tutaj definiujemy logikę funkcji za pomocą kodu JavaScript
  return ...;
""";
```

**Przykład:**

```sql
CREATE FUNCTION mój_zestaw_danych.formatuj_date(data TIMESTAMP)
RETURNS STRING
LANGUAGE js AS """
  return new Date(data).toLocaleDateString('pl-PL');
""";
```

### Używanie UDF

UDF można używać w zapytaniach SQL tak samo, jak wbudowane funkcje BigQuery.

**Przykład:**

```sql
SELECT 
    id_produktu, 
    nazwa_produktu, 
    mój_zestaw_danych.oblicz_podatek(cena, 0.23) AS cena_z_podatkiem
FROM produkty;
```

### `COUNTIF`

Funkcja `COUNTIF` zlicza liczbę wierszy w grupie, które spełniają określony warunek. Jest to przydatne, gdy chcemy poznać liczbę wystąpień konkretnej wartości lub spełnienia określonego kryterium w grupie.

**Składnia:**

```sql
COUNTIF(warunek)
```

**Przykład:**

Załóżmy, że mamy tabelę `zamówienia` z kolumnami `id_zamówienia`, `data_zamówienia` i `status_zamówienia`. Chcemy policzyć, ile zamówień ma status "zrealizowane".

```sql
SELECT 
  COUNTIF(status_zamówienia = 'zrealizowane') AS liczba_zrealizowanych_zamówień
FROM zamówienia;
```

**Rezultat przykładowego zapytania:**

| liczba_zrealizowanych_zamówień |
|---------------------------------|
| 53                              |

### `ANY_VALUE`

Funkcja `ANY_VALUE` zwraca dowolną wartość z grupy. Jest to przydatne, gdy chcemy uzyskać przykładową wartość z grupy, szczególnie gdy wszystkie wartości w grupie są takie same lub gdy chcemy uniknąć duplikatów w wynikach.

**Składnia:**

```sql
ANY_VALUE(wyrażenie)
```

**Przykład:**

Załóżmy, że mamy tabelę `produkty` z kolumnami `id_produktu`, `nazwa_produktu` i `kategoria`. Chcemy uzyskać nazwę dowolnego produktu z każdej kategorii.

```sql
SELECT 
  kategoria,
  ANY_VALUE(nazwa_produktu) AS przykładowy_produkt
FROM produkty
GROUP BY kategoria;
```

**Rezultat przykładowego zapytania:**

| kategoria   | przykładowy_produkt      |
|-------------|-------------------------|
| Elektronika | Laptop                  |
| AGD         | Lodówka                |
| Ogród       | Kosiarka                |

### `STRING_AGG`

Funkcja `STRING_AGG` łączy wartości tekstowe z grupy w jeden ciąg znaków, oddzielając je określonym separatorem. Jest to przydatne, gdy chcemy wyświetlić wszystkie wartości z grupy w jednym wierszu.

**Składnia:**

```sql
STRING_AGG(wyrażenie [, separator])
```

**Przykład:**

Załóżmy, że mamy tabelę `zamówienia` z kolumnami `id_zamówienia` i `produkty` (tablica zawierająca nazwy produktów w zamówieniu). Chcemy wyświetlić wszystkie produkty z każdego zamówienia w jednym wierszu, oddzielone przecinkami.

```sql
SELECT 
  id_zamówienia,
  STRING_AGG(produkt, ', ') AS lista_produktów
FROM zamówienia, UNNEST(produkty) AS produkt
GROUP BY id_zamówienia;
```

**Rezultat przykładowego zapytania:**

| id_zamówienia | lista_produktów                                |
|---------------|-------------------------------------------------|
| 1             | Laptop, Mysz, Klawiatura                       |
| 2             | Lodówka, Pralka                                |
| 3             | Kosiarka, Grabie, Wąż ogrodowy                 |

## Funkcje statysytczne

### Funkcja `CORR`

Funkcja `CORR` w BigQuery służy do obliczania **współczynnika korelacji Pearsona** między dwiema kolumnami liczbowymi. Współczynnik korelacji Pearsona jest miarą statystyczną, która określa siłę i kierunek zależności liniowej między dwiema zmiennymi.

### Zrozumienie współczynnika korelacji Pearsona

* **Wartości:** Współczynnik korelacji Pearsona przyjmuje wartości z zakresu od -1 do 1.
  * **1:** Oznacza doskonałą dodatnią korelację - gdy jedna zmienna rośnie, druga również rośnie proporcjonalnie.
  * **-1:** Oznacza doskonałą ujemną korelację - gdy jedna zmienna rośnie, druga maleje proporcjonalnie.
  * **0:** Oznacza brak korelacji - zmienne nie są liniowo zależne od siebie.
  * **Wartości pomiędzy -1 a 1:** Oznaczają różny stopień korelacji, im bliżej 1 lub -1, tym silniejsza zależność.

* **Interpretacja:** Współczynnik korelacji Pearsona pomaga zrozumieć, jak dwie zmienne są ze sobą powiązane. Może to być przydatne do przewidywania wartości jednej zmiennej na podstawie drugiej lub do identyfikacji czynników wpływających na daną zmienną.

### Składnia

```sql
CORR(wyrażenie_X, wyrażenie_Y)
```

* `wyrażenie_X` i `wyrażenie_Y`: To kolumny lub wyrażenia liczbowe, dla których chcemy obliczyć współczynnik korelacji.

### Przykład

Załóżmy, że mamy tabelę `dane_sprzedaży` z kolumnami `wydatki_na_reklamę` i `przychody_ze_sprzedaży`. Chcemy sprawdzić, czy istnieje korelacja między tymi dwiema zmiennymi.

```sql
SELECT 
  CORR(wydatki_na_reklamę, przychody_ze_sprzedaży) AS współczynnik_korelacji
FROM dane_sprzedaży;
```

**Rezultat przykładowego zapytania:**

| współczynnik_korelacji |
|------------------------|
| 0.85                   |

## Funkcja `COVAR` w BigQuery

Funkcja `COVAR` w BigQuery służy do obliczania kowariancji między dwiema kolumnami liczbowymi. Kowariancja jest miarą statystyczną, która określa, jak dwie zmienne zmieniają się razem. Innymi słowy, pokazuje, czy wzrost jednej zmiennej jest związany ze wzrostem lub spadkiem drugiej zmiennej.

### Zrozumienie kowariancji

* **Wartości:** Kowariancja może przyjmować wartości dodatnie, ujemne lub zero.
  * **Wartość dodatnia:** Oznacza, że gdy jedna zmienna rośnie, druga również ma tendencję do wzrostu.
  * **Wartość ujemna:** Oznacza, że gdy jedna zmienna rośnie, druga ma tendencję do spadku.
  * **Zero:** Oznacza, że nie ma liniowej zależności między zmiennymi.

* **Interpretacja:** Kowariancja sama w sobie nie mówi nam wiele o sile zależności między zmiennymi. Aby uzyskać bardziej znormalizowaną miarę, często używa się współczynnika korelacji Pearsona, który jest obliczony na podstawie kowariancji i odchyleń standardowych obu zmiennych.

* **Rodzaje `COVAR` w BigQuery:**
  * `COVAR_POP(wyrażenie_X, wyrażenie_Y)`: Oblicza kowariancję populacji między dwiema kolumnami.
  * `COVAR_SAMP(wyrażenie_X, wyrażenie_Y)`: Oblicza kowariancję próby między dwiema kolumnami.

### Składnia

```sql
COVAR_POP(wyrażenie_X, wyrażenie_Y)
COVAR_SAMP(wyrażenie_X, wyrażenie_Y)
```

* `wyrażenie_X` i `wyrażenie_Y`: To kolumny lub wyrażenia liczbowe, dla których chcemy obliczyć kowariancję.

### Przykład

Załóżmy, że mamy tabelę `dane_produkcji` z kolumnami `temperatura` i `wydajność`. Chcemy sprawdzić, czy istnieje zależność między temperaturą a wydajnością produkcji.

```sql
SELECT 
  COVAR_POP(temperatura, wydajność) AS kowariancja_populacji,
  COVAR_SAMP(temperatura, wydajność) AS kowariancja_próby
FROM dane_produkcji;
```

**Rezultat przykładowego zapytania:**

| kowariancja_populacji | kowariancja_próby |
|------------------------|---------------------|
| -120.5                 | -125.3              |

W tym przypadku obie kowariancje są ujemne, co sugeruje, że wzrost temperatury jest związany ze spadkiem wydajności produkcji.

## Odchylenie standardowe: funkcje `STDDEV` i `STDDEV_POP`

Funkcje `STDDEV` i `STDDEV_POP` w BigQuery służą do obliczania odchylenia standardowego dla zbioru wartości liczbowych. Odchylenie standardowe jest miarą statystyczną, która pokazuje, jak bardzo wartości w zbiorze danych są rozproszone wokół średniej. Im większe odchylenie standardowe, tym większa różnorodność wartości w zbiorze.

### Zrozumienie odchylenia standardowego

* **Interpretacja:**
  * **Duże odchylenie standardowe:** Oznacza, że wartości są znacznie rozproszone wokół średniej. Może to wskazywać na dużą zmienność lub nieprzewidywalność danych.
  * **Małe odchylenie standardowe:** Oznacza, że wartości są skupione blisko średniej. Może to wskazywać na większą jednorodność danych.

* **Zastosowania:** Odchylenie standardowe jest używane w wielu dziedzinach, takich jak:
  * **Statystyka:** Do opisu rozkładu danych i porównywania różnych zbiorów danych.
  * **Finanse:** Do oceny ryzyka inwestycji.
  * **Nauka:** Do analizy wyników eksperymentów.
  * **Produkcja:** Do kontroli jakości.

### `STDDEV` vs `STDDEV_POP`

* **`STDDEV`**: Jest aliasem dla funkcji `STDDEV_SAMP`, która oblicza **odchylenie standardowe z próby**. Oznacza to, że obliczenia są dokonywane na podstawie podzbioru danych (próby), a nie całej populacji. Jest to najczęściej używana funkcja, gdy mamy do czynienia z próbką danych.

* **`STDDEV_POP`**: Oblicza **odchylenie standardowe populacji**. Jest to używane, gdy mamy dostęp do wszystkich danych z całej populacji, a nie tylko do jej próbki.

### Składnia

```sql
STDDEV(wyrażenie)
STDDEV_POP(wyrażenie)
```

* `wyrażenie`: To kolumna lub wyrażenie liczbowe, dla którego chcemy obliczyć odchylenie standardowe.

### Przykład

Załóżmy, że mamy tabelę `wyniki_testów` z kolumną `punkty`. Chcemy obliczyć odchylenie standardowe wyników testów, zakładając, że mamy dane dla całej populacji uczniów.

```sql
SELECT 
  STDDEV_POP(punkty) AS odchylenie_standardowe_populacji
FROM wyniki_testów;
```

**Rezultat przykładowego zapytania:**

| odchylenie_standardowe_populacji |
|----------------------------------|
| 12.0                             |

## Wariancja: funkcje `VAR_POP`, `VAR_SAMP` i `VARIANCE`

Funkcje `VAR_POP`, `VAR_SAMP` oraz `VARIANCE` w BigQuery służą do obliczania **wariancji** zbioru wartości liczbowych. Wariancja jest miarą statystyczną, która określa, jak bardzo wartości w zbiorze są rozproszone wokół średniej. Im większa wariancja, tym większe zróżnicowanie wartości w zbiorze.

### Zrozumienie wariancji

* **Interpretacja:**
  * **Duża wariancja:** Oznacza, że wartości są znacznie rozproszone wokół średniej, co wskazuje na dużą zmienność danych.
  * **Mała wariancja:** Oznacza, że wartości są skupione blisko średniej, co sugeruje większą jednorodność danych.
* **Zastosowania:** Wariancja jest często używana w statystyce, finansach, nauce i innych dziedzinach do analizy rozkładu danych i porównywania różnych zbiorów danych.

### `VAR_POP`, `VAR_SAMP` i `VARIANCE`

* **`VAR_POP(wyrażenie)`:** Oblicza wariancję populacji. Jest to używane, gdy mamy dostęp do wszystkich danych z całej populacji, a nie tylko do jej próbki.
* **`VAR_SAMP(wyrażenie)`:** Oblicza wariancję próby. Jest to najczęściej używana funkcja, gdy mamy do czynienia z próbką danych.
* **`VARIANCE(wyrażenie)`:** Jest aliasem dla funkcji `VAR_SAMP`.

### Składnia

```sql
VAR_POP(wyrażenie)
VAR_SAMP(wyrażenie)
VARIANCE(wyrażenie)
```

* `wyrażenie`: To kolumna lub wyrażenie liczbowe, dla którego chcemy obliczyć wariancję

### Przykład

Załóżmy, że mamy tabelę `wyniki_testów` z kolumną `punkty`. Chcemy obliczyć wariancję wyników testów, zakładając, że mamy dane dla całej populacji uczniów

```sql
SELECT 
  VAR_POP(punkty) AS wariancja_populacji
FROM wyniki_testów;
```

**Rezultat przykładowego zapytania:**

| wariancja_populacji |
|---------------------|
| 144                 |

## Ranking: Funkcje okienkowe `RANK`, `DENSE_RANK` i `PERCENT_RANK`

Funkcje okienkowe w BigQuery pozwalają na wykonywanie obliczeń na grupach wierszy, ale w przeciwieństwie do funkcji agregujących, zwracają wartość dla każdego wiersza w grupie. Dzięki temu możemy porównywać wartości w obrębie grupy i przypisywać im rangi lub inne statystyki. Dzisiaj skupimy się na trzech funkcjach służących do **rankingowania**:

1. `RANK`: Przypisuje rangi wierszom w grupie, uwzględniając powtarzające się wartości.
2. `DENSE_RANK`: Przypisuje rangi wierszom w grupie, nie pozostawiając luk w przypadku powtarzających się wartości.
3. `PERCENT_RANK`: Oblicza procentową rangę wiersza w grupie.

### `RANK`

Funkcja `RANK` przypisuje rangi wierszom w grupie na podstawie wartości określonej kolumny lub wyrażenia. W przypadku powtarzających się wartości, wszystkim wierszom z tą samą wartością przypisywana jest ta sama ranga, a następna ranga jest pomijana o liczbę powtórzeń.

**Składnia:**

```sql
RANK() OVER (
  [PARTITION BY kolumna_partycji] 
  ORDER BY kolumna_sortowania [ASC|DESC]
)
```

* `PARTITION BY kolumna_partycji`: Opcjonalna klauzula, która dzieli dane na grupy (partycje) według wartości w określonej kolumnie.
* `ORDER BY kolumna_sortowania [ASC|DESC]`: Określa kolumnę lub wyrażenie, według którego będą sortowane wiersze w każdej partycji, oraz kierunek sortowania (rosnąco `ASC` lub malejąco `DESC`).

**Przykład:**

Załóżmy, że mamy tabelę `wyniki_zawodów` z kolumnami `zawodnik`, `dyscyplina` i `wynik`. Chcemy przypisać rangi zawodnikom w każdej dyscyplinie na podstawie ich wyników.

```sql
SELECT
  zawodnik,
  dyscyplina,
  wynik,
  RANK() OVER (PARTITION BY dyscyplina ORDER BY wynik DESC) AS ranga
FROM wyniki_zawodów;
```

**Rezultat przykładowego zapytania:**

| zawodnik | dyscyplina | wynik | ranga |
|----------|------------|-------|-------|
| Anna     | Bieg        | 10.5  | 1     |
| Jan      | Bieg        | 10.5  | 1     |
| Maria    | Bieg        | 11.2  | 3     |
| Piotr    | Bieg        | 12.0  | 4     |
| Ewa      | Skok w dal  | 5.8   | 1     |
| Ola      | Skok w dal  | 5.5   | 2     |
| Kasia    | Skok w dal  | 5.2   | 3     |

### `DENSE_RANK`

Funkcja `DENSE_RANK` działa podobnie do `RANK`, ale nie pozostawia luk w przypadku powtarzających się wartości. Oznacza to, że jeśli kilka wierszy ma tę samą wartość, wszystkie otrzymają tę samą rangę, a następna ranga będzie o 1 większa.

**Składnia:**

```sql
DENSE_RANK() OVER (
  [PARTITION BY kolumna_partycji] 
  ORDER BY kolumna_sortowania [ASC|DESC]
)
```

**Przykład:**

Używając tego samego przykładu z tabelą `wyniki_zawodów`, możemy zastosować `DENSE_RANK`:

```sql
SELECT
  zawodnik,
  dyscyplina,
  wynik,
  DENSE_RANK() OVER (PARTITION BY dyscyplina ORDER BY wynik DESC) AS ranga
FROM wyniki_zawodów;
```

**Rezultat przykładowego zapytania:**

| zawodnik | dyscyplina | wynik | ranga |
|----------|------------|-------|-------|
| Anna     | Bieg        | 10.5  | 1     |
| Jan      | Bieg        | 10.5  | 1     |
| Maria    | Bieg        | 11.2  | 2     |
| Piotr    | Bieg        | 12.0  | 3     |
| Ewa      | Skok w dal  | 5.8   | 1     |
| Ola      | Skok w dal  | 5.5   | 2     |
| Kasia    | Skok w dal  | 5.2   | 3     |

### `PERCENT_RANK`

Funkcja `PERCENT_RANK` oblicza procentową rangę wiersza w grupie. Wartość 0 oznacza najniższą rangę, a 1 - najwyższą.

**Składnia:**

```sql
PERCENT_RANK() OVER (
  [PARTITION BY kolumna_partycji] 
  ORDER BY kolumna_sortowania [ASC|DESC]
)
```

**Przykład:**

Ponownie używając tabeli `wyniki_zawodów`:

```sql
SELECT
  zawodnik,
  dyscyplina,
  wynik,
  PERCENT_RANK() OVER (PARTITION BY dyscyplina ORDER BY wynik DESC) AS ranga_procentowa
FROM wyniki_zawodów;
```

**Rezultat przykładowego zapytania:**

| zawodnik | dyscyplina | wynik | ranga_procentowa |
|----------|------------|-------|------------------|
| Anna     | Bieg        | 10.5  | 0                |
| Jan      | Bieg        | 10.5  | 0                |
| Maria    | Bieg        | 11.2  | 0.5              |
| Piotr    | Bieg        | 12.0  | 1                |
| Ewa      | Skok w dal  | 5.8   | 0                |
| Ola      | Skok w dal  | 5.5   | 0.5              |
| Kasia    | Skok w dal  | 5.2   | 1                |

### Podsumowanie

* `RANK`: Przypisuje rangi, uwzględniając powtarzające się wartości (możliwe luki w rangach).
* `DENSE_RANK`: Przypisuje rangi bez luk, nawet w przypadku powtarzających się wartości.
* `PERCENT_RANK`: Oblicza procentową rangę wiersza w grupie.

## Funkcja `COALESCE`

Funkcja `COALESCE` w BigQuery to narzędzie, które pomaga radzić sobie z brakującymi danymi, reprezentowanymi przez wartość `NULL`. Działa ona jak wybawca, który wskakuje na scenę, gdy główny aktor (dana) nie pojawia się na występie. `COALESCE` przegląda listę wartości i wybiera pierwszą, która nie jest `NULL`, zapewniając ciągłość działania zapytania.

### Składnia

```sql
COALESCE(wyrażenie1, wyrażenie2, ...)
```

* `wyrażenie1`, `wyrażenie2`, ...: To lista wyrażeń, które mogą zawierać wartości `NULL`.

### Działanie

`COALESCE` działa w następujący sposób:

1. Ocenia każde wyrażenie z listy od lewej do prawej.
2. Zwraca wartość pierwszego wyrażenia, które nie jest `NULL`.
3. Jeśli wszystkie wyrażenia są `NULL`, zwraca `NULL`.

### Przykład

Załóżmy, że mamy tabelę `klienci` z kolumnami `imię`, `nazwisko` i `pseudonim`. Niektórzy klienci mogą nie mieć pseudonimu, co będzie reprezentowane przez wartość `NULL` w kolumnie `pseudonim`. Chcemy wyświetlić imię i nazwisko lub pseudonim każdego klienta, preferując pseudonim, jeśli jest dostępny.

```sql
SELECT
  COALESCE(pseudonim, CONCAT(imię, ' ', nazwisko)) AS nazwa_użytkownika
FROM klienci;
```

W tym zapytaniu, `COALESCE` najpierw sprawdza, czy `pseudonim` jest `NULL`. Jeśli nie jest, zwraca `pseudonim`. Jeśli `pseudonim` jest `NULL`, zwraca połączenie `imię` i `nazwisko`.

## Funkcje warunkowe `IF`, `IFNULL` i `NULLIF`

Funkcje warunkowe w BigQuery, takie jak `IF`, `IFNULL` i `NULLIF`, pozwalają na dynamiczne podejmowanie decyzji w zapytaniach SQL na podstawie określonych warunków. Można je porównać do drogowskazów na rozstaju dróg - w zależności od spełnienia warunku, zapytanie podąży jedną lub drugą ścieżką, zwracając odpowiednie wyniki.

### `IF`

Funkcja `IF` sprawdza warunek i zwraca jedną z dwóch wartości w zależności od tego, czy warunek jest spełniony, czy nie. To jak wybór między dwoma drzwiami - jeśli masz klucz (spełniony warunek), możesz otworzyć jedne drzwi, a jeśli nie masz klucza (niespełniony warunek), musisz wybrać drugie drzwi.

**Składnia:**

```sql
IF(warunek, wartość_jeśli_prawda, wartość_jeśli_fałsz)
```

* `warunek`: Wyrażenie logiczne, które jest oceniane jako `TRUE` lub `FALSE`.
* `wartość_jeśli_prawda`: Wartość zwracana, jeśli `warunek` jest `TRUE`.
* `wartość_jeśli_fałsz`: Wartość zwracana, jeśli `warunek` jest `FALSE`.

**Przykład:**

Załóżmy, że mamy tabelę `pracownicy` z kolumnami `imię`, `nazwisko` i `pensja`. Chcemy przyznać premię w wysokości 1000 zł pracownikom, których pensja jest niższa niż 5000 zł.

```sql
SELECT
  imię,
  nazwisko,
  pensja,
  IF(pensja < 5000, pensja + 1000, pensja) AS pensja_z_premia
FROM pracownicy;
```

### `IFNULL`

Funkcja `IFNULL` sprawdza, czy wartość jest `NULL`, i zwraca wartość zastępczą, jeśli tak jest. To jak parasol, który rozkładasz, gdy zaczyna padać deszcz (`NULL`). Jeśli nie pada (`wartość nie jest NULL`), parasol pozostaje zamknięty.

**Składnia:**

```sql
IFNULL(wyrażenie, wartość_zastępcza)
```

* `wyrażenie`: Wyrażenie, które może zawierać wartość `NULL`.
* `wartość_zastępcza`: Wartość zwracana, jeśli `wyrażenie` jest `NULL`.

**Przykład:**

Załóżmy, że mamy tabelę `klienci` z kolumnami `imię`, `nazwisko` i `email`. Niektórzy klienci mogą nie mieć adresu e-mail. Chcemy wyświetlić adres e-mail lub komunikat "brak adresu e-mail", jeśli jest on `NULL`.

```sql
SELECT
  imię,
  nazwisko,
  IFNULL(email, 'brak adresu e-mail') AS email
FROM klienci;
```

### `NULLIF`

Funkcja `NULLIF` porównuje dwie wartości i zwraca `NULL`, jeśli są one równe. W przeciwnym razie zwraca pierwszą wartość. To jak detektyw, który szuka różnic między dwoma podejrzanymi - jeśli są identyczni, sprawa zostaje zamknięta (`NULL`), a jeśli nie, pierwszy podejrzany zostaje zatrzymany.

**Składnia:**

```sql
NULLIF(wyrażenie1, wyrażenie2)
```

* `wyrażenie1` i `wyrażenie2`: Wyrażenia, które są porównywane.

**Przykład:**

Załóżmy, że mamy tabelę `produkty` z kolumnami `nazwa` i `cena`. Chcemy zwrócić `NULL` dla produktów, których cena wynosi 0.

```sql
SELECT
  nazwa,
  NULLIF(cena, 0) AS cena
FROM produkty;
```
