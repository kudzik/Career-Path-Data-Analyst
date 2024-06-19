# Wprowadzenie

## Język SQL - czym jest i do czego służy?

**SQL** (Structured Query Language - Język Strukturyzowanych Zapytań) to uniwersalny język programowania służący do komunikacji z bazami danych. Jest on stosowany w większości relacyjnych systemów zarządzania bazami danych (RDBMS), takich jak MySQL, PostgreSQL, Oracle i Microsoft SQL Server.

**Główne funkcje SQL:**

* **Zarządzanie danymi:**
  * Tworzenie, modyfikowanie i usuwanie tabel w bazie danych
  * Dodawanie, modyfikowanie i usuwanie rekordów w tabelach
  * Sortowanie, filtrowanie i agregowanie danych
  * Pobieranie danych z bazy danych do aplikacji lub plików
* **Definicja struktury bazy danych:**
  * Określanie typów danych dla kolumn w tabelach
  * Ustawianie kluczy głównych, obcych i indeksów
  * Tworzenie relacji między tabelami
* **Kontrola dostępu do danych:**
  * Nadawanie uprawnień użytkownikom do wykonywania operacji na danych
  * Zabezpieczanie danych przed nieuprawnionym dostępem

**Zastosowania SQL:**

* **Aplikacje webowe:** Praktycznie każda strona internetowa korzystająca z bazy danych używa SQL do pobierania, modyfikowania i przechowywania danych.
* **Systemy analityczne:** SQL jest używany do wydobywania i analizowania danych z dużych baz danych, takich jak te wykorzystywane w celach biznesowych lub naukowych.
* **Aplikacje desktopowe:** Wiele programów desktopowych, takich jak edytory tekstu i arkusze kalkulacyjne, wykorzystuje SQL do przechowywania i zarządzania danymi użytkownika.
* **Systemy wbudowane:** SQL jest coraz częściej używany w systemach wbudowanych, takich jak inteligentne urządzenia domowe i samochody autonomiczne, do zarządzania danymi czujników i innych urządzeń.

**Zalety stosowania SQL:**

* **Uniwersalność:** SQL jest językiem standardowym, co oznacza, że można go używać z różnymi systemami zarządzania bazami danych.
* **Wydajność:** SQL jest zoptymalizowany do szybkiego i efektywnego przetwarzania dużych ilości danych.
* **Łatwość nauki:** Podstawowych instrukcji SQL można nauczyć się stosunkowo szybko, a bardziej zaawansowane funkcje można opanować z czasem.
* **Moc:** SQL oferuje szeroki zakres funkcji umożliwiających kompleksową manipulację danymi.

## Relacyjne Bazy Danych (RDBMS)

**Klucze**:
- **Klucz główny (Primary Key)**: Unikalny identyfikator dla każdego rekordu w tabeli. Każda tabela może mieć tylko jeden klucz główny.
- **Klucz obcy (Foreign Key)**: Pole w jednej tabeli, które odwołuje się do klucza głównego w innej tabeli, umożliwiając tworzenie relacji między tabelami.
Relacje: Powiązania między tabelami, które mogą być jednego z kilku typów:

W SQL istnieją klucze główne i obce. Są to dwa ważne typy ograniczeń, które są stosowane do tabel w bazach danych relacyjnych w celu zapewnienia integralności danych i definiowania relacji między tabelami.

**Klucz główny** (ang. primary key) to unikalny identyfikator każdego wiersza w tabeli. Oznacza to, że żadne dwa wiersze w tabeli nie mogą mieć tej samej wartości klucza głównego. Klucz główny może składać się z jednej lub więcej kolumn. Na przykład w tabeli zawierającej informacje o klientach kluczem głównym może być kolumna `id_klienta`.

**Klucz obcy** (ang. foreign key) to kolumna lub zestaw kolumn w jednej tabeli, które odnoszą się do klucza głównego w innej tabeli. Klucze obce są używane do łączenia tabel ze sobą i zapewniania spójności danych. Na przykład w tabeli zawierającej zamówienia klientów kluczem obcym może być kolumna `id_klienta`, która odnosi się do kolumny `id_klienta` w tabeli zawierającej informacje o klientach.

