# Wizualizacje w usłudze Power BI

## Fragmentatory w Power BI

### Co to są fragmentatory?

**Fragmentatory** (ang. Slicers) to interaktywne elementy wizualne w Power BI, które umożliwiają użytkownikom dynamiczne filtrowanie danych prezentowanych w raportach. Działają one jako filtry, pozwalając na wyświetlanie tylko tych danych, które spełniają określone kryteria wybrane przez użytkownika.

Fragmentatory są bardzo przydatne do tworzenia bardziej interaktywnych i przejrzystych raportów, ponieważ pozwalają użytkownikom na łatwe zmienianie widoku danych bez potrzeby edytowania samego raportu.

### Do czego są używane fragmentatory?

Fragmentatory są używane do:

1. **Filtrowania danych w raportach**:
   - Umożliwiają użytkownikom wybieranie i wyświetlanie tylko tych danych, które ich interesują.

2. **Ułatwiania nawigacji po danych**:
   - Dzięki fragmentatorom użytkownicy mogą szybko poruszać się po różnych aspektach danych, takich jak okresy czasu, kategorie produktów, regiony geograficzne itp.

3. **Zwiększania interaktywności raportów**:
   - Fragmentatory sprawiają, że raporty są bardziej interaktywne i responsywne na działania użytkowników.

4. **Tworzenia dynamicznych analiz**:
   - Użytkownicy mogą analizować dane na różne sposoby, wybierając różne kryteria filtracji.

### Typy fragmentatorów

Power BI oferuje różne typy fragmentatorów, aby spełnić różne potrzeby filtrowania:

1. **Fragmentatory listy**:
   - Wyświetlają listę wartości do wyboru. Użytkownicy mogą wybierać pojedyncze wartości lub wiele wartości jednocześnie.
   - **Przykład**: Fragmentator z listą regionów geograficznych.

2. **Fragmentatory daty**:
   - Specjalne fragmentatory do filtrowania danych na podstawie zakresu dat. Umożliwiają wybieranie pojedynczych dni, miesięcy, lat lub zakresów dat.
   - **Przykład**: Fragmentator do wybierania zakresu dat dla danych sprzedaży.

3. **Fragmentatory liczby**:
   - Pozwalają na filtrowanie danych na podstawie zakresów liczbowych. Użytkownicy mogą określić minimalne i maksymalne wartości.
   - **Przykład**: Fragmentator do filtrowania danych na podstawie przedziału cenowego produktów.

4. **Fragmentatory hierarchii**:
   - Pozwalają na filtrowanie danych na różnych poziomach hierarchii, takich jak lata, kwartały, miesiące.
   - **Przykład**: Fragmentator, który umożliwia wybieranie lat, a następnie drill-down do kwartałów i miesięcy.

### Jak tworzyć fragmentatory w Power BI?

Tworzenie fragmentatora w Power BI jest proste i intuicyjne:

1. **Otwórz raport w Power BI Desktop**.
2. **Przejdź do strony raportu**, na której chcesz dodać fragmentator.
3. **Wybierz "Fragmentator"** z panelu wizualizacji.
4. **Przeciągnij kolumnę z tabeli** na obszar wartości fragmentatora (np. kolumnę z nazwami regionów, datami, produktami itp.).
5. **Dostosuj fragmentator**:
   - Użyj panelu właściwości, aby dostosować wygląd fragmentatora (np. rozmiar, kolory, styl czcionki).
   - Możesz także skonfigurować, czy użytkownik może wybierać wiele wartości jednocześnie, czy tylko jedną (opcje "Single Select" i "Multi Select").

### Przykład praktyczny

Załóżmy, że masz raport sprzedaży i chcesz dodać fragmentator, który pozwoli filtrować dane według kategorii produktów.

1. **Dodanie fragmentatora**:
   - Otwórz swój raport sprzedaży w Power BI Desktop.
   - Na wybranej stronie raportu kliknij ikonę fragmentatora w panelu wizualizacji.
   - Przeciągnij kolumnę "Kategoria Produktu" z tabeli "Produkty" na obszar wartości fragmentatora.

