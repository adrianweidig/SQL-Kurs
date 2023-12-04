-- NUTZEN DER DATENBANK UND TABELLE AUS 00_DatenbankUndTabellen.sql
-- ------ SELECT -------------

-- Einfache Select Anweisung, welche einfach nur Spalten einer Tabelle auswählt
SELECT Mitarbeiternummer, Name FROM Mitarbeiter;

-- Wählt alle Informationen aus einer Tabelle aus
SELECT * FROM Mitarbeiteraufgaben;

-- Filtert die Auswahl anhand der WHERE KlauselMitarbeiter
SELECT * FROM Mitarbeiteraufgaben WHERE istverteilungsbetrag > 0.5;

-- Wählt alle Elemente aus mehreren Tabellen aus
SELECT * FROM Mitarbeiter, Mitarbeiteraufgaben;
-- IST DAS GLEICHE WIE:
SELECT Mitarbeiter.*, Mitarbeiteraufgaben.* FROM Mitarbeiter CROSS JOIN Mitarbeiteraufgaben;

-- ------ SELECT -------------
