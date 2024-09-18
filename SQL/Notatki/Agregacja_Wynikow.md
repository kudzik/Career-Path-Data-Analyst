# Agregacja wyników

NOWE SŁOWA KLUCZOWE: DISTINCT, SUM, AVG, MIN, MAX, COUNT, GROUP BY,
HAVING, ROW_NUMBER, OVER, RANK, DENSE_RANK, NTILE, PARTITION BY,
PERCENT_RANK, PERCENTILE_CONT, WITHIN GROUP, LAG

**DISTINCT - co to jest?**

`DISTINCT` to słowo kluczowe używane w instrukcji `SELECT`, które pozwala zwrócić tylko unikalne (różne) wartości z określonej kolumny lub kombinacji kolumn. Innymi słowy, eliminuje ono duplikaty.

**Składnia:**

```sql
SELECT DISTINCT kolumna1, kolumna2, ...
FROM tabela
[WHERE warunek];
```

**Przykład 1: Unikalne wartości z jednej kolumny**

Załóżmy, że masz tabelę `Pracownicy` z kolumną `Stanowisko`:

```
| Nazwisko   | Stanowisko  |
| ---------- | ----------- |
| Kowalski   | Kierownik   |
| Nowak      | Specjalista |
| Wiśniewski | Kierownik   |
| Kowalczyk  | Specjalista |
```

Zapytanie:

```sql
SELECT DISTINCT Stanowisko
FROM Pracownicy;
```

Wynik:

```
Stanowisko
------------
Kierownik
Specjalista
```

**Przykład 2: Unikalne kombinacje wartości z wielu kolumn**

Załóżmy, że tabela `Pracownicy` ma również kolumnę `Miasto`:

```
| Nazwisko   | Stanowisko  | Miasto   |
| ---------- | ----------- | -------- |
| Kowalski   | Kierownik   | Warszawa |
| Nowak      | Specjalista | Kraków   |
| Wiśniewski | Kierownik   | Warszawa |
| Kowalczyk  | Specjalista | Kraków   |
```

Zapytanie:

```sql
SELECT DISTINCT Stanowisko, Miasto
FROM Pracownicy;
```

Wynik:

```
| Stanowisko  | Miasto   |
| ----------- | -------- |
| Kierownik   | Warszawa |
| Specjalista | Kraków   |
```

**Przykład 3: Policzenie unikalnych wartości**

Możesz użyć `DISTINCT` w połączeniu z funkcją `COUNT`, aby policzyć liczbę unikalnych wartości w kolumnie:

```sql
SELECT COUNT(DISTINCT Stanowisko) AS LiczbaStanowisk
FROM Pracownicy;
```

Wynik:

```
LiczbaStanowisk
---------------
2
```

**Ważne uwagi:**

* `DISTINCT` działa na wszystkich kolumnach wymienionych w klauzuli `SELECT`.
* Jeśli zapytanie nie zawiera `DISTINCT`, wszystkie wiersze, w tym duplikaty, zostaną zwrócone.
* `DISTINCT` może wpływać na wydajność zapytania, szczególnie w przypadku dużych tabel.

## Funkcje

Funkcje są podzielone na dwie główne kategorie: **skalarne** i **agregujące**. Każda z nich pełni inną rolę w przetwarzaniu danych.

**Funkcje skalarne:**

* **Działanie:** Operują na pojedynczych wartościach (np. liczbach, datach, tekstach) i zwracają pojedynczy wynik.
* **Zastosowanie:** Mogą być używane w dowolnym miejscu zapytania SQL, gdzie dozwolone jest wyrażenie (np. w klauzuli `SELECT`, `WHERE`, `HAVING`).
* **Przykłady:**