2. **Dostosowanie fragmentatora**:
   - W panelu właściwości możesz dostosować wygląd fragmentatora, np. zmieniając styl czcionki, kolory, rozmiar.
   - Ustaw, czy użytkownicy mogą wybierać jedną wartość (Single Select) czy wiele wartości (Multi Select).

3. **Interaktywne filtrowanie**:
   - Użytkownicy mogą teraz używać fragmentatora do filtrowania danych sprzedaży według kategorii produktów. Na przykład, mogą wybrać kategorię "Elektronika", aby zobaczyć tylko dane dotyczące sprzedaży produktów elektronicznych.

### Przykład bardziej zaawansowany

Załóżmy, że chcesz dodać fragmentator zakresu dat, aby filtrować dane sprzedaży według przedziału czasowego.

1. **Dodanie fragmentatora daty**:
   - Otwórz swój raport sprzedaży w Power BI Desktop.
   - Na wybranej stronie raportu kliknij ikonę fragmentatora w panelu wizualizacji.
   - Przeciągnij kolumnę "Data" z tabeli "Sprzedaż" na obszar wartości fragmentatora.

2. **Dostosowanie fragmentatora**:
   - W panelu właściwości możesz dostosować zakres dat (np. zakres kalendarza, suwak daty).
   - Ustaw, czy użytkownicy mogą wybierać pojedyncze daty, zakresy dat, czy obie opcje.

3. **Interaktywne filtrowanie**:
   - Użytkownicy mogą teraz używać fragmentatora daty do filtrowania danych sprzedaży według zakresu dat. Na przykład, mogą wybrać zakres od 1 stycznia 2023 do 31 grudnia 2023, aby zobaczyć dane sprzedaży za cały rok 2023.

### Zalety używania fragmentatorów

- **Interaktywność**: Użytkownicy mogą łatwo dostosować widok danych w raportach.
- **Przejrzystość**: Fragmentatory pomagają skupić się na istotnych danych, eliminując zbędne informacje.
- **Elastyczność**: Możliwość szybkiej zmiany kryteriów filtrowania danych bez konieczności edytowania raportu.
- **Łatwość użycia**: Intuicyjne interfejsy, które nie wymagają zaawansowanej wiedzy technicznej od użytkowników końcowych.

## Wizualizacje mapy w Power BI

### Co to są wizualizacje mapy?

Wizualizacje mapy w Power BI pozwalają na przedstawianie danych geograficznych w formie graficznej na mapie. Umożliwiają one wizualizację informacji takich jak sprzedaż w różnych regionach, rozmieszczenie klientów, wydajność w poszczególnych lokalizacjach, itp. Mapa jest interaktywnym narzędziem, które pozwala użytkownikom na szybkie zrozumienie przestrzennych wzorców i trendów w danych.

### Typy wizualizacji mapy w Power BI

Power BI oferuje kilka typów wizualizacji mapy, które mogą być używane do różnych celów:

1. **Mapa bąbelkowa (Bubble Map)**:
   - Przedstawia dane w postaci bąbelków na mapie, gdzie pozycja bąbelka wskazuje lokalizację geograficzną, a wielkość i kolor bąbelka mogą reprezentować wartości liczbowej.

2. **Mapa wypełnienia (Filled Map)**:
   - Pokazuje dane w postaci kolorowych obszarów na mapie. Każdy obszar (np. kraj, stan, województwo) jest wypełniony kolorem, który reprezentuje wartość liczbową.

3. **Mapa ArcGIS**:
   - Zaawansowana wizualizacja mapy, która korzysta z technologii ArcGIS od Esri. Pozwala na bardziej szczegółowe i zaawansowane analizy geograficzne.

4. **Mapa kształtów (Shape Map)**:
   - Pozwala na wyświetlanie danych na niestandardowych kształtach, które mogą reprezentować różne regiony. Umożliwia importowanie niestandardowych map kształtów.

