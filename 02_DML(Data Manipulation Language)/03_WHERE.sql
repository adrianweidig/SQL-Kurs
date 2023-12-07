-- NUTZEN DER DATENBANK UND TABELLE AUS 00_DatenbankUndTabellen.sql

-- -------------------------------
-- WHERE Klausel

-- Beispiele ohne Aggregatfunktionen

-- 1. SELECT mit WHERE-Klausel - Zeigt die Mitarbeiter an, die in Berlin arbeiten
SELECT *
FROM Mitarbeiter
WHERE Ort = 'Berlin';

-- 2. SELECT mit ORDER BY - Zeigt die Mitarbeiter in absteigender Reihenfolge des Lebensalters an
SELECT *
FROM Mitarbeiter
ORDER BY Lebensalter DESC;

-- 3. SELECT mit LIMIT - Zeigt die ersten zwei Mitarbeiter an
SELECT *
FROM Mitarbeiter
LIMIT 2;

-- 4. SELECT in Verbindung mit anderen Unterfunktionen
-- Hier wird zuerst das rechte SELECT ausgewertet. Als Ergebnis wird hier nur ein Ort zurückgegeben.
-- Dieser zurückgegebene Ort wird dann in den Vergleich von Ort mit eingefügt.
SELECT Name
FROM Mitarbeiter
WHERE Ort = (SELECT ORT FROM Mitarbeiter WHERE Mitarbeiternummer = 'M002');

-- Beispiel: WHERE-Klauseln zu den Aggregatfunktionen

-- 1. COUNT mit WHERE-Klausel - Zählt die Anzahl der Mitarbeiter, die älter als 30 Jahre sind
SELECT COUNT(*)
FROM Mitarbeiter
WHERE Lebensalter > 30;

-- 2. SUM mit WHERE-Klausel - Summiert die Lebensalter der Mitarbeiter, die in Berlin arbeiten
SELECT SUM(Lebensalter)
FROM Mitarbeiter
WHERE Ort = 'Berlin';

-- 3. AVG mit WHERE-Klausel - Berechnet den Durchschnitt des Lebensalters der Manager
SELECT AVG(Lebensalter)
FROM Mitarbeiter
WHERE Beruf = 'Manager';

-- 4. MAX mit WHERE-Klausel - Findet das maximale Lebensalter der Mitarbeiter in München
SELECT MAX(Lebensalter)
FROM Mitarbeiter
WHERE Ort = 'München';

-- 5. MIN mit WHERE-Klausel - Findet das minimale Lebensalter der Entwickler
SELECT MIN(Lebensalter)
FROM Mitarbeiter
WHERE Beruf = 'Entwickler';

-- WHERE Klausel
-- -------------------------------
-- LIKE und BETWEEN

-- Wählt alle Mitarbeiter aus, welche im Namen ein M haben. (Nicht Case-Sensitive)
SELECT *
FROM Mitarbeiter
WHERE Name LIKE '%M%';

-- Wählt alle Mitarbeite aus, welche im Namen KEIN M enthalten. (Auch nicht Case-Sensitive)
SELECT *
FROM Mitarbeiter
WHERE Name NOT Like '%M%';

-- Kombination mehrerer Bedingungen (Wer hat ein M im Namen und ist Entwickler)
SELECT *
FROM Mitarbeiter
WHERE Name Like '%M%'
  AND Beruf = "Entwickler";

-- Between vergleicht die beiden Seiten und ist äquivalent zu x <= y AND y <= z
-- Wäht alle Mitarbeiter aus, welche zwischen 30 und 40 sind
SELECT *
FROM Mitarbeiter
WHERE Lebensalter BETWEEN 30 AND 40;
-- äquivalent zu:               x  <=    y        AND     y       <= z
SELECT *
FROM Mitarbeiter
WHERE 30 <= Lebensalter
  AND Lebensalter <= 40;

-- LIKE und BETWEEN
-- -------------------------------
-- IN und EXISTS und IS (NOT) NULL

-- Zeigt alle Mitarbeiter an, deren Orte zu den angegeben in Klammern passen (Listenabgleich)
SELECT *
FROM Mitarbeiter
WHERE Ort IN ('Berlin', 'München');

-- Zeigt ALLE Mitarbeiter an, wenn Mindestens ein Mitarbeiter mit M im Namen in der Tabelle existiert
SELECT *
FROM Mitarbeiter
WHERE EXISTS (SELECT * FROM Mitarbeiter WHERE Name Like '%M%');

-- Funktioniert nur, wenn NULL Werte überhaupt vorhanden / Nicht vorhanden sind
-- Zeigt alle Mitarbeiter an bei denen der Wert der Spalte Ort NICHT NULL ist.
SELECT *
FROM Mitarbeiter
WHERE Ort IS NOT NULL;

-- IN und EXISTS und IS (NOT) NULL
