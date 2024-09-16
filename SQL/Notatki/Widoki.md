# Widoki

**Czym są widoki?**

Widoki w SQL to wirtualne tabele, które są zdefiniowane na podstawie zapytań SELECT. Można je traktować jako zapisane zapytania, które możemy wielokrotnie wykorzystywać, odwołując się do nich po nazwie, tak jakby były zwykłymi tabelami. Widoki nie przechowują fizycznie danych, ale za każdym razem, gdy odwołujemy się do widoku, baza danych wykonuje zapytanie, na którym jest oparty, i zwraca aktualne wyniki.

**Dlaczego widoki są ważne?**

Widoki mają wiele zalet, które czynią je cennym narzędziem w pracy z bazami danych:

* **Uproszczenie zapytań:** Widoki pozwalają nam ukryć złożoność zapytań SQL, szczególnie tych, które wymagają łączenia wielu tabel lub stosowania skomplikowanych warunków. Dzięki temu możemy odwoływać się do widoku po nazwie, zamiast za każdym razem pisać całe zapytanie.
* **Bezpieczeństwo danych:** Widoki pozwalają nam ograniczyć dostęp do danych, udostępniając użytkownikom tylko te kolumny i wiersze, które są dla nich istotne. Na przykład, możemy utworzyć widok, który pokazuje tylko imiona i nazwiska pracowników, ukrywając ich dane osobowe, takie jak adres czy numer telefonu.
* **Utrzymanie spójności:** Jeśli struktura bazowej tabeli ulegnie zmianie, widok automatycznie dostosuje się do tych zmian, zapewniając, że zawsze zwraca aktualne dane.

**Tworzenie widoków**

Widoki tworzymy za pomocą instrukcji `CREATE VIEW`. Oto podstawowa składnia:

```sql
CREATE VIEW nazwa_widoku AS
SELECT kolumna1, kolumna2, ...
FROM tabela
WHERE warunek;
```

* `nazwa_widoku`: Nazwa, pod którą będziemy odwoływać się do widoku.
* `SELECT kolumna1, kolumna2, ...`: Lista kolumn, które chcemy uwzględnić w widoku.
* `FROM tabela`: Tabela (lub tabele), z której (których) chcemy pobrać dane.
* `WHERE warunek`: Opcjonalna klauzula, która pozwala nam filtrować wiersze, które zostaną uwzględnione w widoku.

**Przykład**

Załóżmy, że mamy tabelę `Pracownicy` i chcemy utworzyć widok, który pokazuje tylko imiona i nazwiska pracowników z działu IT. Oto jak to zrobić:

```sql
CREATE VIEW PracownicyIT AS
SELECT imie, nazwisko
FROM Pracownicy
WHERE dział = 'IT';
```

Teraz możemy odwoływać się do tego widoku, tak jakby był zwykłą tabelą:

```sql
SELECT * FROM PracownicyIT;
```

To zapytanie zwróci tylko imiona i nazwiska pracowników z działu IT, nawet jeśli tabela `Pracownicy` zawiera inne kolumny, takie jak adres czy numer telefonu.

**Modyfikacja i usuwanie widoków**

Widoki możemy modyfikować za pomocą instrukcji `CREATE OR REPLACE VIEW`, a usuwać za pomocą instrukcji `DROP VIEW`.

**Podsumowanie**

Widoki to potężne narzędzie w SQL, które pozwala nam uprościć zapytania, zwiększyć bezpieczeństwo danych i utrzymać spójność informacji. Dzięki nim możemy tworzyć wirtualne tabele, które są dostosowane do naszych konkretnych potrzeb, bez konieczności fizycznego przechowywania danych.

**Czy masz jakieś pytania dotyczące widoków lub chciałbyś zobaczyć więcej przykładów ich zastosowania?**