Oto kilka korzyści z korzystania z kluczy głównych i obcych w SQL:

* **Zapewniają integralność danych:** Klucze główne i obce pomagają zapewnić, że dane w bazie danych są dokładne i spójne. Zapobiegają wstawianiu duplikatów danych i zapewniają, że dane w jednej tabeli są zgodne z danymi w innej tabeli.
* **Definiują relacje między tabelami:** Klucze obce definiują relacje między tabelami w bazie danych. Umożliwiają zrozumienie, w jaki sposób tabele są ze sobą połączone i jak dane w jednej tabeli odnoszą się do danych w innej tabeli.
* **Ułatwiają wyszukiwanie danych:** Klucze główne i obce mogą ułatwić wyszukiwanie danych w bazie danych. Ponieważ każdy wiersz w tabeli ma unikalny identyfikator, można łatwo znaleźć określony wiersz, używając jego klucza głównego. Klucze obce można również wykorzystać do wyszukiwania danych w wielu tabelach.

## Łączenie tabel `klienci` i `zamówienia` za pomocą kluczy w SQL

W bazach danych relacyjnych tabele są często ze sobą powiązane za pomocą kluczy głównych i obcych. Umożliwia to łączenie danych z różnych tabel w celu uzyskania bardziej kompleksowych informacji. W przypadku tabel `klienci` i `zamówienia` możemy połączyć je za pomocą klucza obcego `id_klienta` w tabeli `zamówienia`, który odwołuje się do klucza głównego `id_klienta` w tabeli `klienci`.

Istnieje kilka różnych typów połączeń tabel w SQL, z których najczęstsze to:

* **Łączenie wewnętrzne (INNER JOIN):** Zwraca tylko wiersze, które mają pasujące wartości w obu tabelach.
* **Łączenie zewnętrzne lewe (LEFT OUTER JOIN):** Zwraca wszystkie wiersze z tabeli lewej oraz pasujące wiersze z tabeli prawej. Wiersze z tabeli prawej, które nie mają pasujących wierszy w tabeli lewej, są wypełniane wartościami NULL.
* **Łączenie zewnętrzne prawe (RIGHT OUTER JOIN):** Zwraca wszystkie wiersze z tabeli prawej oraz pasujące wiersze z tabeli lewej. Wiersze z tabeli lewej, które nie mają pasujących wierszy w tabeli prawej, są wypełniane wartościami NULL.
* **Łączenie pełne (FULL OUTER JOIN):** Zwraca wszystkie wiersze z obu tabel, niezależnie od tego, czy mają pasujące wartości. Wiersze bez pasujących wartości w drugiej tabeli są wypełniane wartościami NULL.

Przykład użycia łączenia wewnętrznego do pobrania informacji o klientach i ich zamówieniach:

```sql
SELECT klienci.imie, klienci.nazwisko, zamowienia.id_zamowienia, zamowienia.data_zamowienia, zamowienia.kwota_zamowienia
FROM klienci
INNER JOIN zamowienia ON klienci.id_klienta = zamowienia.id_klienta;
```

Ten kod SQL zwraca tabelę zawierającą kolumny `imie`, `nazwisko` z tabeli `klienci` oraz kolumny `id_zamowienia`, `data_zamowienia` i `kwota_zamowienia` z tabeli `zamówienia`. Wiersze w tabeli wynikowej zawierają tylko informacje o klientach, którzy złożyli zamówienia.

## Struktura tabel bazy danych i typy danych: Omówienie

Bazy danych relacyjne wykorzystują klucze główne i obce do tworzenia struktury tabel, zapewniając prawidłowe powiązania między nimi i umożliwiając dostęp do wszystkich danych. Oprócz kluczy, każda kolumna w tabeli posiada typ danych, określający rodzaj przechowywanych w niej informacji.

Niestety, różne bazy danych stosują zróżnicowane typy danych o zbliżonym znaczeniu. Główne kategorie typów danych, występują w większości systemów. Po zapoznaniu się z tymi podstawowymi kategoriami, łatwiej będzie zrozumieć inne typy.

