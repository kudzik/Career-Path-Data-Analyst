# Słowa Kluczowe

## Kolejność

```sql
SELECT lista_kolumn
FROM lista_tabel
WHERE warunek
GROUP BY lista_kolumn
HAVING warunek
ORDER BY lista_kolumn
```

## SELECT

## Przykładowe instrukcje SELECT z różnymi możliwościami w SQL

Język SQL oferuje szeroki wachlarz możliwości tworzenia złożonych zapytań do baz danych. Poniżej przedstawiam kilka przykładów instrukcji `SELECT` z różnymi funkcjami:

**1. Pobranie wszystkich kolumn z tabeli:**

```sql
SELECT * FROM klienci;
```

Ta prosta instrukcja wybiera wszystkie kolumny (`*`) z tabeli `klienci` i wyświetla je w wynikach zapytania.

**2. Wybór określonych kolumn:**

```sql
SELECT id_klienta, imie, nazwisko, email FROM klienci;
```

Ta instrukcja wybiera tylko cztery kolumny: `id_klienta`, `imie`, `nazwisko` i `email` z tabeli `klienci`.

**3. Sortowanie wyników:**

```sql
SELECT * FROM klienci ORDER BY nazwisko, imie;
```

Ta instrukcja sortuje wyniki zapytania według nazwiska (rosnąco), a następnie według imienia (rosnąco).

**4. Filtrowanie danych (warunek WHERE):**

```sql
SELECT * FROM klienci WHERE kraj = 'Polska';
```

Ta instrukcja wybiera tylko te wiersze z tabeli `klienci`, dla których kolumna `kraj` ma wartość `Polska`.

**5. Grupowanie danych (GROUP BY):**

```sql
SELECT kraj, COUNT(*) AS ilosc_klientow
FROM klienci
GROUP BY kraj;
```

Ta instrukcja grupuje klientów według kraju i zlicza ich liczbę w każdym kraju. Wynik wyświetla kraj i liczbę klientów z tego kraju.

**6. Agregujące funkcje statystyczne:**

```sql
SELECT produkt, AVG(cena) AS srednia_cena
FROM produkty
GROUP BY produkt;
```

Ta instrukcja oblicza średnią cenę dla każdego produktu w tabeli `produkty`. Wynik wyświetla nazwę produktu i jego średnią cenę.

**7. Łączenie tabel (JOIN):**

```sql
SELECT z.nazwa_zamówienia, k.imie, k.nazwisko, p.nazwa_produktu, z.ilosc
FROM zamówienia z
JOIN klienci k ON z.id_klienta = k.id_klienta
JOIN produkty p ON z.id_produktu = p.id_produktu;
```

Ta instrukcja łączy trzy tabele: `zamówienia`, `klienci` i `produkty`. Wyświetla nazwę zamówienia, imię i nazwisko klienta, nazwę produktu oraz ilość zamówionego produktu.

**8. Podzapytania:**

```sql
SELECT id_klienta, imie, nazwisko
FROM klienci
WHERE id_klienta IN (
    SELECT id_klienta FROM zamówienia
    WHERE kwota_zamówienia > 1000
);
```

Ta instrukcja wykorzystuje podzapytanie do wybrania identyfikatorów klientów, których zamówienia przekroczyły 1000 zł. Następnie wybiera dane tych klientów z tabeli `klienci`.

**9. Wyrażenia warunkowe (CASE):**

```sql
SELECT produkt, cena,
    CASE WHEN cena < 50 THEN 'Tani'
         WHEN cena BETWEEN 50 AND 100 THEN 'Przeciętny'
         ELSE 'Drogi'
    END AS kategoria_cenowa
FROM produkty;
```

Ta instrukcja używa wyrażenia `CASE` do przypisania kategorii cenowej (`Tani`, `Przeciętny` lub `Drogi`) do każdego produktu w oparciu o jego cenę.

**10. Wiersze z wieloma wierszami (PIVOT):**

```sql
SELECT rok, 'Q1' AS kwartal, SUM(sprzedaz) AS sprzedaz_Q1,
       'Q2' AS kwartal, SUM(sprzedaz) AS sprzedaz_Q2,
       ...
FROM sprzedaz
GROUP BY rok
PIVOT (SUM(sprzedaz) FOR kwartal IN ('Q1', 'Q2', 'Q3', 'Q4')) AS wyniki;
```

Ta instrukcja przekształca dane z tabeli `sprzedaz` w wiersze z wieloma kolumnami, gdzie każda kolumna reprezentuje inny kwartał. Wynik pokazuje sprzedaż dla każdego roku w podziale na kwartały.

