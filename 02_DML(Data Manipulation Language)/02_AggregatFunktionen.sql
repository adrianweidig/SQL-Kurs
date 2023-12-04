-- Verfügbare Aggregatfunktionen:
/*
+-------------------+---------------------------------------------------------------+
| Schlüsselwort     | Funktionalität                                                |
+-------------------+---------------------------------------------------------------+
| COUNT             | Zählt die Anzahl der Zeilen in einer Ergebnismenge            |
| SUM               | Summiert die Werte einer Spalte                               |
| AVG               | Berechnet den Durchschnitt der Werte einer Spalte             |
| MAX               | Gibt den maximalen Wert in einer Spalte zurück                |
| MIN               | Gibt den minimalen Wert in einer Spalte zurück                |
| FIRST             | Gibt den ersten Wert in einer Gruppe zurück                   |
| LAST              | Gibt den letzten Wert in einer Gruppe zurück                  |
| GROUP_CONCAT      | Konkateniert Zeichenketten aus einer Gruppe                   |
| STDDEV            | Berechnet die Standardabweichung der Werte einer Spalte       |
| VARIANCE          | Berechnet die Varianz der Werte einer Spalte                  |
| UPPER             | Konvertiert einen String in Großbuchstaben                    |
| LOWER             | Konvertiert einen String in Kleinbuchstaben                   |
| LENGTH            | Gibt die Länge eines Strings zurück                           |
| TRIM              | Entfernt Leerzeichen oder andere Zeichen vom Anfang und Ende  |
| SUBSTRING         | Extrahiert einen Teil eines Strings                           |
| CURRENT_DATE      | Gibt das aktuelle Datum zurück                                |
| CURRENT_TIME      | Gibt die aktuelle Uhrzeit zurück                              |
| CURRENT_TIMESTAMP | Gibt das aktuelle Datum und die aktuelle Uhrzeit zurück       |
+-------------------+---------------------------------------------------------------+
*/

-- SELECT mit Aggregatfunktionen

-- 1. COUNT - Zählt die Anzahl der Zeilen in einer Ergebnismenge
SELECT COUNT(*) FROM Mitarbeiter;

-- 2. SUM - Summiert die Lebensalter aller Mitarbeiter
SELECT SUM(Lebensalter) FROM Mitarbeiter;

-- 3. AVG - Berechnet den Durchschnitt des Lebensalters aller Mitarbeiter
SELECT AVG(Lebensalter) FROM Mitarbeiter;

-- 4. MAX - Findet das maximale Lebensalter der Mitarbeiter
SELECT MAX(Lebensalter) FROM Mitarbeiter;

-- 5. MIN - Findet das minimale Lebensalter der Mitarbeiter
SELECT MIN(Lebensalter) FROM Mitarbeiter;

-- 6. FIRST - Zeigt den ersten Ort in der Tabelle Mitarbeiter an
SELECT FIRST(Ort) FROM Mitarbeiter;

-- 7. LAST - Zeigt den letzten Ort in der Tabelle Mitarbeiter an
SELECT LAST(Ort) FROM Mitarbeiter;

-- 8. GROUP_CONCAT - Konkateniert die Namen aller Mitarbeiter
SELECT GROUP_CONCAT(Name) FROM Mitarbeiter;

-- 9. STDDEV - Berechnet die Standardabweichung des Lebensalters der Mitarbeiter
SELECT STDDEV(Lebensalter) FROM Mitarbeiter;

-- 10. VARIANCE - Berechnet die Varianz des Lebensalters der Mitarbeiter
SELECT VARIANCE(Lebensalter) FROM Mitarbeiter;

-- 11. UPPER - Konvertiert die Berufe aller Mitarbeiter in Großbuchstaben
SELECT UPPER(Beruf) FROM Mitarbeiter;

-- 12. LOWER - Konvertiert die Orte aller Mitarbeiter in Kleinbuchstaben
SELECT LOWER(Ort) FROM Mitarbeiter;

-- 13. LENGTH - Gibt die Länge der Vornamen aller Mitarbeiter zurück
SELECT LENGTH(Vorname) FROM Mitarbeiter;

-- 14. TRIM - Entfernt Leerzeichen vom Anfang und Ende der Namen aller Mitarbeiter
SELECT TRIM(Name) FROM Mitarbeiter;

-- 15. SUBSTRING - Extrahiert die ersten drei Zeichen aus den Berufen aller Mitarbeiter
SELECT SUBSTRING(Beruf, 1, 3) FROM Mitarbeiter;

-- 16. CURRENT_DATE - Gibt das aktuelle Datum zurück
SELECT CURRENT_DATE;

-- 17. CURRENT_TIME - Gibt die aktuelle Uhrzeit zurück
SELECT CURRENT_TIME;

-- 18. CURRENT_TIMESTAMP - Gibt das aktuelle Datum und die aktuelle Uhrzeit zurück
SELECT CURRENT_TIMESTAMP;


-- Weitere Beispiele mit Kombination mehrerer Möglichkeiten:
-- Weitere Beispiele zu den ersten 5 Punkten (COUNT, SUM, AVG, MAX, MIN)

-- Beispiel 1: Kombination von COUNT und SUM
-- Zählt die Anzahl der Mitarbeiter und summiert ihre Telefonnummern
SELECT COUNT(*) AS AnzahlMitarbeiter, SUM(Telefonnummer) AS AnzahlTelefonnummern FROM Mitarbeiter;

