CREATE DATABASE IF NOT EXISTS TypenDatenbank;

USE TypenDatenbank;

CREATE TABLE Kundenverzeichnis
(
    ID          INTEGER PRIMARY KEY,
    Name        VARCHAR(10),
    Lebensalter INTEGER
);

CREATE TABLE Rechnungsverzeichnis
(
    ID INTEGER PRIMARY KEY,
    KundenID INTEGER,
    Betrag DOUBLE,

    FOREIGN KEY (KundenID) REFERENCES Kundenverzeichnis(ID) ON UPDATE NO ACTION ON DELETE CASCADE
);

-- -----------------------
-- VIEW

-- Erzeugt (hier noch simpel) eine VIEW, welche eine Ansicht einer Tabelle
-- darstellt. Dies sieht für den Nutzer wie eine neue Tabelle aus, welche jedoch
-- nur die Daten der entsprechenden Anweisung nach CREATE VIEW … AS darstellt
-- und als sogenannte VIEW speichert. Diese ist im Nachhinein abrufbar.
CREATE VIEW RechnungenKunde1 AS SELECT Name FROM Kundenverzeichnis WHERE id = 1;

-- Löscht die VIEW wie zuvor
DROP VIEW RechnungenKunde1;

-- ZUSATZPARAMETER AM ENDE:
-- RESTRICT – Das Löschen scheitert, wenn die Sicht referenziert wird
-- CASCADE  - Das Löschen der Sicht sorgt dafür, dass alle Referenzen ebenfalls gelöscht werden

-- VIEW
-- -----------------------

DROP DATABASE IF EXISTS TypenDatenbank;
