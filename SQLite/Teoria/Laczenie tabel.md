# Łączenie Tabel w SQL

Łączenie tabel (ang. *JOIN*) jest jedną z najważniejszych funkcji SQL, pozwalającą na pobieranie danych z wielu tabel w jednym zapytaniu. Łączenie tabel umożliwia analizę danych, które są rozproszone w różnych tabelach bazy danych, ale mają pewne wspólne cechy.

## Typy łączeń

1. **INNER JOIN**: Zwraca wiersze, które mają pasujące wartości w obu tabelach.
2. **LEFT JOIN (LEFT OUTER JOIN)**: Zwraca wszystkie wiersze z lewej tabeli oraz pasujące wiersze z prawej tabeli. Jeśli nie ma pasujących wierszy w prawej tabeli, zwraca `NULL` dla kolumn z prawej tabeli.
3. **RIGHT JOIN (RIGHT OUTER JOIN)**: Zwraca wszystkie wiersze z prawej tabeli oraz pasujące wiersze z lewej tabeli. Jeśli nie ma pasujących wierszy w lewej tabeli, zwraca `NULL` dla kolumn z lewej tabeli.
4. **FULL JOIN (FULL OUTER JOIN)**: Zwraca wszystkie wiersze, gdy jest dopasowanie w jednej z tabel. Jeśli nie ma dopasowania, zwraca `NULL` w odpowiednich kolumnach.
5. **CROSS JOIN**: Zwraca iloczyn kartezjański dwóch tabel, co oznacza, że każda kombinacja wiersza z pierwszej tabeli jest łączona z każdym wierszem z drugiej tabeli.
6. **SELF JOIN**: Jest to połączenie tabeli samej ze sobą.

## Przykłady łączenia tabel

### 1. INNER JOIN

Załóżmy, że mamy dwie tabele: `Order` (Zamówienia) i `Customer` (Klienci). Chcemy pobrać listę zamówień razem z nazwami klientów, którzy złożyli te zamówienia.

```sql
SELECT Order.OrderID, Customer.CustomerName, Order.OrderDate
FROM Order
INNER JOIN Customer ON Order.CustomerID = Customer.CustomerID;
```

**Opis:**

- `INNER JOIN` łączy tabelę `Order` z tabelą `Customer` na podstawie wspólnej kolumny `CustomerID`.
- Wynik zawiera tylko te wiersze, gdzie istnieje dopasowanie między `Order.CustomerID` a `Customer.CustomerID`.

### 2. LEFT JOIN

Chcemy uzyskać listę wszystkich klientów, nawet tych, którzy jeszcze nie złożyli zamówienia.

```sql
SELECT Customer.CustomerName, Order.OrderID
FROM Customer
LEFT JOIN Order ON Customer.CustomerID = Order.CustomerID;
```

**Opis:**

- `LEFT JOIN` zwraca wszystkie wiersze z tabeli `Customer`, nawet jeśli nie mają dopasowania w tabeli `Order`.
- Jeśli klient nie ma zamówienia, kolumna `OrderID` będzie miała wartość `NULL`.

### 3. RIGHT JOIN

Załóżmy, że chcemy uzyskać listę wszystkich zamówień, nawet jeśli nie mamy informacji o kliencie (przypadek rzadki, ale możliwy).

```sql
SELECT Customer.CustomerName, Order.OrderID
FROM Order
RIGHT JOIN Customer ON Order.CustomerID = Customer.CustomerID;
```

**Opis:**

- `RIGHT JOIN` zwraca wszystkie wiersze z tabeli `Order`, nawet jeśli nie mają dopasowania w tabeli `Customer`.
- Jeśli zamówienie nie ma przypisanego klienta, kolumna `CustomerName` będzie miała wartość `NULL`.

### 4. FULL JOIN

Załóżmy, że chcemy uzyskać pełną listę wszystkich klientów i zamówień, nawet jeśli nie mają oni odpowiedników w drugiej tabeli.

```sql
SELECT Customer.CustomerName, Order.OrderID
FROM Customer
FULL JOIN Order ON Customer.CustomerID = Order.CustomerID;
```

**Opis:**

- `FULL JOIN` zwraca wszystkie wiersze z obu tabel, łącząc je tam, gdzie to możliwe.
- W przypadku braku dopasowania, odpowiednie kolumny będą miały wartość `NULL`.

### 5. CROSS JOIN

Załóżmy, że chcemy uzyskać wszystkie możliwe kombinacje klientów i produktów.

```sql
SELECT Customer.CustomerName, Product.ProductName
FROM Customer
CROSS JOIN Product;
```

**Opis:**

- `CROSS JOIN` zwraca każdą możliwą parę wierszy z obu tabel.
- Przy dużych tabelach wynik może być bardzo duży, więc należy używać tego łączenia ostrożnie.

### 6. SELF JOIN

Załóżmy, że w tabeli `Employee` (Pracownicy) mamy kolumnę `ManagerID`, która wskazuje na `EmployeeID` menedżera danego pracownika. Chcemy znaleźć wszystkich pracowników razem z ich menedżerami.

```sql
SELECT e1.EmployeeName AS Employee, e2.EmployeeName AS Manager
FROM Employee e1
INNER JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;
```

**Opis:**

- `SELF JOIN` łączy tabelę `Employee` sama ze sobą.
- `e1` to alias pierwszej instancji tabeli `Employee`, a `e2` to alias drugiej instancji.
- Wynik zapytania pokazuje nazwę pracownika i nazwę jego menedżera.

## Zasady i dobre praktyki

- **Optymalizacja zapytań:** Łączenie dużych tabel może być kosztowne dla wydajności, dlatego ważne jest, aby zoptymalizować zapytania, np. za pomocą indeksów.
- **Przejrzystość zapytań:** Używanie aliasów (`e1`, `e2`) może zwiększyć czytelność zapytań, szczególnie przy self joinach.
- **NULL w JOIN:** Zrozumienie, jak `NULL` wpływa na wyniki różnych typów łączeń, jest kluczowe dla uzyskania poprawnych wyników.

## Podsumowanie

Łączenie tabel jest podstawową umiejętnością w SQL, niezbędną do pracy z relacyjnymi bazami danych. Pozwala na uzyskanie kompleksowych danych z wielu źródeł, a znajomość różnych typów łączeń pozwala na tworzenie złożonych zapytań odpowiadających na różnorodne potrzeby analityczne.