| Funkcja     | Opis                                                       | Przykład                                                     |
| ----------- | ---------------------------------------------------------- | ------------------------------------------------------------ |
| `LEN()`     | Zwraca długość ciągu znaków.                               | `SELECT LEN('Witaj świecie!') AS Dlugosc;`                   |
| `UPPER()`   | Konwertuje ciąg znaków na wielkie litery.                  | `SELECT UPPER('Witaj świecie!') AS WielkieLitery;`           |
| `YEAR()`    | Wyodrębnia rok z daty.                                     | `SELECT YEAR('2024-05-21') AS Rok;`                          |
| `GETDATE()` | Zwraca aktualną datę i czas serwera.                       | `SELECT GETDATE() AS AktualnyCzas;`                          |
| `ISNULL()`  | Zastępuje wartość NULL określoną wartością.                | `SELECT ISNULL(Szef, 'Brak szefa') AS Szef FROM Pracownicy;` |
| `ROUND()`   | Zaokrągla liczbę do określonej liczby miejsc po przecinku. | `SELECT ROUND(3.14159, 2) AS Zaokraglenie;`                  |

**Funkcje agregujące:**

* **Działanie:** Operują na grupach wierszy (np. wszystkich wierszach tabeli lub wierszach pogrupowanych według określonego kryterium) i zwracają pojedynczy wynik podsumowujący grupę.
* **Zastosowanie:** Używane głównie w klauzuli `SELECT` wraz z klauzulą `GROUP BY`.
* **Przykłady:**

| Funkcja   | Opis                                                    | Przykład                                                               |
| --------- | ------------------------------------------------------- | ---------------------------------------------------------------------- |
| `COUNT()` | Zlicza liczbę wierszy lub niepustych wartości w grupie. | `SELECT COUNT(*) AS LiczbaPracownikow FROM Pracownicy;`                |
| `SUM()`   | Sumuje wartości w grupie.                               | `SELECT SUM(Pensja) AS SumaPensji FROM Pracownicy;`                    |
| `AVG()`   | Oblicza średnią wartość w grupie.                       | `SELECT AVG(Pensja) AS SredniaPensja FROM Pracownicy;`                 |
| `MIN()`   | Znajduje najmniejszą wartość w grupie.                  | `SELECT MIN(DataZatrudnienia) AS NajwczesniejszaData FROM Pracownicy;` |
| `MAX()`   | Znajduje największą wartość w grupie.                   | `SELECT MAX(Pensja) AS NajwyzszaPensja FROM Pracownicy;`               |

**Przykład użycia funkcji agregującej z GROUP BY:**

```sql
SELECT Stanowisko, COUNT(*) AS LiczbaPracownikow, AVG(Pensja) AS SredniaPensja
FROM Pracownicy
GROUP BY Stanowisko;
```

W tym przykładzie grupujemy pracowników według stanowiska i obliczamy liczbę pracowników oraz średnią pensję dla każdego stanowiska.

## SUM

Jasne, omówmy funkcję agregującą `SUM` w MSSQL:

**SUM - co to jest?**

Funkcja `SUM` służy do obliczania sumy wartości w określonym zestawie danych. Najczęściej używana jest w połączeniu z klauzulą `GROUP BY`, aby obliczyć sumę dla każdej grupy, ale może być również używana bez grupowania, aby obliczyć sumę dla całej tabeli.

**Składnia:**

```sql
SUM([ALL | DISTINCT] wyrażenie)
```

* `ALL` (domyślne): Sumuje wszystkie wartości, w tym duplikaty.
* `DISTINCT`: Sumuje tylko unikalne (różne) wartości.
* `wyrażenie`: Kolumna lub wyrażenie, którego wartości mają być sumowane. Musi to być typ danych liczbowych.

**Przykłady:**

**1. Suma dla całej tabeli:**

```sql
SELECT SUM(Pensja) AS SumaPensji
FROM Pracownicy;
```

Zapytanie to zwróci całkowitą sumę wszystkich pensji w tabeli `Pracownicy`.

**2. Suma dla każdej grupy:**

```sql
SELECT Dział, SUM(Pensja) AS SumaPensjiWDziale
FROM Pracownicy
GROUP BY Dział;
```

Zapytanie to zwróci sumę pensji dla każdego działu w tabeli `Pracownicy`.

