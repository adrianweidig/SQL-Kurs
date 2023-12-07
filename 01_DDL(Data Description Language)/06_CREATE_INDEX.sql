CREATE DATABASE IF NOT EXISTS TestDB;
USE TestDB;

CREATE TABLE IF NOT EXISTS Mitarbeiter
(
    Mitarbeiternummer CHARACTER(5) PRIMARY KEY,
    Name              CHARACTER(10) NOT NULL,
    Vorname           CHARACTER(10),
    Ort               CHARACTER(20) DEFAULT 'Kein Ort angegeben',
    Lebensalter       INTEGER,
    Beruf             CHARACTER(15) UNIQUE,
    Telefonnummer     INTEGER CHECK (1000 < Telefonnummer < 9999)
);

CREATE TABLE IF NOT EXISTS Mitarbeiter_Datenbank.Mitarbeiteraufgaben
(
    Aufgabennummer       CHARACTER(2),
    Mitarbeiternummer    CHARACTER(5) REFERENCES Mitarbeiter (Mitarbeiternummer),
    Istverteilungsbetrag NUMERIC(3, 1) CHECK (0.0 < Istverteilungsbetrag OR Istverteilungsbetrag < 1.0),
    PRIMARY KEY (Aufgabennummer, Mitarbeiternummer)
);
-- --------------------------
-- ------ INDEX -------------

-- Erzeugt einen einzigartigen, also nicht mehrfach vorkommenden, INDEX auf eine Spalte und deren Werte
CREATE INDEX Index_Mitarbeiter ON Mitarbeiter (Mitarbeiternummer);

-- Erzeugt einen einzigartigen Index, welcher auch in der zugehörigen Reihenfolge gespeichert wird
CREATE INDEX INDEX_NameVorname ON Mitarbeiter (Name, Vorname);

-- ------ INDEX -------------
-- --------------------------
DROP DATABASE IF EXISTS Mitarbeiter_Datenbank;