5. **Mapa Azure Maps**:
   - Umożliwia wykorzystanie usług mapowych Microsoft Azure do zaawansowanych analiz przestrzennych.

### Jak tworzyć wizualizacje mapy w Power BI?

Tworzenie wizualizacji mapy w Power BI jest procesem prostym i intuicyjnym:

1. **Dodanie wizualizacji mapy**:
   - Otwórz raport w Power BI Desktop.
   - Przejdź do strony raportu, na której chcesz dodać wizualizację mapy.
   - Kliknij ikonę mapy w panelu wizualizacji (np. mapa bąbelkowa lub mapa wypełnienia).

2. **Dodanie danych do wizualizacji mapy**:
   - Przeciągnij kolumny z danymi geograficznymi (np. kraj, stan, miasto, współrzędne) do odpowiednich pól wizualizacji mapy (np. **Location**, **Latitude**, **Longitude**).
   - Dodaj dane, które mają być reprezentowane na mapie (np. wartości sprzedaży, liczba klientów) do pola **Values**.

3. **Dostosowanie wizualizacji**:
   - Skonfiguruj dodatkowe ustawienia wizualizacji mapy, takie jak kolor, rozmiar bąbelków, legendę, etykiety, itp.
   - Użyj panelu formatowania, aby dostosować wygląd mapy do swoich potrzeb.

### Przykłady zastosowania wizualizacji mapy

1. **Analiza sprzedaży według regionów**:
   - Użyj mapy bąbelkowej, aby pokazać sprzedaż w różnych miastach. Wielkość bąbelków może reprezentować wartość sprzedaży w danym mieście.

2. **Rozmieszczenie klientów**:
   - Użyj mapy wypełnienia, aby pokazać, w jakich regionach znajduje się najwięcej klientów. Kolor obszarów może reprezentować liczbę klientów w danym regionie.

3. **Analiza demograficzna**:
   - Użyj mapy kształtów, aby przedstawić dane demograficzne, takie jak gęstość zaludnienia, na niestandardowych kształtach mapy.

### Przykład praktyczny

Załóżmy, że masz dane sprzedaży według miast i chcesz stworzyć wizualizację mapy bąbelkowej, która pokazuje sprzedaż w różnych miastach.

1. **Dodanie wizualizacji mapy bąbelkowej**:
   - Otwórz raport sprzedaży w Power BI Desktop.
   - Kliknij ikonę mapy bąbelkowej w panelu wizualizacji.
   - Przeciągnij kolumnę "Miasto" do pola **Location**.
   - Przeciągnij kolumnę "Sprzedaż" do pola **Values**.

2. **Dostosowanie wizualizacji**:
   - Skonfiguruj rozmiar bąbelków, aby reprezentował wartości sprzedaży. Większe bąbelki będą reprezentować wyższą sprzedaż.
   - Użyj panelu formatowania, aby dostosować kolory bąbelków i dodać etykiety z nazwami miast i wartościami sprzedaży.

3. **Analiza interaktywna**:
   - Użytkownicy mogą teraz klikać na bąbelki, aby zobaczyć szczegóły sprzedaży w poszczególnych miastach, oraz używać fragmentatorów, aby filtrować dane według innych kryteriów (np. kategoria produktów, okres czasu).

## Zalety używania wizualizacji mapy

- **Przejrzystość**: Wizualizacje mapy umożliwiają szybkie zrozumienie przestrzennych wzorców i trendów.
- **Interaktywność**: Użytkownicy mogą interaktywnie eksplorować dane geograficzne, co zwiększa zaangażowanie i umożliwia lepszą analizę.
- **Komunikacja**: Mapa jest intuicyjnym narzędziem, które skutecznie komunikuje informacje przestrzenne nawet osobom bez specjalistycznej wiedzy technicznej.

Wizualizacje mapy w Power BI są potężnym narzędziem do analizy danych geograficznych, pozwalającym na tworzenie bardziej intuicyjnych, interaktywnych i informacyjnych raportów.