**3. Suma unikalnych wartości:**

```sql
SELECT SUM(DISTINCT Pensja) AS SumaUnikalnychPensji
FROM Pracownicy;
```

Zapytanie to zwróci sumę unikalnych wartości pensji w tabeli `Pracownicy`, czyli zignoruje duplikaty.

**4. Suma z warunkiem:**

```sql
SELECT SUM(Pensja) AS SumaPensjiKierownikow
FROM Pracownicy
WHERE Stanowisko = 'Kierownik';
```

Zapytanie to zwróci sumę pensji tylko dla pracowników, którzy są kierownikami.

**Ważne uwagi:**

* `SUM` ignoruje wartości NULL.
* Jeśli wszystkie wartości w zestawie danych są NULL, `SUM` zwróci NULL.
* Możesz użyć `SUM` z innymi funkcjami agregującymi (np. `AVG`, `COUNT`).
* `SUM` jest często używany w zapytaniach analitycznych i raportowych.

## COUNT

**COUNT - co to jest?**

Funkcja `COUNT` służy do zliczania liczby wierszy lub niepustych wartości w określonym zestawie danych. Najczęściej używana jest w połączeniu z klauzulą `GROUP BY`, aby zliczyć wiersze dla każdej grupy, ale może być również używana bez grupowania, aby zliczyć wiersze w całej tabeli.

**Składnia:**

```sql
COUNT([ALL | DISTINCT] wyrażenie)
```

* `ALL` (domyślne): Zlicza wszystkie wiersze, w tym duplikaty i wartości NULL.
* `DISTINCT`: Zlicza tylko unikalne (różne) wartości, ignorując duplikaty i wartości NULL.
* `wyrażenie`:
  * `*`: Zlicza wszystkie wiersze w tabeli.
  * Nazwa kolumny: Zlicza niepuste wartości w tej kolumnie.

**Przykłady:**

**1. Zliczenie wszystkich wierszy:**

```sql
SELECT COUNT(*) AS LiczbaPracownikow
FROM Pracownicy;
```

Zapytanie to zwróci całkowitą liczbę wierszy w tabeli `Pracownicy`.

**2. Zliczenie wierszy dla każdej grupy:**

```sql
SELECT Dział, COUNT(*) AS LiczbaPracownikowWDziale
FROM Pracownicy
GROUP BY Dział;
```

Zapytanie to zwróci liczbę pracowników dla każdego działu w tabeli `Pracownicy`.

**3. Zliczenie niepustych wartości w kolumnie:**

```sql
SELECT COUNT(Email) AS LiczbaPracownikowZEmailem
FROM Pracownicy;
```

Zapytanie to zwróci liczbę pracowników, którzy mają podany adres e-mail (czyli nie mają wartości NULL w kolumnie `Email`).

**4. Zliczenie unikalnych wartości:**

```sql
SELECT COUNT(DISTINCT Stanowisko) AS LiczbaStanowisk
FROM Pracownicy;
```

Zapytanie to zwróci liczbę unikalnych stanowisk w tabeli `Pracownicy`.

**Ważne uwagi:**

* `COUNT(*)` jest najszybszym sposobem zliczenia wszystkich wierszy w tabeli, ponieważ nie musi sprawdzać wartości w poszczególnych kolumnach.
* `COUNT(wyrażenie)` ignoruje wartości NULL.
* `COUNT(DISTINCT wyrażenie)` ignoruje zarówno duplikaty, jak i wartości NULL.

## Grupowanie danych

**GROUP BY - co to jest?**

`GROUP BY` to klauzula używana w instrukcji `SELECT`, która pozwala grupować wiersze tabeli według wartości jednej lub kilku kolumn. Po pogrupowaniu wierszy możesz zastosować funkcje agregujące (np. `SUM`, `AVG`, `COUNT`) do obliczenia podsumowań dla każdej grupy.

**Składnia:**

