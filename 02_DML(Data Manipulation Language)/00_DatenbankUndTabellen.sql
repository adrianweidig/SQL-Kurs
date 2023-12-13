CREATE DATABASE IF NOT EXISTS TestDB;
USE TestDB;

CREATE TABLE IF NOT EXISTS
    Mitarbeiter
(
    Mitarbeiternummer CHARACTER(5) PRIMARY KEY,
    Name              CHARACTER(10) NOT NULL,
    Vorname           CHARACTER(10),
    Ort               CHARACTER(20) DEFAULT 'Kein Ort angegeben',
    Lebensalter       INTEGER,
    Beruf             CHARACTER(15) UNIQUE,
    Telefonnummer     INTEGER CHECK (1000 < Telefonnummer < 9999)
);

CREATE TABLE IF NOT EXISTS
    Mitarbeiteraufgaben
(
    Aufgabennummer       CHARACTER(3),
    Mitarbeiternummer    CHARACTER(5) REFERENCES Mitarbeiter (Mitarbeiternummer),
    Istverteilungsbetrag NUMERIC(3, 1) CHECK (0.0 < Istverteilungsbetrag OR Istverteilungsbetrag < 1.0),
    PRIMARY KEY (Aufgabennummer, Mitarbeiternummer)
);

-- Beispiel-Einträge für die Tabelle Mitarbeiter

INSERT INTO Mitarbeiter (Mitarbeiternummer, Name, Vorname, Ort, Lebensalter, Beruf, Telefonnummer)
VALUES ('M001', 'Mustermann', 'Max', 'Berlin', 30, 'Entwickler', 1234),
       ('M002', 'Musterfrau', 'Maria', 'Hamburg', 28, 'Designer', 5678),
       ('M003', 'Beispiel', 'Peter', 'München', 35, 'Manager', 9876);

-- Beispiel-Einträge für die Tabelle Mitarbeiter_Datenbank.Mitarbeiteraufgaben

INSERT INTO Mitarbeiteraufgaben (Aufgabennummer, Mitarbeiternummer, Istverteilungsbetrag)
VALUES ('A01', 'M001', 0.8),
       ('A02', 'M002', 0.6),
       ('A01', 'M003', 0.9),
       ('A03', 'M001', 0.5);

DROP TABLE Mitarbeiter, Mitarbeiteraufgaben;