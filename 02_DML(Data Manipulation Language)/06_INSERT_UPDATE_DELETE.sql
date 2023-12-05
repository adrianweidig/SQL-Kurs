-- 1. INSERT
-- INSERT INTO .... VALUES
-- Erzeugt IN(TO) eine neue Zeile mit den angegebenen Werten und befüllt den Rest mit den zugehörigen DEFAULT oder NULL-Werten
INSERT INTO mitarbeiter (Mitarbeiternummer, Lebensalter) VALUES ('B001', 10);

-- Erzeugt eine neue Zeile und richtet sich nach der Struktur ohne explizite Angabe.
-- Es müssen dann aber auch alle Spalten befüllt werden.
INSERT INTO mitarbeiter VALUES ('C001','Hugo','Heinz','Arnschwang',12,'Schüler',01526);

-- Wählt anhand der SELECT Anweisung eine komplette Spalte mit Werten aus.
-- Fügt dann für jede Zeile dieser Spalte diese in die ausgewählte Spalte
-- unter INERT INTO ... (ausgewählte Spalte) ein. Beachte, dass wenn die Spalte
-- ein PRIMARY KEY ist, dass die Einzigartigkeit erhalten bleibt und Spalten,
-- welche NOT NULL deklariert sind ebenfalls ausgefüllt werden.
INSERT INTO mitarbeiter (Mitarbeiternummer)
SELECT mitarbeiteraufgaben.Mitarbeiternummer
FROM mitarbeiteraufgaben
GROUP BY mitarbeiteraufgaben.Mitarbeiternummer;

-- 2. UPDATE

-- 3. DELETE