```sql
SELECT kolumna1, kolumna2, ... funkcja_agregująca(kolumna)
FROM tabela
[WHERE warunek]
GROUP BY kolumna1, kolumna2, ...
[HAVING warunek];
```

**Jak działa GROUP BY:**

1. **Podział na grupy:** `GROUP BY` dzieli wiersze tabeli na grupy, gdzie każdy wiersz w grupie ma taką samą wartość w kolumnach określonych w `GROUP BY`.
2. **Agregacja:** Funkcje agregujące są stosowane do każdej grupy, obliczając pojedynczy wynik dla każdej grupy.
3. **Wynik:** Zapytanie zwraca jeden wiersz dla każdej grupy, zawierający wartości kolumn z `GROUP BY` oraz wyniki funkcji agregujących.

**Przykłady:**

**1. Grupowanie według jednej kolumny:**

```sql
SELECT Dział, COUNT(*) AS LiczbaPracownikow
FROM Pracownicy
GROUP BY Dział;
```

Zapytanie to zwróci liczbę pracowników dla każdego działu.

**2. Grupowanie według wielu kolumn:**

```sql
SELECT Dział, Stanowisko, AVG(Pensja) AS SredniaPensja
FROM Pracownicy
GROUP BY Dział, Stanowisko;
```

Zapytanie to zwróci średnią pensję dla każdego stanowiska w każdym dziale.

**3. Grupowanie z warunkiem (WHERE):**

```sql
SELECT Dział, COUNT(*) AS LiczbaPracownikow
FROM Pracownicy
WHERE Rok(DataZatrudnienia) > 2020
GROUP BY Dział;
```

Zapytanie to zwróci liczbę pracowników zatrudnionych po 2020 roku dla każdego działu.

**4. Grupowanie z warunkiem (HAVING):**

```sql
SELECT Dział, COUNT(*) AS LiczbaPracownikow
FROM Pracownicy
GROUP BY Dział
HAVING COUNT(*) > 5;
```

Zapytanie to zwróci tylko te działy, które mają więcej niż 5 pracowników.

**Ważne uwagi:**

* Kolumny wymienione w klauzuli `SELECT` muszą być albo kolumnami grupującymi (z `GROUP BY`), albo używane wewnątrz funkcji agregujących.
* Klauzula `HAVING` służy do filtrowania grup po agregacji, podczas gdy `WHERE` filtruje wiersze przed grupowaniem.
* `GROUP BY` może znacznie uprościć zapytania i analizę danych.

**HAVING - co to jest?**

`HAVING` to klauzula używana w instrukcji `SELECT` wraz z `GROUP BY`. Służy do filtrowania grup wyników na podstawie warunków dotyczących wartości obliczonych przez funkcje agregujące. Innymi słowy, pozwala wybrać tylko te grupy, które spełniają określone kryteria po agregacji.

**Składnia:**

```sql
SELECT kolumna1, kolumna2, ... funkcja_agregująca(kolumna)
FROM tabela
[WHERE warunek]
GROUP BY kolumna1, kolumna2, ...
HAVING warunek_agregujący;
```

**Jak działa HAVING:**

1. **Grupowanie:** `GROUP BY` dzieli wiersze na grupy.
2. **Agregacja:** Funkcje agregujące są stosowane do każdej grupy.
3. **Filtrowanie:** `HAVING` filtruje grupy na podstawie warunków dotyczących wyników funkcji agregujących.
4. **Wynik:** Zapytanie zwraca tylko te grupy, które spełniają warunki `HAVING`.

**Przykłady:**

**1. Filtrowanie grup według liczby:**

```sql
SELECT Dział, COUNT(*) AS LiczbaPracownikow
FROM Pracownicy
GROUP BY Dział
HAVING COUNT(*) > 5;
```

Zapytanie to zwróci tylko te działy, które mają więcej niż 5 pracowników.

**2. Filtrowanie grup według średniej:**

```sql
SELECT Dział, AVG(Pensja) AS SredniaPensja
FROM Pracownicy
GROUP BY Dział
HAVING AVG(Pensja) > 5000;
```

