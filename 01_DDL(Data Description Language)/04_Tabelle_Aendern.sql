CREATE DATABASE IF NOT EXISTS AenderungsDatenbank;

USE AenderungsDatenbank;

CREATE TABLE Kundenverzeichnis
(
    ID          INTEGER PRIMARY KEY,

    -- Beschränkt die Größe der Spaltenwerte auf MAXIMAL 10 Zeichen
    Name        VARCHAR(10),
    Lebensalter INTEGER
);

CREATE TABLE Rechnungsverzeichnis
(
    ID INTEGER PRIMARY KEY,
    KundenID INTEGER,
    UnnoetigeSpalte VARCHAR(100),

    FOREIGN KEY (KundenID) REFERENCES Kundenverzeichnis(ID) ON UPDATE NO ACTION ON DELETE CASCADE
);

-- -----------------------

-- ------ ALTER TABLE -------------

-- Fügt der Tabelle die Spalte Betrag mit Integer Werten hinzu
-- Mögliche Optionen:
-- ADD spaltenname  - Hinzufügen einer Spalte
-- DROP spaltenname - Löschen einer Spalte
ALTER TABLE Rechnungsverzeichnis ADD Betrag Integer;

ALTER TABLE Rechnungsverzeichnis DROP UnnoetigeSpalte;

-- Anpassen einer Spalte selbst
ALTER TABLE Rechnungsverzeichnis ALTER COLUMN Betrag SET DEFAULT 0;

-- Hinzufügen eines Constraints mit Bezug auf die komplette Tabelle, wobei
-- die Prüfung auf die Spalte Betrag bezogen ist.
ALTER TABLE  Rechnungsverzeichnis ADD CONSTRAINT Betragsminimum CHECK ( Betrag > 0 );

-- Löschen des Constraints
ALTER TABLE Rechnungsverzeichnis DROP CONSTRAINT Betragsminimum;

-- Bearbeitet die Eigenschaften der Spalte Name, sodass die Größenbeschränkung
-- auf 50 angehoben wird. 
-- BEACHTE:
-- Sollten betroffene Daten mit einer nun kleineren Beschränkung auskommen
-- müssen so schlägt der Befehl fehl
ALTER TABLE Kundenverzeichnis MODIFY COLUMN Name VARCHAR(50);

-- ------ ALTER TABLE -------------

-- ------ DROP TABLE -------------

-- RESTRICT - Wird scheitern, wenn diese noch irgendwo referenziert wird
DROP TABLE IF EXISTS Rechnungsverzeichnis RESTRICT;

-- CASCADE - Wird immer gelingen, da Referenzen mit gelöscht werden
DROP TABLE IF EXISTS Rechnungsverzeichnis CASCADE;

-- ------ DROP TABLE -------------
-- -----------------------

DROP DATABASE IF EXISTS AenderungsDatenbank;
