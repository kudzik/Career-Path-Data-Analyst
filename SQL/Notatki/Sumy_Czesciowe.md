# Sumy częściowe

**Sumy częściowe (Running Totals) - co to jest?**

Sumy częściowe, nazywane również sumami kumulatywnymi lub narastającymi, to obliczenia, które pokazują sumę wartości do danego momentu w określonym porządku. Innymi słowy, każda wartość sumy częściowej jest sumą bieżącej wartości i wszystkich poprzednich wartości.

**Jak obliczać sumy częściowe w MSSQL?**

W MSSQL, sumy częściowe można obliczać za pomocą funkcji okienkowej `SUM() OVER()`, wraz z klauzulą `ORDER BY`, która określa porządek obliczania sumy.

**Składnia:**

```sql
SELECT
    kolumna1, kolumna2, ...,
    SUM(kolumna_do_sumowania) OVER (
        [PARTITION BY kolumna_partycji, ...]
        ORDER BY kolumna_porządku [ASC | DESC]
        [ROWS UNBOUNDED PRECEDING | ROWS BETWEEN ... AND ...]
    ) AS SumaCzęściowa
FROM tabela;
```

* `PARTITION BY`: Opcjonalna klauzula dzieląca dane na partycje (grupy). Jeśli nie zostanie podana, cała tabela jest traktowana jako jedna partycja.
* `ORDER BY`: Określa porządek, według którego mają być obliczane sumy częściowe.
* `ROWS UNBOUNDED PRECEDING`: Domyślne zachowanie, sumuje wszystkie wiersze od początku partycji do bieżącego wiersza.
* `ROWS BETWEEN ... AND ...`: Pozwala określić zakres wierszy do sumowania (np. `ROWS BETWEEN 1 PRECEDING AND CURRENT ROW` sumuje bieżący wiersz i jeden poprzedni).

**Przykład 1: Suma narastająca pensji wszystkich pracowników**

```sql
SELECT
    IdPracownika,
    Imie,
    Nazwisko,
    Pensja,
    SUM(Pensja) OVER (ORDER BY IdPracownika) AS SumaNarastajacaPensji
FROM Pracownicy;
```

W tym przykładzie:

* `SUM(Pensja) OVER (ORDER BY IdPracownika)` oblicza sumę narastającą pensji dla wszystkich pracowników, posortowanych według `IdPracownika`.
* Dla pierwszego pracownika `SumaNarastajacaPensji` będzie równa jego pensji.
* Dla każdego kolejnego pracownika `SumaNarastajacaPensji` będzie sumą jego pensji i sumy narastającej poprzedniego pracownika.

**Przykład 2: Suma narastająca pensji w ramach działów**

```sql
SELECT
    IdPracownika,
    Imie,
    Nazwisko,
    IdDzialu,
    Pensja,
    SUM(Pensja) OVER (PARTITION BY IdDzialu ORDER BY Pensja) AS SumaNarastajacaPensjiWDziale
FROM Pracownicy;
```

W tym przykładzie:

* `PARTITION BY IdDzialu` dzieli tabelę na partycje według działów.
* `SUM(Pensja) OVER (PARTITION BY IdDzialu ORDER BY Pensja)` oblicza sumę narastającą pensji w ramach każdego działu, posortowanych według pensji.
* Dla każdego pracownika `SumaNarastajacaPensjiWDziale` będzie sumą jego pensji i sumy narastającej poprzednich pracowników w tym samym dziale.

**Przykład 3: Suma narastająca pensji w ramach działów z limitem 3 pracowników**

```sql
SELECT
    IdPracownika,
    Imie,
    Nazwisko,
    IdDzialu,
    Pensja,
    SUM(Pensja) OVER (
        PARTITION BY IdDzialu
        ORDER BY Pensja
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS SumaNarastajacaPensjiWDziale
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY IdDzialu ORDER BY Pensja) AS rn
    FROM Pracownicy
) AS T
WHERE rn <= 3;
```

W tym przykładzie:

* Podzapytanie wybiera tylko 3 pracowników z najniższą pensją w każdym dziale.
* `SUM(Pensja) OVER (...)` oblicza sumę narastającą pensji dla tych wybranych pracowników w ramach każdego działu.