Zapytanie to zwróci tylko te działy, w których średnia pensja jest większa niż 5000.

**3. Filtrowanie grup według sumy:**

```sql
SELECT KategoriaProduktu, SUM(Cena * Ilosc) AS WartoscSprzedazy
FROM Zamowienia
GROUP BY KategoriaProduktu
HAVING SUM(Cena * Ilosc) > 10000;
```

Zapytanie to zwróci tylko te kategorie produktów, których łączna wartość sprzedaży przekracza 10000.

**Różnica między WHERE a HAVING:**

* `WHERE`: Filtruje poszczególne wiersze **przed** grupowaniem.
* `HAVING`: Filtruje grupy wyników **po** agregacji.

**Ważne uwagi:**

* Warunki w `HAVING` mogą odwoływać się do kolumn grupujących lub wyników funkcji agregujących.
* `HAVING` jest często używany w zapytaniach analitycznych i raportowych.

Różnice między klauzulami `WHERE` i `HAVING` w MSSQL:

| Cecha              | WHERE                                                                                      | HAVING                                                                                                                                                             |
| ------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Poziom filtrowania | Filtruje poszczególne wiersze **przed** grupowaniem (`GROUP BY`) i agregacją.              | Filtruje grupy wyników **po** grupowaniu (`GROUP BY`) i agregacji.                                                                                                 |
| Warunki            | Warunki mogą odnosić się do dowolnych kolumn w tabeli źródłowej.                           | Warunki mogą odnosić się do kolumn grupujących (z `GROUP BY`) lub wyników funkcji agregujących (np. `SUM`, `AVG`, `COUNT`).                                        |
| Użycie             | Może być używana w zapytaniach `SELECT`, `UPDATE` i `DELETE`.                              | Może być używana tylko w zapytaniach `SELECT` wraz z `GROUP BY`.                                                                                                   |
| Składnia           | `WHERE warunek` (gdzie `warunek` to wyrażenie logiczne)                                    | `HAVING warunek_agregujący` (gdzie `warunek_agregujący` to wyrażenie logiczne odnoszące się do kolumn grupujących lub wyników funkcji agregujących)                |
| Przykład           | `SELECT * FROM Pracownicy WHERE Pensja > 5000;` (zwraca pracowników z pensją powyżej 5000) | `SELECT Dział, AVG(Pensja) AS SredniaPensja FROM Pracownicy GROUP BY Dział HAVING AVG(Pensja) > 5000;` (zwraca działy, w których średnia pensja jest powyżej 5000) |

**Podsumowanie:**

* `WHERE`: Służy do filtrowania danych na poziomie wierszy przed agregacją.
* `HAVING`: Służy do filtrowania danych na poziomie grup po agregacji.

**Analogia:**

Wyobraź sobie, że masz pudełko klocków LEGO.

* `WHERE` to jak wybranie tylko klocków o określonym kolorze **przed** rozpoczęciem budowania.
* `HAVING` to jak wybranie tylko tych konstrukcji, które mają określoną wysokość lub liczbę klocków **po** zakończeniu budowania.

Oto kilka przykładów użycia `WHERE` i `HAVING` w MSSQL, aby lepiej zilustrować ich różnice:

**Przykład 1: Filtrowanie pracowników według pensji (WHERE)**

```sql
SELECT *
FROM Pracownicy
WHERE Pensja > 5000;
```

Ten przykład zwraca wszystkie wiersze z tabeli `Pracownicy`, gdzie wartość kolumny `Pensja` jest większa niż 5000. Filtrowanie odbywa się przed grupowaniem i agregacją.

**Przykład 2: Filtrowanie działów według średniej pensji (HAVING)**

```sql
SELECT Dział, AVG(Pensja) AS SredniaPensja
FROM Pracownicy
GROUP BY Dział
HAVING AVG(Pensja) > 5000;
```

Ten przykład zwraca nazwy działów i ich średnie pensje, ale tylko dla tych działów, gdzie średnia pensja jest większa niż 5000. Filtrowanie odbywa się po grupowaniu i agregacji.

