/*
 Normalisieren Sie folgende Relationen, unter Berücksichtigung der im
Anwendungsgebiet geltenden Regeln. Geben Sie – mit Begründung - an, welche
Relationen welche Normalformen verletzen.

Buch (ISBN , Titel, Erst-Erscheinungsjahr, Erst-Auflagenhöhe, Genre, Lektor)
Autor (AID, Name, Geschlecht, Geburtsort)
Hat_geschrieben ( Autor, Buch, Fertigstellung)
Herausgabe (Verlag , Buch-ISBN, Buch-Titel, Auflage, Erscheinungsjahr, Auflagenhöhe)
Verlag : (Bezeichnung, Ort, Hauptlektor)

Regeln:
Ein Buch wird immer nur von einem Verlag herausgegeben.
Die Auflagenhöhe eines Buches ist bei allen Auflagen gleich.
Für jedes Genre gibt es genau einen Lektor.
Das Jahr der Fertigstellung eines Buches und das Erst-Erscheinungsjahr sind identisch.
 */

START TRANSACTION;

DROP DATABASE IF EXISTS SchuelerDB;

CREATE DATABASE SchuelerDB;
USE SchuelerDB;

CREATE TABLE Lehrer
(
    LehrerID Integer PRIMARY KEY,
    Name     Varchar(10)
);

CREATE TABLE Klassenstufe
(
    Klassenstufe Integer PRIMARY KEY,
    Lehrer       INTEGER,
    FOREIGN KEY (Lehrer) REFERENCES Lehrer (LehrerID)
);

CREATE TABLE Schueler
(
    SchuelerID   Integer Primary Key,
    Klassenstufe Integer,
    FOREIGN KEY (Klassenstufe) REFERENCES Klassenstufe(Klassenstufe)
);

INSERT INTO Lehrer
    (LehrerID, Name) VALUES
                         (1,'Hugo'),
                         (2, 'Heinz'),
                         (3, 'Bernd');

INSERT INTO Klassenstufe
    (Klassenstufe, Lehrer) VALUES
                               (1, 1),
                               (2, 1),
                               (3, 2),
                               (4, 3);

INSERT INTO Schueler
    (SchuelerID, Klassenstufe) VALUES
                                   (1, 1),
                                   (2, 1),
                                   (3, 2),
                                   (4, 1),
                                   (5, 3),
                                   (6, 4),
                                   (7, 2),
                                   (8, 3);

SELECT * FROM Schueler;
SELECT * FROM Lehrer;
SELECT * FROM Klassenstufe;

SELECT Schueler.SchuelerID as 'Schueler', Klassenstufe.Klassenstufe as 'Klasse', Lehrer.Name as 'Klassenlehrer' FROM Schueler, Klassenstufe, Lehrer WHERE Schueler.Klassenstufe = Klassenstufe.Klassenstufe AND Klassenstufe.Lehrer = Lehrer.LehrerID;

SELECT Schueler.SchuelerID as 'Schueler', Klassenstufe.Klassenstufe as 'Klasse', Lehrer.Name as 'Klassenlehrer'
    FROM Schueler
    JOIN Klassenstufe ON Schueler.Klassenstufe < 3 AND Schueler.Klassenstufe = Klassenstufe.Klassenstufe
    JOIN Lehrer ON Klassenstufe.Lehrer = Lehrer.LehrerID;

COMMIT;
