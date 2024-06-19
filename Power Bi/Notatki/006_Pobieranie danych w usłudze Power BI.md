# Pobieranie danych w usłudze Power BI

## Pobieranie Danych z Plików i SQL w Power BI

### Pobieranie Danych z Plików Excel

Pliki Excel są często używane do przechowywania różnych danych, takich jak listy pracowników, budżety, dane sprzedażowe itp. Power BI umożliwia łatwe importowanie tych danych, pozwalając na wybór odpowiednich arkuszy lub tabel oraz ich podgląd przed zaimportowaniem. Możliwe jest również edytowanie danych w Power Query Editor, gdzie można zmieniać nazwy kolumn, zastępować wartości, usuwać błędy i łączyć zapytania. Po oczyszczeniu danych są one ładowane do Power BI, gdzie można rozpocząć tworzenie wizualizacji i raportów.

### Pobieranie Danych z Plików CSV

Pliki CSV (Comma Separated Values) są prostymi plikami tekstowymi używanymi do przechowywania danych w formacie tabelarycznym, gdzie każda linia reprezentuje wiersz, a wartości są rozdzielone przecinkami. Power BI umożliwia importowanie danych z plików CSV, zapewniając podgląd danych przed załadowaniem, aby upewnić się, że są one poprawnie zaimportowane. Można również edytować dane w Power Query Editor, gdzie możliwe jest zmienianie nazw kolumn, filtrowanie, usuwanie błędów i łączenie zapytań.

### Edytowanie i Czyszczenie Danych w Power Query Editor

Po zaimportowaniu danych do Power Query Editor, można je edytować i oczyścić poprzez zmienianie nazw kolumn, zastępowanie wartości, usuwanie błędów, filtrowanie danych oraz łączenie zapytań z różnych źródeł, tworząc jednolity zestaw danych. Edytowanie i czyszczenie danych pozwala na przygotowanie ich do tworzenia modeli i wizualizacji w Power BI.

### Pobieranie Danych z SQL za pomocą Zapytania SQL

Power BI umożliwia także importowanie danych bezpośrednio z baz danych SQL poprzez pisanie własnych zapytań SQL. Połączenie z bazą danych SQL Server i innych relacyjnych baz danych pozwala na precyzyjne pobieranie danych poprzez wykonywanie zapytań SQL.

### Tworzenie i Wykonywanie Zapytania SQL w Power BI

Aby pobrać dane z bazy danych SQL, użytkownicy mogą napisać i wykonać zapytanie SQL. W Power BI, po nawiązaniu połączenia z bazą danych, można otworzyć edytor zapytań SQL i wpisać odpowiednie zapytanie, które pobierze wymagane dane. Zapytania SQL umożliwiają dokładne określenie, które dane mają zostać zaimportowane, oraz zastosowanie odpowiednich filtrów i sortowania już na etapie pobierania.

### Publikowanie Danych w Power BI

Po zakończeniu edycji danych w Power Query Editor, dane są ładowane do modelu Power BI, gdzie można rozpocząć tworzenie wizualizacji i raportów. Tworzenie relacji między tabelami jest kluczowe, zwłaszcza gdy dane pochodzą z różnych źródeł. Po utworzeniu raportów, można je opublikować w usłudze Power BI, udostępniając je innym użytkownikom i konfigurować uprawnienia dostępu, aby zapewnić, że odpowiednie osoby mają dostęp do niezbędnych danych i raportów.

## Tworzenie Dynamicznych Raportów z Parametrami w Power BI
//TODO
[Dokumentacja Tworzenie Dynamicznych Raportów z Parametrami]("https://learn.microsoft.com/pl-pl/training/modules/get-data/3b-parameters")

### Pobieranie Danych z Bazy Danych NoSQL w Power BI

Bazy danych NoSQL, takie jak Cosmos DB, MongoDB, Firebase i inne, są wykorzystywane do przechowywania danych w formacie dokumentów, klucz-wartość, grafów lub kolumn. Power BI oferuje możliwości łączenia się z tymi bazami danych, umożliwiając pobieranie i analizowanie danych z tych źródeł. Poniżej znajduje się omówienie sposobu pobierania danych z baz danych NoSQL w Power BI.

#### Wprowadzenie do Baz Danych NoSQL

Bazy danych NoSQL różnią się od tradycyjnych baz danych SQL tym, że nie używają relacyjnego modelu danych. Zamiast tego przechowują dane w elastycznych, nieustrukturyzowanych lub półustrukturyzowanych formatach, co pozwala na lepszą skalowalność i wydajność przy dużych zbiorach danych.

