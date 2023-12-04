-- Wählt die Aufgabennummer und den Durchschnitt aller Werte von istverteilungsbetrag aus und gruppiert diese anhand der aufgabennummer.
-- Somit wird das AVG für jede aufgabennummer gruppiert. 

-- Ohne GROUP BY würde es nur eine Zeile anzeigen, da AVG() nur eine Zeile zurückgibt und bei AVG() dann den
-- Durchschnitt aller vorherigen Zeilen ausgeben. Die Werte stehen also tabellarisch dann nicht in Zusammenhang.

/* Tabelle:
Aufgabennummer, Mitarbeiternummer, Istverteilungsbetrag)
    ('01', 'A001', 0.8),
    ('02', 'A002', 0.6),
    ('01', 'C003', 0.9),
    ('03', 'A001', 0.5);
*/

-- OHNE GROUP BY:
-- aufgabennummer | AVG(istverteilungsbetrag)
-- 01             | 0.7
SELECT aufgabennummer, AVG(istverteilungsbetrag) FROM Mitarbeiteraufgaben;

-- MIT GROUP BY:
-- aufgabennummer | AVG(istverteilungsbetrag)
-- 01             | 0.85 (Durchschnitt aus 0.8 und 0.9)
-- 02             | 0.60 (Durchschnitt nur aus 0.6)
-- 03             | 0.50 (Durchschnitt nur aus 0.5)
SELECT aufgabennummer, AVG(istverteilungsbetrag) FROM Mitarbeiteraufgaben GROUP BY aufgabennummer;