**Przykład 3: Filtrowanie pracowników według wieku i stanowiska (WHERE)**

```sql
SELECT *
FROM Pracownicy
WHERE DATEDIFF(YEAR, DataUrodzenia, GETDATE()) > 30 AND Stanowisko = 'Kierownik';
```

Ten przykład zwraca pracowników, którzy są starsi niż 30 lat i są kierownikami. Filtrowanie odbywa się przed grupowaniem i agregacją.

**Przykład 4: Filtrowanie działów według liczby pracowników i średniej pensji (WHERE i HAVING)**

```sql
SELECT Dział, COUNT(*) AS LiczbaPracownikow, AVG(Pensja) AS SredniaPensja
FROM Pracownicy
WHERE Miasto = 'Warszawa'  -- Filtrowanie przed grupowaniem
GROUP BY Dział
HAVING COUNT(*) > 3 AND AVG(Pensja) > 4000; -- Filtrowanie po grupowaniu
```

Ten przykład zwraca działy z Warszawy, które mają więcej niż 3 pracowników i średnią pensję powyżej 4000. Zauważ, że używamy zarówno `WHERE`, aby filtrować pracowników z Warszawy przed grupowaniem, jak i `HAVING`, aby filtrować działy po agregacji.

**Funkcje rankingowe - co to są?**

Funkcje rankingowe to specjalne funkcje, które pozwalają przypisać ranking, numer porządkowy lub percentyl do każdego wiersza w wyniku zapytania. Rankingi są obliczane na podstawie określonego porządku w ramach grupy (partycji) danych.

**Rodzaje funkcji rankingowych:**

* **`ROW_NUMBER()`:** Przypisuje unikalny, kolejny numer wiersza w ramach partycji, zaczynając od 1.
* **`RANK()`:** Przypisuje ranking wierszom w ramach partycji. Wiersze o takiej samej wartości otrzymują ten sam ranking, a następny wiersz otrzymuje ranking pomijający powtórzenia (np. 1, 1, 3).
* **`DENSE_RANK()`:** Podobnie jak `RANK()`, ale kolejne rankingi nie są pomijane (np. 1, 1, 2).
* **`NTILE(n)`:** Dzieli wiersze w partycji na n mniej więcej równych grup (kafelków) i przypisuje numer kafelka do każdego wiersza.

Omówmy funkcje rankingowe na podstawie tabeli `Pracownicy`, zakładając, że ma ona następujące kolumny:

* `IdPracownika` (unikalny identyfikator pracownika)
* `Nazwisko`
* `Imie`
* `Dzial`
* `Stanowisko`
* `Pensja`
* `DataZatrudnienia`

**Przykład 1: ROW_NUMBER() - numeracja pracowników według pensji**

```sql
SELECT IdPracownika, Nazwisko, Imie, Pensja,
       ROW_NUMBER() OVER (ORDER BY Pensja DESC) AS RankingPensji
FROM Pracownicy;
```

W tym przykładzie funkcja `ROW_NUMBER()` przypisuje unikalny numer (ranking) każdemu pracownikowi na podstawie jego pensji, zaczynając od najwyższej. Wynik będzie wyglądał następująco:

| IdPracownika | Nazwisko   | Imie  | Pensja | RankingPensji |
| ------------ | ---------- | ----- | ------ | ------------- |
| 123          | Kowalski   | Jan   | 8000   | 1             |
| 456          | Nowak      | Anna  | 7500   | 2             |
| 789          | Wiśniewski | Piotr | 6000   | 3             |
| ...          | ...        | ...   | ...    | ...           |

**Przykład 2: RANK() - ranking pracowników według pensji w ramach działu**

```sql
SELECT IdPracownika, Nazwisko, Imie, Dział, Pensja,
       RANK() OVER (PARTITION BY Dział ORDER BY Pensja DESC) AS RankingPensjiWDziale
FROM Pracownicy;
```

