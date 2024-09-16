# Wyzwalacze

## Czym są wyzwalacze i dlaczego są ważne?

Wyzwalacze (ang. triggers) to specjalne procedury składowane w bazie danych, które są automatycznie uruchamiane w odpowiedzi na określone zdarzenia, takie jak wstawianie nowych danych (`INSERT`), aktualizacja istniejących danych (`UPDATE`) lub usuwanie danych (`DELETE`). Można je porównać do czujnych strażników, którzy obserwują Twoją bazę danych i reagują na wszelkie zmiany, wykonując określone akcje.

**Po co nam wyzwalacze?**

Wyzwalacze są niezwykle przydatne, ponieważ pozwalają nam:

* **Zapewnić integralność danych:** Możemy użyć wyzwalaczy, aby sprawdzić, czy dane spełniają określone warunki przed ich wstawieniem, aktualizacją lub usunięciem. Na przykład, możemy sprawdzić, czy wiek klienta jest większy niż 18 lat przed dodaniem go do bazy danych.
* **Automatyzować zadania:** Wyzwalacze mogą wykonywać różne akcje automatycznie, oszczędzając nam czas i wysiłek. Na przykład, po dodaniu nowego zamówienia, wyzwalacz może automatycznie zaktualizować stan magazynowy produktów.
* **Kontrolować dostęp do danych:** Wyzwalacze mogą być używane do sprawdzania uprawnień użytkowników i blokowania operacji, które naruszają zasady bezpieczeństwa. Na przykład, możemy uniemożliwić usuwanie danych z tabeli, jeśli użytkownik nie ma odpowiednich uprawnień.
* **Audytować zmiany:** Wyzwalacze mogą rejestrować wszystkie zmiany w bazie danych, co jest przydatne do śledzenia historii danych i wykrywania potencjalnych problemów.

**Zdarzenia wyzwalające**

Wyzwalacze w SQLite mogą być uruchamiane w odpowiedzi na trzy podstawowe zdarzenia:

* `INSERT`: Gdy nowy wiersz jest wstawiany do tabeli.
* `UPDATE`: Gdy istniejący wiersz w tabeli jest modyfikowany.
* `DELETE`: Gdy wiersz jest usuwany z tabeli.

**Czasy wykonania wyzwalaczy**

Wyzwalacze mogą być wykonywane w trzech różnych momentach:

* `BEFORE`: Przed wykonaniem operacji `INSERT`, `UPDATE` lub `DELETE`. To pozwala nam na sprawdzenie danych i ewentualne zablokowanie operacji, jeśli dane nie spełniają określonych warunków.
* `AFTER`: Po wykonaniu operacji `INSERT`, `UPDATE` lub `DELETE`. To pozwala nam na wykonanie dodatkowych akcji po zmianie danych, takich jak aktualizacja innych tabel lub wysłanie powiadomienia.
* `INSTEAD OF`: Zamiast wykonania operacji `INSERT`, `UPDATE` lub `DELETE` na widoku. To pozwala nam na zdefiniowanie własnej logiki dla operacji na widokach, które często nie obsługują bezpośrednio tych operacji.

## Tworzenia wyzwalaczy

**Składnia `CREATE TRIGGER`**

Podstawowa składnia instrukcji `CREATE TRIGGER` wygląda następująco:

```sql
CREATE TRIGGER nazwa_wyzwalacza
[BEFORE | AFTER | INSTEAD OF] [INSERT | UPDATE | DELETE]
ON nazwa_tabeli
[FOR EACH ROW]
BEGIN
    -- kod SQL do wykonania
END;
```

