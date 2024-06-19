# Logika Boolea

## Logika boole'a w SQL: AND, OR, NOT, BETWEEN, IN, IS NULL

Logika boole'a w SQL pozwala na tworzenie złożonych warunków filtrowania i agregowania danych. Umożliwia łączenie, negację i porównywanie wartości w celu uzyskania precyzyjnych wyników zapytań.

**Operatorzy logiczne:**

* **AND:** Oznacza "i". Warunek jest prawdziwy tylko wtedy, gdy wszystkie połączone z nim warunki są również prawdziwe.

Przykład:

```sql
SELECT * FROM klienci
WHERE miasto = 'Kraków' AND kod_pocztowy LIKE '3%'
```

Wybierze klientów z Krakowa, których kod pocztowy zaczyna się na "3".

* **OR:** Oznacza "lub". Warunek jest prawdziwy, jeśli co najmniej jeden z połączonych z nim warunków jest prawdziwy.

Przykład:

```sql
SELECT * FROM produkty
WHERE cena > 100 OR kategoria = 'Elektronika'
```

Wybierze produkty o cenie powyżej 100 zł lub z kategorii "Elektronika".

* **NOT:** Oznacza "nie". Negacja warunku.

Przykład:

```sql
SELECT * FROM zamówienia
WHERE status <> 'Dostarczone'
```

Wybierze zamówienia o statusie innym niż "Dostarczone".

**Operatorzy porównania:**

* **BETWEEN:** Sprawdza, czy wartość znajduje się w określonym zakresie.

Przykład:

```sql
SELECT * FROM pracownicy
WHERE wynagrodzenie BETWEEN 3000 AND 5000
```

Wybierze pracowników o wynagrodzeniu między 3000 a 5000 zł.

`BETWEEN` można stosować razem z operatorem `NOT`

```sql
SELECT * FROM pracownicy
WHERE wynagrodzenie NOT BETWEEN 3000 AND 5000
```

* **IN:** Sprawdza, czy wartość znajduje się w zbiorze wartości.

Przykład:

```sql
SELECT * FROM produkty
WHERE id_kategorii IN (1, 2, 3)
```

Wybierze produkty z kategorii 1, 2 lub 3.

```sql
SELECT * FROM produkty
WHERE id_kategorii NOT IN (1, 2, 3)
```
Wybierze produkty z kategorii innej niż 1, 2, 3.

* **IS NULL:** Sprawdza, czy wartość jest NULL.

Przykład:

```sql
SELECT * FROM klienci
WHERE email IS NULL
```

Wybierze klientów bez adresu email.

**Logika boole'a w akcjach:**

Operatorów logicznych można używać nie tylko w klauzuli `WHERE`, ale również w innych częściach zapytania, np. w `ORDER BY` lub `HAVING`.

**Przykład:**

```sql
SELECT * FROM zamówienia
ORDER BY data_zamówienia DESC
LIMIT 10;
```

Wybierze 10 najnowszych zamówień, posortowanych malejąco według daty.

**Dodatkowe informacje:**

* Możesz łączyć wiele operatorów logicznych w jednym zapytaniu.
* Używaj nawiasów, aby określić priorytet operacji.
* Logika boole'a jest podstawą tworzenia złożonych zapytań SQL, które pozwalają na precyzyjne wyodrębnianie potrzebnych danych.

Mam nadzieję, że to wyjaśnienie jest pomocne. Daj mi znać, jeśli masz inne pytania dotyczące logiki boole'a w SQL.

## Priorytet operatorów AND i OR w SQL

W SQL operatory `AND` i `OR` należą do grupy operatorów logicznych i są wykorzystywane do łączenia warunków w zapytaniach. Ich kolejność interpretacji jest ściśle określona i wpływa na sposób wykonywania operacji w zapytaniu.

**Priorytet:**