Tutaj `RANK()` przypisuje ranking pensji pracownikom w ramach ich działu. Jeśli dwóch pracowników w tym samym dziale ma taką samą pensję, otrzymają ten sam ranking, a następny pracownik otrzyma ranking pomijający powtórzenia.

**Przykład 3: DENSE_RANK() - ranking pracowników według pensji w ramach działu (bez pomijania)**

```sql
SELECT IdPracownika, Nazwisko, Imie, Dział, Pensja,
       DENSE_RANK() OVER (PARTITION BY Dział ORDER BY Pensja DESC) AS RankingPensjiWDziale
FROM Pracownicy;
```

Podobnie jak w przykładzie 2, ale teraz rankingi nie są pomijane, nawet jeśli kilku pracowników ma taką samą pensję.

**Przykład 4: NTILE(4) - podział pracowników na kwartyle według stażu pracy**

```sql
SELECT IdPracownika, Nazwisko, Imie, DataZatrudnienia,
       NTILE(4) OVER (ORDER BY DataZatrudnienia) AS KwartylStazu
FROM Pracownicy;
```

W tym przykładzie `NTILE(4)` dzieli pracowników na 4 grupy (kwartyle) na podstawie ich daty zatrudnienia. Pracownicy z najdłuższym stażem będą w kwartylu 1, a z najkrótszym w kwartylu 4.

**Partycje - co to są?**

**Założenie:**

Tabela `Pracownicy` jest teraz partycjonowana według kolumny `Stanowisko`. Oznacza to, że dane pracowników są fizycznie podzielone na grupy (partycje) według stanowisk, które zajmują.

**Przykład 1: Obliczanie średniej pensji na każdym stanowisku**

```sql
SELECT
    Stanowisko,
    AVG(Pensja) OVER (PARTITION BY Stanowisko) AS SredniaPensjaNaStanowisku
FROM Pracownicy;
```

W tym przykładzie:

* `PARTITION BY Stanowisko` dzieli tabelę na partycje według stanowisk.
* `AVG(Pensja)` oblicza średnią pensję dla każdej partycji (czyli dla każdego stanowiska).

**Przykład 2: Znajdowanie pracownika z najdłuższym stażem na każdym stanowisku**

```sql
SELECT *
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY Stanowisko ORDER BY DataZatrudnienia ASC) AS Rnk
    FROM Pracownicy
) AS T
WHERE Rnk = 1;
```

W tym przykładzie:

* `PARTITION BY Stanowisko` dzieli tabelę na partycje według stanowisk.
* `ROW_NUMBER() OVER (PARTITION BY Stanowisko ORDER BY DataZatrudnienia ASC)` przypisuje numery wierszy (rankingi) pracownikom w ramach każdego stanowiska, zaczynając od pracownika z najdłuższym stażem (najwcześniejszą datą zatrudnienia).
* Podzapytanie wybiera tylko wiersze z `Rnk = 1`, czyli pracowników z najdłuższym stażem na każdym stanowisku.

**Korzyści z używania partycji w agregacjach (zastosowanie stanowiska):**

* **Wydajność:** Zapytania są wykonywane szybciej, ponieważ agregacje są obliczane tylko dla odpowiednich partycji (stanowisk).
* **Skalowalność:** Partycje ułatwiają skalowanie bazy danych, ponieważ można dodawać nowe partycje w miarę pojawiania się nowych stanowisk.
* **Utrzymanie:** Operacje takie jak tworzenie kopii zapasowych, defragmentacja czy usuwanie starych danych są łatwiejsze do wykonania na poszczególnych partycjach.

**Ważne uwagi:**

* Aby w pełni wykorzystać korzyści z partycjonowania, zapytania powinny być formułowane w taki sposób, aby odwoływały się do kolumny partycjonującej (w naszym przykładzie `Stanowisko`).
* Partycjonowanie może wprowadzić pewien narzut, więc warto je stosować tylko w przypadku dużych tabel, gdzie korzyści przewyższają koszty.
