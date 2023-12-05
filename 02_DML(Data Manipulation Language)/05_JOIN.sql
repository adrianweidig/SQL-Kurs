-- Gute Veranschaulichungsgrafik: https://www.w3schools.com/sql/sql_join.asp

-- 1. (INNER) JOIN
-- Zeigt alle Zeilen der SELECT Auswahl an, welche in beiden Tabellen der ON Bedingung entsprechen
-- Zeigt in diesem Fall also die Zeilen NICHT an, welche nicht der ON Bedingung entsprechen
SELECT mitarbeiter.Name, mitarbeiteraufgaben.Aufgabennummer FROM mitarbeiter JOIN mitarbeiteraufgaben ON mitarbeiter.Mitarbeiternummer = mitarbeiteraufgaben.Mitarbeiternummer;

-- 2. NATURAL JOIN
-- Zeigt alle Zeilen der SELECT Auswahl an, welche gemeinsame Werte in gleichen Spalten beider Tabellen haben
-- Zeigt in diesem Fall das gleiche an wie das Beispiel von 1.
SELECT mitarbeiter.Name, mitarbeiteraufgaben.Aufgabennummer FROM mitarbeiter NATURAL JOIN mitarbeiteraufgaben;

-- 3. LEFT (OUTER) JOIN
-- Zeigt ALLE Zeilen der linken Tabelle an, auch wenn diese nicht der ON Bedingung entsprechen,
-- füllt diese ggf. mit NULL auf,
-- aber zeigt nur die Zeilen der rechten Tabelle, welche der ON Bedingung entsprechen
SELECT mitarbeiter.*, mitarbeiteraufgaben.Istverteilungsbetrag FROM mitarbeiter LEFT JOIN mitarbeiteraufgaben ON mitarbeiter.Mitarbeiternummer = mitarbeiteraufgaben.Mitarbeiternummer;

-- 4. RIGHT (OUTER) JOIN
-- Macht das selbe wie LEFT JOIN nur in die andere Richtung
-- Hier würden also die Werte, welche zwar in Mitarbeiter sind,
-- jedoch NICHT in mitarbeiteraufgaben auch nicht angezeigt werden
SELECT mitarbeiter.*, mitarbeiteraufgaben.Istverteilungsbetrag FROM mitarbeiter RIGHT JOIN mitarbeiteraufgaben ON mitarbeiter.Mitarbeiternummer = mitarbeiteraufgaben.Mitarbeiternummer;