1. **Negacja (`NOT`)**: Wykonywana jest przed `AND` i `OR`.
2. **Konjunkcja (`AND`)**: Wykonywana jest przed `OR`.
3. **Dysjunkcja (`OR`)**: Wykonywana jest jako ostatnia.

**Przykład:**

```sql
SELECT *
FROM klienci
WHERE miasto = 'Kraków' AND (kod_pocztowy LIKE '3%' OR ulica = 'Główna');
```

W tym przykładzie:

1. Warunek `miasto = 'Kraków'` zostanie sprawdzony dla każdego wiersza.
2. W nawiasach zostanie wykonany operator `OR`:
    * Sprawdzone zostanie, czy `kod_pocztowy LIKE '3%'` dla danego wiersza.
    * Sprawdzone zostanie, czy `ulica = 'Główna'` dla danego wiersza.
3. Tylko wiersze, które spełniają **wszystkie** trzy warunki, zostaną wyświetlone.

**Zmiana priorytetu:**

Użycie nawiasów pozwala na zmianę priorytetu operatorów logicznych.

**Przykład:**

```sql
SELECT *
FROM klienci
WHERE miasto = 'Kraków' AND (kod_pocztowy LIKE '3%' OR ulica = 'Główna');
```

W tym przykładzie:

1. Warunek `miasto = 'Kraków'` zostanie sprawdzony dla każdego wiersza.
2. W nawiasach zostanie wykonany operator `OR`:
    * Sprawdzone zostanie, czy `kod_pocztowy LIKE '3%'` dla danego wiersza.
3. Następnie zostanie sprawdzone, czy `ulica = 'Główna'` dla danego wiersza.
4. Tylko wiersze, które spełniają **warunek `miasto = 'Kraków'`** **i** **jeden z warunków w nawiasach**, zostaną wyświetlone.

## Pomyłki

* Pomyłki wynikające z niezrozumienia kolejności interpretacji operatorów AND i OR w SQL

Niezrozumienie kolejności interpretacji operatorów AND i OR w SQL może prowadzić do różnych typów pomyłek w zapytaniach, co może skutkować nieoczekiwanymi wynikami lub błędami. Oto kilka przykładów:

**1. Nierówne traktowanie wierszy:**

* Załóżmy, że chcemy wyświetlić klientów z Krakowa, którzy mieszkają na ulicy Głównej lub mają kod pocztowy zaczynający się od "3". Zapis zapytania bez użycia nawiasów może prowadzić do wyświetlenia tylko tych klientów, którzy **zarówno** mieszkają na ulicy Głównej, **jak i** mają kod pocztowy zaczynający się od "3".
* Użycie nawiasów pozwala na precyzyjne określenie, że szukamy klientów spełniających **jeden z** tych dwóch warunków.

**Przykład błędu:**

```sql
SELECT *
FROM klienci
WHERE miasto = 'Kraków' AND kod_pocztowy LIKE '3%' OR ulica = 'Główna';
```

**Przykład poprawnego zapytania:**

```sql
SELECT *
FROM klienci
WHERE miasto = 'Kraków' AND (kod_pocztowy LIKE '3%' OR ulica = 'Główna');
```

:bulb: Pamiętaj

* Dokładne działanie operatorów `AND` i `OR` w połączeniu z innymi operatorami może być bardziej złożone.
* Należy zawsze stosować nawisy, aby jasno określić priorytet operacji i uniknąć nieporozumień.

## Logika warunkowa w SQL

`CASE`, `WHEN`, `THEN`, `ELSE` i `END`, pozwala na wykonanie różnych działań w zależności od spełnienia określonych warunków. Oto jak to działa:

Logika  warunkowa pozwala na elastyczne wyświetlanie danych w kolumnach w zależności od określonych kryteriów. Innymi słowy, wartości w kolumnach mogą się zmieniać w oparciu o warunki logiczne zdefiniowane w zapytaniu.

### CASE

Kluczowym elementem logiki warunkowej jest wyrażenie `CASE`.  Pozwala ono na weryfikację wartości w kolumnach lub innych elementach danych, a następnie na podstawie wyniku tej weryfikacji, dostosowanie danych wyjściowych prezentowanych użytkownikowi.