Ogólnie rzecz biorąc, istnieją trzy główne kategorie typów danych:

**1. Typy numeryczne:**

Służą do przechowywania wartości liczbowych, zarówno całkowitych (np. 1, 100, -5), jak i ułamkowych (np. 3.14, 0.25, -2.7). W obrębie tej kategorii można wyróżnić podkategorie, takie jak:

* **Całkowite:** Przechowują liczby całkowite bez znaku lub ze znakiem w określonym zakresie (np. INT, SMALLINT, BIGINT).
* **Dziesiętne:** Przechowują liczby dziesiętne o określonej precyzji i skali (np. DECIMAL, NUMERIC).

**2. Typy znakowe:**

Służą do przechowywania ciągów znaków, takich jak tekst, słowa, zdania czy adresy. W tej kategorii można wyróżnić:

* **Stałej długości:** Przechowują ciągi o określonej, stałej długości, nawet jeśli część znaków jest pusta (np. CHAR, NCHAR).
* **Zmiennej długości:** Przechowują ciągi o zmiennej długości, zajmując tylko tyle miejsca, ile potrzeba (np. VARCHAR, NVARCHAR).
* **Unicode:** Przechowują ciągi znaków w standardzie Unicode, obsługując szeroki zakres języków i symboli (np. NVARCHAR2, NCHAR).

**3. Typy daty i czasu:**

Służą do przechowywania wartości dat i godzin, umożliwiając precyzyjne rejestrowanie momentów czasowych. W tej kategorii można wyróżnić:

* **Data:** Przechowuje datę bez informacji o godzinie (np. DATE).
* **Czas:** Przechowuje godzinę bez informacji o dacie (np. TIME).
* **Data i czas:** Przechowuje zarówno datę, jak i godzinę w jednym polu (np. DATETIME, TIMESTAMP).

To tylko podstawowy zarys typów danych. Dokładne nazewnictwo i funkcje mogą się różnić w zależności od używanego systemu baz danych. Ważne jest, aby zapoznać się z dokumentacją konkretnej bazy, aby w pełni wykorzystać dostępne typy danych i zapewnić integralność i spójność danych.

Dodatkowo, oprócz omówionych kategorii, istnieją również inne typy danych, takie jak:

* **Logiczne:** Przechowują wartości typu prawda/fałsz (np. BOOLEAN, BIT).
* **Adresy:** Przechowują adresy pamięci lub inne identyfikatory obiektów (np. POINTER, REF).
* **Typy specjalne:** Służą do przechowywania specyficznych typów danych, takich jak obrazy, pliki binarne czy duże obiekty (np. BLOB, IMAGE).

:bulb: Jeśli nie ma potrzeby na wartości wykonywać żadnych działań matematycznych, deklarujemy ją jako wrtość tekstową np. kod pocztowy.

## Wartość NULL

W SQL wartość `NULL` oznacza brak wartości w kolumnie tabeli. Oznacza to, że dana kolumna dla danego wiersza nie zawiera żadnej informacji.

Wartość `NULL` jest inna niż pusty ciąg lub zero. Pusty ciąg to ciąg znaków o długości zero, podczas gdy zero to wartość liczbowa. `NULL` reprezentuje brak wartości, podczas gdy pusty ciąg i zero reprezentują określone wartości.

Istnieje kilka sytuacji, w których w kolumnie może znajdować się wartość `NULL`:

* **Brak danych:** Jeśli dana dla danej kolumny nie jest znana lub nie została zebrana, wprowadzana jest wartość `NULL`.
* **Błąd podczas wprowadzania danych:** Podczas wprowadzania danych do tabeli może wystąpić błąd, co skutkuje wartością `NULL` w kolumnie.
* **Celowe użycie:** W niektórych przypadkach wartość `NULL` może być używana celowo do oznaczenia braku informacji lub nieistniejących danych.

Używanie wartości `NULL` w SQL ma zarówno zalety, jak i wady:

**Zalety:**

* **Dokładność:** Dokładniej odzwierciedla brak informacji niż pusty ciąg lub zero.
* **Spójność:** Zapewnia spójność w sposobie reprezentowania brakujących danych w różnych kolumnach i tabelach.
* **Efektywność:** W niektórych przypadkach bazy danych mogą optymalizować zapytania, biorąc pod uwagę wartości `NULL`.

