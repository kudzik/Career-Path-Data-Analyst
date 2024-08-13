### Operatory Złożone (Compound Operators) w SQL

Operatory złożone (ang. *compound operators*) w SQL pozwalają na łączenie wyników dwóch lub więcej zapytań w jedno. Dzięki nim można z łatwością manipulować danymi pochodzącymi z różnych zapytań, uzyskując spójne zestawy danych.

W SQL istnieją cztery główne operatory złożone:

1. **UNION**
2. **UNION ALL**
3. **INTERSECT**
4. **EXCEPT**

### 1. UNION

Operator `UNION` łączy wyniki dwóch lub więcej zapytań w jedno. Wynik zawiera unikalne wiersze, czyli eliminuje duplikaty.

#### Przykład

Załóżmy, że mamy dwie tabele: `Customers` (Klienci) i `Suppliers` (Dostawcy), obie z kolumną `City`. Chcemy uzyskać listę wszystkich unikalnych miast, w których znajdują się klienci lub dostawcy.

```sql
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;
```

**Opis:**

- `UNION` łączy wyniki z obu tabel i zwraca unikalne miasta.

### 2. UNION ALL

`UNION ALL` działa podobnie do `UNION`, ale nie eliminuje duplikatów. Wszystkie wiersze, nawet te powtarzające się, zostaną zwrócone.

#### Przykład

Chcemy uzyskać listę wszystkich miast z tabel `Customers` i `Suppliers`, w tym także powtarzające się miasta.

```sql
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers;
```

**Opis:**

- `UNION ALL` łączy wyniki z obu tabel, zwracając wszystkie miasta, w tym te, które się powtarzają.

### 3. INTERSECT

Operator `INTERSECT` zwraca tylko te wiersze, które są wspólne dla obu zapytań.

#### Przykład

Chcemy znaleźć miasta, w których znajdują się zarówno klienci, jak i dostawcy.

```sql
SELECT City FROM Customers
INTERSECT
SELECT City FROM Suppliers;
```

**Opis:**

- `INTERSECT` zwraca tylko te miasta, które występują zarówno w tabeli `Customers`, jak i `Suppliers`.

### 4. EXCEPT

Operator `EXCEPT` zwraca wiersze, które znajdują się w wyniku pierwszego zapytania, ale nie znajdują się w wyniku drugiego zapytania. Można go traktować jako różnicę między dwoma zestawami danych.

#### Przykład

Chcemy znaleźć miasta, w których są klienci, ale nie ma dostawców.

```sql
SELECT City FROM Customers
EXCEPT
SELECT City FROM Suppliers;
```

**Opis:**

- `EXCEPT` zwraca miasta, które znajdują się w tabeli `Customers`, ale nie ma ich w tabeli `Suppliers`.

### Zasady i dobre praktyki

- **Zgodność kolumn:** Liczba i typy danych kolumn w obu zapytaniach muszą się zgadzać. To znaczy, że jeśli pierwsze zapytanie zwraca kolumnę typu `VARCHAR`, to w drugim zapytaniu musi być odpowiednia kolumna o tym samym typie.
- **Kolejność sortowania:** Jeśli chcesz posortować wynik po połączeniu zapytań, musisz dodać klauzulę `ORDER BY` po zakończeniu wszystkich zapytań i operatorów złożonych.
- **Wydajność:** Użycie `UNION` może być bardziej kosztowne niż `UNION ALL`, ponieważ `UNION` musi przetworzyć i usunąć duplikaty.

### Przykład złożony

Załóżmy, że chcemy uzyskać pełną listę wszystkich miast, gdzie mamy klientów, oraz miast, gdzie mamy dostawców, a także zobaczyć, w których miastach mamy tylko klientów (bez dostawców).

```sql
-- Lista wszystkich unikalnych miast z klientów i dostawców
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;

-- Lista miast, gdzie są tylko klienci, a nie ma dostawców
SELECT City FROM Customers
EXCEPT
SELECT City FROM Suppliers;
```

### Podsumowanie

Operatory złożone są potężnym narzędziem w SQL, które pozwala na elastyczne manipulowanie danymi pochodzącymi z wielu zapytań. Dzięki nim można łatwo łączyć, porównywać i analizować dane, co jest niezwykle przydatne w bardziej złożonych analizach.
