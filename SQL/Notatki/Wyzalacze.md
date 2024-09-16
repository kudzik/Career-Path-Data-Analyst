# Wyzwalacze ćwiczenia

**Ćwiczenie 1: Rejestrowanie zmian w tabeli**

1. **Utwórz tabelę `Pracownicy`:**

   ```sql
   CREATE TABLE Pracownicy (
       id_pracownika INTEGER PRIMARY KEY AUTOINCREMENT,
       imie VARCHAR(50) NOT NULL,
       nazwisko VARCHAR(50) NOT NULL,
       stanowisko VARCHAR(100),
       wynagrodzenie DECIMAL(10, 2)
   );
   ```

2. **Utwórz tabelę `Log_Zmian`:**

   ```sql
   CREATE TABLE Log_Zmian (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       tabela VARCHAR(50) NOT NULL,
       operacja VARCHAR(10) NOT NULL,
       stara_wartosc TEXT,
       nowa_wartosc TEXT,
       data_zmiany TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

3. **Utwórz wyzwalacz `log_insert`:**

   ```sql
   CREATE TRIGGER log_insert
   AFTER INSERT ON Pracownicy
   FOR EACH ROW
   BEGIN
       INSERT INTO Log_Zmian (tabela, operacja, nowa_wartosc)
       VALUES ('Pracownicy', 'INSERT', 'Nowy pracownik: ' || NEW.imie || ' ' || NEW.nazwisko);
   END;
   ```

4. **Utwórz wyzwalacz `log_update`:**

   ```sql
   CREATE TRIGGER log_update
   AFTER UPDATE ON Pracownicy
   FOR EACH ROW
   BEGIN
       INSERT INTO Log_Zmian (tabela, operacja, stara_wartosc, nowa_wartosc)
       VALUES ('Pracownicy', 'UPDATE', 
               'Stary pracownik: ' || OLD.imie || ' ' || OLD.nazwisko || ', stanowisko: ' || OLD.stanowisko || ', wynagrodzenie: ' || OLD.wynagrodzenie,
               'Nowy pracownik: ' || NEW.imie || ' ' || NEW.nazwisko || ', stanowisko: ' || NEW.stanowisko || ', wynagrodzenie: ' || NEW.wynagrodzenie);
   END;
   ```

5. **Utwórz wyzwalacz `log_delete`:**

   ```sql
   CREATE TRIGGER log_delete
   AFTER DELETE ON Pracownicy
   FOR EACH ROW
   BEGIN
       INSERT INTO Log_Zmian (tabela, operacja, stara_wartosc)
       VALUES ('Pracownicy', 'DELETE', 'Usunięty pracownik: ' || OLD.imie || ' ' || OLD.nazwisko);
   END;
   ```

6. **Przetestuj wyzwalacze:**

   ```sql
   -- Dodaj nowego pracownika
   INSERT INTO Pracownicy (imie, nazwisko, stanowisko, wynagrodzenie)
   VALUES ('Adam', 'Mickiewicz', 'Programista', 5000.00);

   -- Zaktualizuj dane pracownika
   UPDATE Pracownicy
   SET stanowisko = 'Starszy programista', wynagrodzenie = 6000.00
   WHERE id_pracownika = 1;

   -- Usuń pracownika
   DELETE FROM Pracownicy
   WHERE id_pracownika = 1;

   -- Sprawdź logi zmian
   SELECT * FROM Log_Zmian;
   ```

**Wyjaśnienie:**

* Stworzyliśmy tabelę `Pracownicy` do przechowywania danych o pracownikach oraz tabelę `Log_Zmian` do rejestrowania zmian w tabeli `Pracownicy`.
* Utworzyliśmy trzy wyzwalacze: `log_insert`, `log_update` i `log_delete`, które będą rejestrować odpowiednio operacje wstawiania, aktualizacji i usuwania danych z tabeli `Pracownicy`.
* Przetestowaliśmy działanie wyzwalaczy, dodając, aktualizując i usuwając pracownika, a następnie sprawdziliśmy zawartość tabeli `Log_Zmian`, aby zobaczyć zarejestrowane zmiany.

**Podsumowanie**

W tym ćwiczeniu nauczyliśmy się, jak tworzyć wyzwalacze w SQLite i jak wykorzystywać je do rejestrowania zmian w tabeli. Wyzwalacze są potężnym narzędziem, które pozwala nam automatyzować zadania i zapewnić integralność danych w bazie danych.