Powyższe przykłady stanowią jedynie mały wycinek możliwości instrukcji `SELECT` w języku SQL.

## Technika pól obliczeniowych w SQL

Technika pól obliczeniowych w SQL polega na definiowaniu kolumn w tabeli, których wartości są wyliczane na podstawie innych kolumn lub wartości stałych. Pola te nie przechowują danych wprowadzonych bezpośrednio przez użytkownika, ale są generowane automatycznie na podstawie określonych wyrażeń.

```sql
SELECT
'Imię klienta:',
ImięKlienta
FROM Sprzedaż
```

## AS

Słowo kluczowe `AS` w języku SQL służy do nadawania aliasów wyrażeniom kolumnom lub tabelom. Aliasy to nazwy nadawane elementom zapytania, które ułatwiają ich interpretację i zrozumienie. 

**Zastosowania słowa kluczowego `AS`:**

* **Nadawanie aliasów wyrażeniom:**

```sql
SELECT imie + ' ' + nazwisko AS pełne_imie FROM klienci;
```

W tym przykładzie wyrażenie `imie + ' ' + nazwisko` jest nadawane aliasowi `pełne_imie`. Dzięki temu w wynikach zapytania zamiast pełnego wyrażenia wyświetlana będzie kolumna o nazwie `pełne_imie`.

* **Nadawanie aliasów kolumnom:**

```sql
SELECT id_klienta AS ID, imie AS Imię, nazwisko AS Nazwisko FROM klienci;
```

W tym przykładzie aliasami kolumn `id_klienta`, `imie` i `nazwisko` są odpowiednio `ID`, `Imię` i `Nazwisko`. Ułatwia to identyfikację kolumn w wynikach zapytania.

* **Zwiększanie przejrzystości zapytania:**

Stosowanie aliasów może znacząco poprawić czytelność i zrozumiałość złożonych zapytań SQL. Zamiast długich i skomplikowanych wyrażeń, można używać krótkich i łatwych do zapamiętania aliasów.

* **Unikanie konfliktów nazw:**

Gdy w różnych częściach zapytania występują kolumny o tej samej nazwie, aliasy pozwalają na ich rozróżnienie i uniknięcie niejednoznaczności.

**Przykłady:**

* **Wyświetlanie kolumny z innej tabeli z tym samym aliasem:**

```sql
SELECT k.imie AS imie_klienta, p.imie AS imie_pracownika
FROM klienci k
JOIN pracownicy p ON k.id_pracownika = p.id_pracownika;
```

W tym przykładzie obie kolumny `imie` (z tabeli `klienci` i `pracownicy`) są nadawane aliasowi `imie_klienta` i `imie_pracownika`. Pozwala to na rozróżnienie ich w wynikach zapytania.

* **Używanie aliasów w klauzulach `WHERE` i `ORDER BY`:**

```sql
SELECT * FROM klienci
WHERE imie_klienta = 'Jan'
ORDER BY nazwisko_klienta;
```

W tym przykładzie aliasy `imie_klienta` i `nazwisko_klienta` są używane w klauzulach `WHERE` i `ORDER BY`, co ułatwia czytanie i zrozumienie zapytania.

* **Aliasy tabel w SQL: Znaczenie, zastosowania i tworzenie**

**Czym są aliasy tabel?**

Aliasy tabel w języku SQL to tymczasowe nazwy nadawane tabelom w zapytaniach. Ułatwiają one pisanie i czytanie zapytań, szczególnie w przypadku gdy w zapytaniu używa się wielu tabel o długich lub skomplikowanych nazwach.

**Zalety stosowania aliasów tabel:**

* **Poprawa czytelności:** Aliasy skracają nazwy tabel, co czyni zapytania bardziej przejrzyste i łatwiejsze do zrozumienia.
* **Unikanie konfliktów nazw:** W przypadku używania wielu tabel o podobnych nazwach, aliasy pozwalają na rozróżnienie ich w zapytaniu.
* **Krótsze instrukcje:** Aliasy mogą skrócić kod zapytania, co ułatwia jego pisanie i edytowanie.
* **Spójność w zapytaniach:** Stosowanie aliasów w różnych częściach tego samego zapytania lub w różnych zapytaniach ułatwia ich porównywanie i zrozumienie.

**Jak utworzyć alias tabeli?**

Alias tabeli tworzy się po nazwie tabeli, używając słowa kluczowego `AS` i nadając mu żądaną nazwę.

**Przykład:**