Dzięki wyrażeniu CASE możemy wprowadzić do zapytań SQL bardziej złożoną logikę, co przekłada się na większą elastyczność i kontrolę nad prezentowanymi danymi.

**Składnia:**

```sql
CASE
    WHEN warunek1 THEN wynik1
    WHEN warunek2 THEN wynik2
    ...
    ELSE wynik_domyślny
END AS nazwa_kolumny
```

**Wyjaśnienie:**

1. **CASE:** Rozpoczyna instrukcję warunkową.
2. **WHEN warunek:** Określa warunek, który ma zostać sprawdzony.
3. **THEN wynik:** Określa wartość, która zostanie zwrócona, jeśli warunek jest spełniony (prawdziwy).
4. **ELSE wynik_domyślny:** Określa wartość, która zostanie zwrócona, jeśli żaden z powyższych warunków nie jest spełniony. Jest to opcjonalne.
5. **END:** Kończy instrukcję warunkową.
6. **AS nazwa_kolumny:** Opcjonalnie nadaje nazwę kolumnie wynikowej.

**Klauzula SELECT:**

Załóżmy, że mamy tabelę `pracownicy` z kolumnami `imie`, `nazwisko` i `pensja`. Chcemy utworzyć nową kolumnę `kategoria_pensji`, która będzie klasyfikować pracowników na podstawie ich zarobków:

```sql
SELECT imie, nazwisko, pensja,
    CASE
        WHEN pensja < 3000 THEN 'Niska'
        WHEN pensja >= 3000 AND pensja < 5000 THEN 'Średnia'
        WHEN pensja >= 5000 THEN 'Wysoka'
        ELSE 'Nieznana' -- Opcjonalnie, na wypadek braku danych
    END AS kategoria_pensji
FROM pracownicy;
```

W tym przykładzie:

* Jeśli `pensja` jest mniejsza niż 3000, wynik będzie 'Niska'.
* Jeśli `pensja` jest między 3000 a 5000 (włącznie), wynik będzie 'Średnia'.
* Jeśli `pensja` jest większa lub równa 5000, wynik będzie 'Wysoka'.
* Jeśli `pensja` jest NULL (brak danych), wynik będzie 'Nieznana' (jeśli dodamy klauzulę `ELSE`).

**:bulb: Ważne uwagi:**
* Warunki są sprawdzane sekwencyjnie, od góry do dołu.
* Gdy warunek jest spełniony, dalsze warunki nie są sprawdzane.
* Klauzula `ELSE` jest opcjonalna, ale zalecana, aby obsłużyć nieoczekiwane przypadki.

* Format `PROSTY` i `PRZESZUKUJĄCY WYRAŻENIA` w kontekście klauzuli `CASE`:

**1. Format prosty (Simple CASE):**

* **Działanie:** Porównuje wyrażenie z listą prostych wartości.
* **Składnia:**

```sql
CASE wyrażenie
    WHEN wartość1 THEN wynik1
    WHEN wartość2 THEN wynik2
    ...
    [ELSE wynik_domyślny]
END
```

* **Przykład:**

```sql
SELECT Nazwisko,
       CASE Stanowisko
           WHEN 'Kierownik' THEN 'Zarząd'
           WHEN 'Specjalista' THEN 'Pracownicy'
           ELSE 'Inne'
       END AS Kategoria
FROM Pracownicy;
```

W tym przykładzie sprawdzamy wartość kolumny `Stanowisko`. Jeśli jest to 'Kierownik', zwracamy 'Zarząd', jeśli 'Specjalista', zwracamy 'Pracownicy', a w przeciwnym razie 'Inne'.

**2. Format przeszukujący wyrażenia (Searched CASE):**

* **Działanie:** Porównuje wyrażenie z listą wyrażeń logicznych (warunków).
* **Składnia:**

