-- NUTZEN DER DATENBANK UND TABELLE AUS 00_DatenbankUndTabellen.sql
-- WHERE Klausel

-- Beispiele ohne Aggregatfunktionen

-- 1. SELECT mit WHERE-Klausel - Zeigt die Mitarbeiter an, die in Berlin arbeiten
SELECT * FROM Mitarbeiter WHERE Ort = 'Berlin';

-- 2. SELECT mit ORDER BY - Zeigt die Mitarbeiter in absteigender Reihenfolge des Lebensalters an
SELECT * FROM Mitarbeiter ORDER BY Lebensalter DESC;

-- 3. SELECT mit LIMIT - Zeigt die ersten zwei Mitarbeiter an
SELECT * FROM Mitarbeiter LIMIT 2;

-- 4. SELECT in Verbindung mit anderen Unterfunktionen
-- Hier wird zuerst das rechte SELECT ausgewertet. Als Ergebnis wird hier nur ein Ort zurückgegeben.
-- Dieser zurückgegebene Ort wird dann in den Vergleich von Ort mit eingefügt.
SELECT Name FROM Mitarbeiter WHERE Ort = (SELECT ORT FROM Mitarbeiter WHERE Mitarbeiternummer = 'M002');

-- Beispiel: WHERE-Klauseln zu den Aggregatfunktionen

-- 1. COUNT mit WHERE-Klausel - Zählt die Anzahl der Mitarbeiter, die älter als 30 Jahre sind
SELECT COUNT(*) FROM Mitarbeiter WHERE Lebensalter > 30;

-- 2. SUM mit WHERE-Klausel - Summiert die Lebensalter der Mitarbeiter, die in Berlin arbeiten
SELECT SUM(Lebensalter) FROM Mitarbeiter WHERE Ort = 'Berlin';

-- 3. AVG mit WHERE-Klausel - Berechnet den Durchschnitt des Lebensalters der Manager
SELECT AVG(Lebensalter) FROM Mitarbeiter WHERE Beruf = 'Manager';

-- 4. MAX mit WHERE-Klausel - Findet das maximale Lebensalter der Mitarbeiter in München
SELECT MAX(Lebensalter) FROM Mitarbeiter WHERE Ort = 'München';

-- 5. MIN mit WHERE-Klausel - Findet das minimale Lebensalter der Entwickler
SELECT MIN(Lebensalter) FROM Mitarbeiter WHERE Beruf = 'Entwickler';