* `nazwa_wyzwalacza`: Unikalna nazwa, którą nadajemy naszemu wyzwalaczowi.
* `BEFORE | AFTER | INSTEAD OF`: Określa, kiedy wyzwalacz ma zostać wykonany: przed (`BEFORE`), po (`AFTER`) lub zamiast (`INSTEAD OF`) operacji na tabeli.
* `INSERT | UPDATE | DELETE`: Określa, jakie zdarzenie ma wywołać wyzwalacz: wstawienie nowego wiersza (`INSERT`), aktualizacja istniejącego wiersza (`UPDATE`) lub usunięcie wiersza (`DELETE`).
* `ON nazwa_tabeli`: Nazwa tabeli, na której ma działać wyzwalacz.
* `FOR EACH ROW`: Opcjonalna klauzula, która określa, że wyzwalacz ma być wykonany dla każdego zmodyfikowanego wiersza. Jeśli pominiemy tę klauzulę, wyzwalacz zostanie wykonany tylko raz dla całej operacji, niezależnie od liczby zmodyfikowanych wierszy.
* `BEGIN ... END`: Blok kodu SQL, który ma być wykonany przez wyzwalacz.

**Przykład**

Załóżmy, że mamy tabelę `Produkty` i chcemy utworzyć wyzwalacz, który będzie automatycznie aktualizował kolumnę `ostatnia_aktualizacja` za każdym razem, gdy wiersz w tej tabeli zostanie zaktualizowany. Oto jak to zrobić:

```sql
CREATE TRIGGER aktualizuj_date_ostatniej_aktualizacji
AFTER UPDATE ON Produkty
FOR EACH ROW
BEGIN
    UPDATE Produkty
    SET ostatnia_aktualizacja = CURRENT_TIMESTAMP
    WHERE id = NEW.id;
END;
```

W tym przykładzie:

* `aktualizuj_date_ostatniej_aktualizacji` to nazwa naszego wyzwalacza.
* `AFTER UPDATE ON Produkty` oznacza, że wyzwalacz zostanie wykonany po każdej aktualizacji wiersza w tabeli `Produkty`.
* `FOR EACH ROW` oznacza, że wyzwalacz zostanie wykonany dla każdego zaktualizowanego wiersza.
* Blok kodu SQL `BEGIN ... END` zawiera instrukcję `UPDATE`, która aktualizuje kolumnę `ostatnia_aktualizacja` na bieżący czas (`CURRENT_TIMESTAMP`) dla wiersza, który został właśnie zaktualizowany. Zauważ, że używamy tutaj specjalnej zmiennej `NEW.id`, aby odwołać się do wartości klucza głównego zaktualizowanego wiersza.

**Podsumowanie**

Tworzenie wyzwalaczy w SQLite to proces definiowania specjalnych procedur, które są automatycznie wykonywane w odpowiedzi na określone zdarzenia w bazie danych. Dzięki nim możemy zapewnić integralność danych, automatyzować zadania i kontrolować dostęp do danych.

## Dostęp do danych w wyzwalaczach

W SQLite mamy dwa specjalne słowa kluczowe, które umożliwiają nam odwoływanie się do danych w wyzwalaczach: `OLD` i `NEW`. Działają one jak magiczne lupy, pozwalające nam zajrzeć do danych przed i po zmianie.

* **`OLD`:** To słowo kluczowe odnosi się do wartości wiersza **przed** wykonaniem operacji, która wywołała wyzwalacz. Możemy je porównać do zdjęcia z przeszłości, które pokazuje, jak wyglądał wiersz przed zmianą.
* **`NEW`:** To słowo kluczowe odnosi się do wartości wiersza **po** wykonaniu operacji, która wywołała wyzwalacz. Możemy je porównać do zdjęcia z teraźniejszości, które pokazuje, jak wiersz wygląda teraz.

**Jak to działa?**

Załóżmy, że mamy tabelę `Pracownicy` i chcemy utworzyć wyzwalacz, który będzie rejestrował zmiany wynagrodzenia pracowników. Oto jak możemy to zrobić:

```sql
CREATE TRIGGER log_zmian_wynagrodzenia
AFTER UPDATE ON Pracownicy
FOR EACH ROW
WHEN NEW.wynagrodzenie <> OLD.wynagrodzenie -- Wyzwalacz zadziała tylko wtedy, gdy wynagrodzenie się zmieniło
BEGIN
    INSERT INTO Historia_Wynagrodzen (id_pracownika, stare_wynagrodzenie, nowe_wynagrodzenie, data_zmiany)
    VALUES (OLD.id_pracownika, OLD.wynagrodzenie, NEW.wynagrodzenie, CURRENT_TIMESTAMP);
END;
```

W tym przykładzie:

* `OLD.id_pracownika` i `OLD.wynagrodzenie` odnoszą się do identyfikatora pracownika i jego starego wynagrodzenia przed aktualizacją.
* `NEW.wynagrodzenie` odnosi się do nowego wynagrodzenia pracownika po aktualizacji.
* `CURRENT_TIMESTAMP` to funkcja, która zwraca aktualny czas.

Dzięki słowom kluczowym `OLD` i `NEW` możemy łatwo śledzić zmiany w danych i rejestrować je w tabeli historii.

**Ważne uwagi:**

* Słowa kluczowe `OLD` i `NEW` są dostępne tylko w wyzwalaczach typu `FOR EACH ROW`.
* `OLD` jest dostępne tylko w wyzwalaczach `UPDATE` i `DELETE`.
* `NEW` jest dostępne tylko w wyzwalaczach `INSERT` i `UPDATE`.

## Modyfikacja i usuwanie wyzwalaczy

**Modyfikacja wyzwalaczy**

W SQLite nie ma bezpośredniej instrukcji do modyfikacji istniejących wyzwalaczy. Aby zmienić wyzwalacz, musimy go najpierw usunąć, a następnie utworzyć nowy wyzwalacz o tej samej nazwie, ale z zaktualizowaną definicją.

**Usuwanie wyzwalaczy**

Aby usunąć wyzwalacz, używamy instrukcji `DROP TRIGGER`:

```sql
DROP TRIGGER [IF EXISTS] nazwa_wyzwalacza;
```

* `IF EXISTS`: Opcjonalna klauzula, która zapobiega błędowi, jeśli wyzwalacz o podanej nazwie nie istnieje.

**Przykład**

Załóżmy, że chcemy zmienić wyzwalacz `aktualizuj_date_ostatniej_aktualizacji`, który utworzyliśmy wcześniej, tak aby aktualizował również kolumnę `ostatnia_modyfikacja_przez` na nazwę użytkownika, który wprowadził zmianę. Oto jak to zrobić:

```sql
-- Usuwamy stary wyzwalacz
DROP TRIGGER IF EXISTS aktualizuj_date_ostatniej_aktualizacji;

-- Tworzymy nowy wyzwalacz z zaktualizowaną definicją
CREATE TRIGGER aktualizuj_date_ostatniej_aktualizacji
AFTER UPDATE ON Produkty
FOR EACH ROW
BEGIN
    UPDATE Produkty
    SET ostatnia_aktualizacja = CURRENT_TIMESTAMP,
        ostatnia_modyfikacja_przez = 'nazwa_użytkownika' -- Zakładamy, że mamy dostęp do nazwy użytkownika
    WHERE id = NEW.id;
END;
```

W tym przykładzie:

1. Usuwamy stary wyzwalacz `aktualizuj_date_ostatniej_aktualizacji`, jeśli istnieje.
2. Tworzymy nowy wyzwalacz o tej samej nazwie, ale z dodatkową aktualizacją kolumny `ostatnia_modyfikacja_przez`.

**Podsumowanie**

Modyfikacja i usuwanie wyzwalaczy w SQLite są prostymi operacjami, które pozwalają nam dostosowywać zachowanie bazy danych do zmieniających się potrzeb. Pamiętaj jednak, że usuwanie wyzwalaczy jest nieodwracalne, dlatego zawsze warto zrobić kopię zapasową bazy danych przed wprowadzeniem zmian.
