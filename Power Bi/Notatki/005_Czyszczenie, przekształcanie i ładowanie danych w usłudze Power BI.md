# Czyszczenie, przekształcanie i ładowanie danych w usłudze Power BI

## Znajdowanie Anomalii i Statystyk Danych w Power BI

### Znajdowanie Anomalii

**Anomalie** w danych to wartości lub zestawy wartości, które znacząco odbiegają od innych obserwacji w zbiorze danych. Znajdowanie anomalii jest kluczowe w analizie danych, ponieważ mogą one wskazywać na błędy, niespodziewane wydarzenia lub ważne odkrycia.

W Power BI istnieje kilka narzędzi i technik, które mogą pomóc w identyfikacji anomalii:

1. **Wizualizacje wykresów linii i kolumn**:
   - Wykresy liniowe i kolumnowe mogą być używane do wizualizacji trendów i identyfikacji punktów, które znacząco odbiegają od reszty danych. Anomalie często stają się widoczne jako nagłe skoki lub spadki.

2. **Analiza wartości odstających (outliers)**:
   - Można używać wykresów pudełkowych (box plots) do identyfikacji wartości odstających. Wartości odstające są danymi, które leżą poza typowym zakresem zmienności i mogą wskazywać na anomalie.

3. **Decomposition Tree (Drzewo dekompozycji)**:
   - To interaktywne narzędzie umożliwia analizę danych poprzez rozkładanie wartości na poszczególne czynniki. Można go używać do identyfikacji anomalii poprzez dokładne badanie wpływu różnych czynników na wyniki.

4. **AI Insights**:
   - Power BI oferuje funkcje AI, takie jak wykrywanie anomalii, które automatycznie analizują dane i identyfikują punkty, które są statystycznie odległe od innych. Można to zastosować do wykresów liniowych, aby automatycznie wykrywać anomalie.

#### Przykład: Wykrywanie Anomalii na Wykresie Liniowym

1. **Utwórz wykres liniowy**:
   - Przeciągnij odpowiednie pola do osi X i Y, aby stworzyć wykres liniowy. Na przykład, możesz użyć "Data" na osi X i "Sprzedaż" na osi Y.

2. **Zastosuj wykrywanie anomalii**:
   - Wybierz wykres liniowy, przejdź do panelu **Analytics** i dodaj **Find Anomalies**.
   - Power BI automatycznie wykryje i oznaczy anomalie na wykresie, zaznaczając je innym kolorem i dodając adnotacje z wyjaśnieniem.

### Statystyki Danych

Statystyki danych są niezbędne do zrozumienia i interpretacji danych. W Power BI można korzystać z różnych metod i narzędzi do obliczania i wizualizacji statystyk danych.

1. **Miary opisowe**:
   - **Średnia (Average)**: Średnia wartość zestawu danych.
   - **Mediana (Median)**: Środkowa wartość zestawu danych.
   - **Odchylenie standardowe (Standard Deviation)**: Miara rozproszenia danych wokół średniej.
   - **Suma (Sum)**: Suma wszystkich wartości w zestawie danych.
   - **Min i Max (Minimum and Maximum)**: Najniższa i najwyższa wartość w zestawie danych.

2. **Wizualizacje statystyczne**:
   - **Histogram**: Umożliwia wizualizację rozkładu danych.
   - **Box Plot (Wykres Pudełkowy)**: Przedstawia medianę, kwartyle i wartości odstające.
   - **Heat Map (Mapa Ciepła)**: Przedstawia gęstość danych lub ich rozkład w przestrzeni dwuwymiarowej.

3. **Miary DAX**:
   - Power BI pozwala na tworzenie niestandardowych miar przy użyciu DAX (Data Analysis Expressions). Można obliczać zaawansowane statystyki, takie jak współczynniki korelacji, średnie ruchome i inne.

#### Przykład: Obliczanie Średniej i Odchylenia Standardowego

1. **Obliczanie średniej**:
   - W Power BI Desktop, przejdź do zakładki **Modeling**.
   - Wybierz **New Measure** i wprowadź formułę DAX:

     ```DAX
     ŚredniaSprzedaż = AVERAGE('TabelaSprzedaży'[Sprzedaż])
     ```

2. **Obliczanie odchylenia standardowego**:
   - Utwórz nową miarę i wprowadź formułę DAX:

     ```DAX
     OdchylenieStandardoweSprzedaż = STDEV.P('TabelaSprzedaży'[Sprzedaż])
     ```

3. **Wizualizacja statystyk**:
   - Dodaj obie miary do wizualizacji, na przykład do karty lub wykresu kolumnowego, aby przedstawić średnią i odchylenie standardowe sprzedaży.

### Zalety znajdowania anomalii i statystyk danych

- **Identyfikacja problemów**: Szybkie wykrywanie nieprawidłowości i błędów w danych.
- **Zrozumienie trendów**: Lepsze zrozumienie trendów i wzorców w danych.
- **Podejmowanie decyzji**: Lepsze podstawy do podejmowania decyzji biznesowych opartych na danych.
- **Optymalizacja**: Identyfikacja obszarów do optymalizacji i poprawy.