```sql
CASE
    WHEN warunek1 THEN wynik1
    WHEN warunek2 THEN wynik2
    ...
    [ELSE wynik_domyślny]
END
```

* **Przykład:**

```sql
SELECT Nazwisko,
       CASE
           WHEN DATEDIFF(YEAR, DataZatrudnienia, GETDATE()) >= 10 THEN 'Długoletni pracownik'
           WHEN Pensja > 5000 THEN 'Wysoko opłacany'
           ELSE 'Standardowy pracownik'
       END AS Status
FROM Pracownicy;
```

W tym przykładzie sprawdzamy dwa warunki:

1. Czy pracownik jest zatrudniony co najmniej 10 lat (`DATEDIFF(YEAR, DataZatrudnienia, GETDATE()) >= 10`).
2. Czy pensja pracownika jest większa niż 5000 (`Pensja > 5000`).

Na podstawie spełnionych warunków przypisujemy odpowiedni status.

**Kiedy używać którego formatu:**

* **Format prosty:** Gdy porównujesz pojedynczą wartość z listą konkretnych wartości.
* **Format przeszukujący wyrażenia:** Gdy potrzebujesz bardziej złożonych warunków logicznych (np. porównania zakresów, wyrażenia logiczne).

**Dodatkowe uwagi:**

* Klauzula `ELSE` jest opcjonalna w obu formatach. Jeśli nie zostanie podana, a żadne z wyrażeń/warunków nie zostanie spełnione, zwrócona zostanie wartość NULL.
* Możesz zagnieżdżać klauzule `CASE` w sobie, aby tworzyć bardziej złożone struktury decyzyjne.

Mam nadzieję, że to wyjaśnia różnicę między formatami `CASE` w MSSQL! Jeśli masz jeszcze jakieś pytania, śmiało pytaj.

**Klauzula GROUP BY:**

```sql
SELECT 
    CASE
        WHEN wiek < 18 THEN 'Niepełnoletni'
        WHEN wiek >= 18 AND wiek < 65 THEN 'Dorosły'
        ELSE 'Senior'
    END AS kategoria_wiekowa,
    COUNT(*) AS liczba_klientow
FROM klienci
GROUP BY kategoria_wiekowa;
```

W tym przykładzie grupujemy klientów według kategorii wiekowej (obliczonej przez wyrażenie CASE) i zliczamy liczbę klientów w każdej kategorii.

**2. Klauzula ORDER BY:**

```sql
SELECT imie, nazwisko, wiek
FROM klienci
ORDER BY
    CASE
        WHEN wiek < 18 THEN 1
        WHEN wiek >= 18 AND wiek < 65 THEN 2
        ELSE 3
    END ASC;
```

Tutaj sortujemy klientów według kategorii wiekowej. Używamy liczb 1, 2, 3, aby określić kolejność sortowania kategorii.

**3. Klauzula WHERE:**

```sql
SELECT imie, nazwisko, wiek
FROM klienci
WHERE
    CASE
        WHEN wiek < 18 THEN 'Niepełnoletni'
        ELSE 'Pełnoletni'
    END = 'Pełnoletni';
```

W tym przykładzie filtrujemy tylko klientów pełnoletnich, używając wyrażenia CASE do określenia, czy klient jest pełnoletni, czy nie.

**4. Klauzula HAVING:**

```sql
SELECT 
    CASE
        WHEN wiek < 18 THEN 'Niepełnoletni'
        WHEN wiek >= 18 AND wiek < 65 THEN 'Dorosły'
        ELSE 'Senior'
    END AS kategoria_wiekowa,
    AVG(wiek) AS srednia_wieku
FROM klienci
GROUP BY kategoria_wiekowa
HAVING AVG(wiek) > 30;
```

W tym przypadku grupujemy klientów według kategorii wiekowej, obliczamy średnią wieku w każdej kategorii i filtrujemy tylko te kategorie, gdzie średnia wieku jest większa niż 30.