```sql
SELECT k.imie, k.nazwisko, z.nazwa_zamówienia, p.nazwa_produktu, z.ilosc
FROM zamówienia z
JOIN klienci k ON z.id_klienta = k.id_klienta
JOIN produkty p ON z.id_produktu = p.id_produktu;
```

W tym przykładzie:

* `z` jest aliasem tabeli `zamówienia`
* `k` jest aliasem tabeli `klienci`
* `p` jest aliasem tabeli `produkty`

Użycie aliasów w tym zapytaniu ułatwia identyfikację kolumn z poszczególnych tabel.

**Dodatkowe informacje:**

* Aliasy tabel obowiązują tylko w obrębie danego zapytania, w którym zostały zdefiniowane.
* Można używać aliasów nie tylko dla tabel, ale również dla kolumn, podzapytań i wyrażeń.
* Stosowanie aliasów jest zalecane, ale nie jest obowiązkowe w języku SQL.

## Różnice między funkcjami skalrnymi a agregującymi w SQL:

**Funkcje skalne:**

* **Działają na pojedynczych wierszach:** Funkcje skalne przyjmują wartości z jednej lub wielu kolumn w jednym wierszu tabeli i zwracają pojedynczą wartość dla tego wiersza.
* **Mogą być używane w różnych miejscach zapytania:** Funkcje skalne mogą być używane w instrukcjach `SELECT`, `WHERE`, `HAVING`, `ORDER BY` i innych.
* **Wykonują obliczenia na bieżąco:** Wartości funkcji skalnych są obliczane dla każdego wiersza tabeli podczas wykonywania zapytania.
* **Przykłady funkcji skalrnych:** `UPPER`, `LOWER`, `SUBSTRING`, `LTRIM`, `RTRIM`, `ROUND`, `SQRT`, `POWER`, `ABS`, `SIN`, `COS`, `TAN`, `DATEPART`, `DATEDIFF`, `GETDATE`, `CAST`, `ISNULL`.

**Funkcje agregujące:**

* **Działają na grupach wierszy:** Funkcje agregujące przyjmują wartości z jednej lub wielu kolumn w **grupie wierszy** i zwracają pojedynczą wartość podsumowującą dla tej grupy.
* **Wykorzystywane głównie w instrukcji `SELECT`:** Funkcje agregujące są najczęściej używane w instrukcji `SELECT` do obliczenia wartości podsumowujących dla grup wierszy, np. suma, średnia, minimum, maksimum.
* **Wyniki obliczane po zakończeniu grupowania:** Wartości funkcji agregujących są obliczane po zakończeniu grupowania wierszy w zapytaniu.
* **Przykłady funkcji agregujących:** `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP_CONCAT`.

**Podsumowując:**

* **Funkcje skalne** służą do manipulacji pojedynczymi wartościami w wierszach, a **funkcje agregujące** służą do podsumowywania wartości w grupach wierszy.
* Funkcje skalne mogą być używane w różnych miejscach zapytania, a funkcje agregujące są najczęściej używane w instrukcji `SELECT`.
* Wyniki funkcji skalnych są obliczane na bieżąco, a wyniki funkcji agregujących są obliczane po zakończeniu grupowania wierszy.


## Funkcje tekstowe i daty/czasu w SQL

W SQL istnieje wiele funkcji służących do manipulacji tekstem i zarządzaniem datami/czasem. Poniżej omówię kilka z nich:

**Funkcje tekstowe:**

* **SUBSTRING(string, start, length):** 
  - Zwraca podciąg tekstowy z określonego zakresu ciągu wejściowego (`string`).
  - Argument `start` określa pozycję początkową podciągu (indeksowanie zaczyna się od 1).
  - Argument `length` (opcjonalny) określa długość podciągu do pobrania.
  - Przykład: `SELECT SUBSTRING('Programowanie w SQL', 11, 3)` zwróci wartość "SQL".

* **LTRIM(string):** 
  - Usuwa wszystkie białe znaki (spacje, tabulatory, nowe wiersze) z początku ciągu tekstowego (`string`).
  - Przykład: `SELECT LTRIM('  Witaj w świecie SQL!  ')` zwróci wartość "Witaj w świecie SQL!".

* **RTRIM(string):** 
  - Usuwa wszystkie białe znaki z końca ciągu tekstowego (`string`).
  - Przykład: `SELECT RTRIM('Witaj w świecie SQL!  ')` zwróci wartość "Witaj w świecie SQL!".

* **UPPER(string):** 
  - Konwertuje wszystkie litery w ciągu tekstowym (`string`) na wielkie litery.
  - Przykład: `SELECT UPPER('sql')` zwróci wartość "SQL".