**Wady:**

* **Złożoność:** Dodaje pewną złożoność do zapytań SQL, ponieważ należy uwzględnić możliwość wystąpienia wartości `NULL`.
* **Problemy z łączeniem tabel:** Łączenie tabel z wartościami `NULL` może wymagać dodatkowych kroków lub obsługi błędów.
* **Niektóre funkcje SQL nie obsługują wartości NULL:** Niektóre funkcje SQL mogą nie działać poprawnie z wartościami `NULL`, co może wymagać specjalnego traktowania.

Ogólnie rzecz biorąc, wartość `NULL` jest cennym narzędziem w SQL, umożliwiającym dokładne reprezentowanie brakujących danych i zapewniającym spójność w bazach danych. Należy jednak pamiętać o potencjalnych wadach i upewnić się, że rozumie się, jak obsługiwać wartości `NULL` w zapytaniach i operacjach na tabelach.

Poniżej przedstawiam kilka przykładów użycia wartości `NULL` w SQL:

* `SELECT * FROM klienci WHERE email IS NULL;` - Zapytanie to zwraca wszystkich klientów, którzy nie podali adresu e-mail.
* `UPDATE produkty SET cena = NULL WHERE stan_magazynowy = 0;` - Ta instrukcja SQL ustawia cenę produktów na `NULL` dla tych, których stan magazynowy wynosi 0.



## Wyjaśnienie instrukcji SELECT i FROM w języku SQL

W języku SQL instrukcje `SELECT` i `FROM` są podstawowymi elementami tworzenia zapytań do baz danych. Odpowiadają one za określenie, jakie dane chcemy pobrać z bazy danych i z jakich tabel.

**Instrukcja SELECT:**

* Określa, jakie kolumny z tabeli chcemy pobrać.
* Może zawierać wyrażenia arytmetyczne, funkcje agregujące i inne operacje na danych.
* Wyrażenia te definiują, jakie dane mają zostać wyświetlone w wynikach zapytania.

Składnia instrukcji `SELECT` jest następująca:

```sql
SELECT kolumna1, kolumna2, ...
FROM tabela;
```

Przykład:

```sql
SELECT imie, nazwisko, email
FROM klienci;
```

Ten przykładowy kod SQL poleca wyświetlenie kolumn `imie`, `nazwisko` i `email` z tabeli `klienci`.

**Instrukcja FROM:**

* Określa tabelę, z której chcemy pobrać dane.
* Może zawierać wiele tabel połączonych różnymi klauzulami łączenia.
* Określa źródło danych, z których pobierane są kolumny wybrane w instrukcji `SELECT`.

Składnia instrukcji `FROM` jest następująca:

```sql
FROM tabela1 [JOIN tabela2 ON warunki_łączenia]
```

Przykład:

```sql
SELECT o.id_zamówienia, o.data_zamówienia, o.kwota_zamówienia, k.imie, k.nazwisko
FROM zamówienia o
JOIN klienci k ON o.id_klienta = k.id_klienta;
```

Ten przykładowy kod SQL łączy tabele `zamówienia` i `klienci` na podstawie kolumny `id_klienta`. Następnie wybiera kolumny `id_zamówienia`, `data_zamówienia`, `kwota_zamówienia`, `imie` i `nazwisko` z połączonych tabel.

Instrukcje `SELECT` i `FROM` stanowią podstawę tworzenia zapytań SQL. Pozwalają na pobieranie danych z określonych kolumn i tabel, co jest niezbędne do analizy i przetwarzania informacji w bazach danych.

Dodatkowo, w instrukcjach `SELECT` i `FROM` można stosować różne filtry i warunki, aby zawęzić wyniki zapytania do określonych wierszy lub rekordów. Możliwe jest również sortowanie wyników, grupowanie danych i agregowanie wartości za pomocą funkcji agregujących.

:bulb: W przypadku słów kluczowych w SQL wielkość liter nie ma znaczenia, warto pisać je wielkimi literami ze wzgkędu na lepszą czytelność.

