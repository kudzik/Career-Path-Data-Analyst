# Sortowanie Danych

## Sortowanie danych w SQL z użyciem ORDER BY, ASC i DESC

**ORDER BY:**

Klauzula `ORDER BY` służy do sortowania wyników zapytania SQL według określonych kolumn lub wyrażeń. Pozwala uporządkować wiersze w tabeli w żądanej kolejności.

Składnia:

```sql
SELECT * FROM tabela
ORDER BY kolumna1 [ASC | DESC], kolumna2 [ASC | DESC], ...;
```

* `kolumna1`, `kolumna2`: Nazwy kolumn, po których chcesz sortować.
* `ASC`: Domyślny kierunek sortowania. Sortuje od wartości najmniejszej do największej (rosnąco).
* `DESC`: Sortuje od wartości największej do najmniejszej (malejąco).

**Przykład:**

Załóżmy, że masz tabelę `klienci` z kolumnami `id_klienta`, `nazwisko` i `miasto`. Chcesz wyświetlić listę klientów posortowaną według nazwiska, a w przypadku klientów o tym samym nazwisku - według miasta.

```sql
SELECT id_klienta, nazwisko, miasto
FROM klienci
ORDER BY nazwisko ASC, miasto ASC;
```

W tym zapytaniu:

* Wybieramy wszystkie kolumny z tabeli `klienci`.
* Sortujemy wiersze rosnąco według `nazwisko`.
* W przypadku klientów o tym samym nazwisku, sortujemy dalej rosnąco według `miasto`.

**Dodatkowe informacje:**

* Możesz sortować według wielu kolumn jednocześnie, podając je po przecinku.
* Możesz używać wyrażeń zamiast nazw kolumn. Na przykład, aby posortować według daty urodzenia obliczonej na podstawie kolumny `rok_urodzenia` i `miesiąc_urodzenia`, możesz użyć:

```sql
ORDER BY CONCAT(rok_urodzenia, '-', miesiąc_urodzenia) ASC;
```

* Sortowanie może być używane w połączeniu z innymi klauzulami, takimi jak `WHERE` i `LIMIT`, aby filtrować i ograniczać wyniki zapytania.

**ASC i DESC:**

Słowa kluczowe `ASC` i `DESC` określają kierunek sortowania.

* `ASC` (Ascending) - sortowanie rosnąco, od wartości najmniejszej do największej.
* `DESC` (Descending) - sortowanie malejąco, od wartości największej do najmniejszej.

Domyślnym kierunkiem sortowania jest `ASC`, czyli sortowanie rosnąco. Możesz je pominąć, jeśli chcesz sortować rosnąco. 

Pamiętaj, że sortowanie jest operacją kosztowną pod względem wydajności, szczególnie dla dużych tabel. Stosuj je tylko wtedy, gdy jest to rzeczywiście konieczne.