* **LOWER(string):** 
  - Konwertuje wszystkie litery w ciągu tekstowym (`string`) na małe litery.
  - Przykład: `SELECT LOWER('SQL')` zwróci wartość "sql".

**Funkcje daty/czasu:**

* **GETDATE():** 
  - Zwraca bieżącą datę i czas w formacie datetime.
  - Przykład: `SELECT GETDATE()` zwróci aktualną datę i czas.

* **DATEPART(part, date):** 
  - Zwraca określoną część daty (`date`).
  - Argument `part` może być np. 'year' (rok), 'month' (miesiąc), 'day' (dzień), 'hour' (godzina), 'minute' (minuta), 'second' (sekunda).
  - Przykład: `SELECT DATEPART(year, GETDATE())` zwróci aktualny rok.

* **DATEADD(datepart, number, date):** 
  - Dodaje określoną wartość (`number`) do określonej części daty (`date`).
  - Argument `datepart` może być taki sam jak w `DATEPART`.
  - Przykład: `SELECT DATEADD(day, 7, GETDATE())` zwróci datę o 7 dni później od daty bieżącej.

* **DATEDIFF(datepart, date1, date2):** 
  - Zwraca różnicę między dwiema datami (`date1` i `date2`) w określonych jednostkach (`datepart`).
  - Argument `datepart` może być np. 'year' (rok), 'month' (miesiąc), 'day' (dzień).
  - Przykład: `SELECT DATEDIFF(day, '2024-01-01', GETDATE())` zwróci różnicę w dniach między 1 stycznia 

## Funkcje pomocnicze w SQL

Funkcje pomocnicze w SQL to specjalne funkcje, które nie wykonują bezpośrednio operacji na danych, ale służą do konwersji typów danych, formatowania wartości, sprawdzania poprawności danych i innych zadań pomocniczych. Ułatwiają one manipulację danymi i zwiększają elastyczność zapytań SQL.

Oto kilka przykładów powszechnie używanych funkcji pomocniczych w SQL:

**1. Konwersja typów danych:**

* **`CAST`:** Konwertuje wartość na określony typ danych. Na przykład:

```sql
SELECT CAST(kolumna_liczbową AS VARCHAR(20)) AS tekst_z_liczby
FROM tabela;
```

Aby zastąpić wartość NULL innym słowem w tabeli SQL, można użyć funkcji COALESCE lub IFNULL (w zależności od systemu zarządzania bazą danych). Poniżej znajdują się przykłady dla różnych systemów DBMS.

```sql
SELECT id, IFNULL(imie, 'Nieznane') as imie, nazwisko, data_urodzenia
FROM pracownicy;
```

Przykład z użyciem `COALESCE`
Funkcja `COALESCE` działa podobnie i może być używana w ten sam sposób.

```sql
SELECT id, COALESCE(imie, 'Nieznane') as imie, nazwisko, data_urodzenia
FROM pracownicy;
```

* **`CONVERT`:** Konwertuje wartość na określony typ danych i format. Na przykład:

```sql
SELECT CONVERT(kolumna_datową, 'YYYY-MM-DD') AS data_sformatowana
FROM tabela;
```

**2. Formatowanie wartości:**

* **`SUBSTRING`:** Pobiera podciąg z ciągu tekstowego. Na przykład:

```sql
SELECT SUBSTRING(kolumna_tekstową, 5, 10) AS podciąg
FROM tabela;
```

* **`TRIM`:** Usuwa spacje z początku i końca ciągu tekstowego. Na przykład:

```sql
SELECT TRIM(kolumna_tekstową) AS tekst_bez_spacji
FROM tabela;
```

**3. Sprawdzanie poprawności danych:**

* **`ISNULL`:** Sprawdza, czy wartość jest NULL. Na przykład:

```sql
SELECT * FROM tabela WHERE kolumna_wartościowa IS NOT NULL;
```

* **`ISNUMERIC`:** Sprawdza, czy wartość jest liczbą. Na przykład:

```sql
SELECT * FROM tabela WHERE kolumna_liczbową ISNUMERIC;
```

**4. Inne funkcje pomocnicze:**

* **`NOW`:** Zwraca aktualną datę i czas.
* **`RAND`:** Generuje losową liczbę.
* **`LENGTH`:** Zwraca długość ciągu tekstowego.

Oprócz wymienionych powyżej funkcji, SQL oferuje wiele innych funkcji pomocniczych, które służą do różnych celów. Dokładna lista dostępnych funkcji może się różnić w zależności od używanego systemu zarządzania bazą danych (SGBD).

