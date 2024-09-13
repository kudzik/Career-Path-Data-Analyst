# klucze Obce

**ON DELETE**

Klauzula `ON DELETE` określa, co powinno się stać z wierszami w tabeli zależnej (tej, która ma klucz obcy), gdy wiersz w tabeli głównej (tej, do której odwołuje się klucz obcy) zostanie usunięty.

Dostępne akcje to:

* **CASCADE:** Jeśli usuniemy wiersz z tabeli głównej, wszystkie wiersze w tabeli zależnej, które odwołują się do tego usuniętego wiersza, również zostaną usunięte. To tak, jakbyśmy usunęli książkę z biblioteki, a wszystkie wypożyczenia tej książki również zniknęły.
* **SET NULL:** Jeśli usuniemy wiersz z tabeli głównej, wszystkie wartości klucza obcego w tabeli zależnej, które odwołują się do tego usuniętego wiersza, zostaną ustawione na NULL. To tak, jakbyśmy usunęli książkę z biblioteki, a wszystkie wypożyczenia tej książki zostały oznaczone jako "brak książki".
* **RESTRICT:** Jeśli spróbujemy usunąć wiersz z tabeli głównej, a istnieją wiersze w tabeli zależnej, które się do niego odwołują, usunięcie zostanie zablokowane. To tak, jakbyśmy próbowali usunąć książkę z biblioteki, ale system nie pozwolił nam tego zrobić, ponieważ ktoś ją wypożyczył.
* **NO ACTION:** To domyślne zachowanie. Jeśli spróbujemy usunąć wiersz z tabeli głównej, a istnieją wiersze w tabeli zależnej, które się do niego odwołują, usunięcie zostanie zablokowane. Jest to podobne do `RESTRICT`.

**ON UPDATE**

Klauzula `ON UPDATE` określa, co powinno się stać z wierszami w tabeli zależnej, gdy wartość klucza głównego w tabeli głównej, do którego się odwołują, zostanie zaktualizowana.

Dostępne akcje są takie same jak dla `ON DELETE`:

* **CASCADE:** Jeśli zaktualizujemy wartość klucza głównego w tabeli głównej, wszystkie wartości klucza obcego w tabeli zależnej, które odwołują się do tego zaktualizowanego wiersza, również zostaną zaktualizowane.
* **SET NULL:** Jeśli zaktualizujemy wartość klucza głównego w tabeli głównej, wszystkie wartości klucza obcego w tabeli zależnej, które odwołują się do tego zaktualizowanego wiersza, zostaną ustawione na NULL.
* **RESTRICT:** Jeśli spróbujemy zaktualizować wartość klucza głównego w tabeli głównej, a istnieją wiersze w tabeli zależnej, które się do niego odwołują, aktualizacja zostanie zablokowana.
* **NO ACTION:** To domyślne zachowanie. Jeśli spróbujemy zaktualizować wartość klucza głównego w tabeli głównej, a istnieją wiersze w tabeli zależnej, które się do niego odwołują, aktualizacja zostanie zablokowana. Jest to podobne do `RESTRICT`.

**Przykład**

```sql
CREATE TABLE Wypozyczenia (
    id_wypozyczenia INTEGER PRIMARY KEY AUTOINCREMENT,
    id_ksiazki INTEGER,
    id_czytelnika INTEGER,
    data_wypozyczenia DATE,
    FOREIGN KEY (id_ksiazki) REFERENCES Ksiazki(id_ksiazki) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_czytelnika) REFERENCES Czytelnicy(id_czytelnika) ON DELETE SET NULL ON UPDATE CASCADE
);
```

W tym przykładzie:

* Jeśli usuniemy książkę z tabeli `Ksiazki`, wszystkie wypożyczenia tej książki w tabeli `Wypozyczenia` również zostaną usunięte (`ON DELETE CASCADE`).
* Jeśli zaktualizujemy numer identyfikacyjny książki w tabeli `Ksiazki`, wszystkie wypożyczenia tej książki w tabeli `Wypozyczenia` również zostaną zaktualizowane (`ON UPDATE CASCADE`).
* Jeśli usuniemy czytelnika z tabeli `Czytelnicy`, wszystkie jego wypożyczenia w tabeli `Wypozyczenia` będą miały wartość `id_czytelnika` ustawioną na NULL (`ON DELETE SET NULL`).
* Jeśli zaktualizujemy numer identyfikacyjny czytelnika w tabeli `Czytelnicy`, wszystkie jego wypożyczenia w tabeli `Wypozyczenia` również zostaną zaktualizowane (`ON UPDATE CASCADE`).

Masz jakieś pytania dotyczące `ON DELETE` i `ON UPDATE` lub chciałbyś zrobić jakieś ćwiczenie, żeby lepiej zrozumieć te klauzule?
