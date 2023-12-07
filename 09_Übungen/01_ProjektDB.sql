/* 
Eine Stadtverwaltung möchte alle ressortübergreifenden Projekte in einer Datenbank
erfassen.
Anforderungsdefinition
Die Datenbank soll Auskunft geben, welche Projekte aktuell laufen beziehungsweise
bereits abgeschlossen sind, welcher Mitarbeiter das Projekt leitet beziehungsweise
zuletzt geleitet hat und welche weiteren Mitarbeiter beteiligt sind beziehungsweise waren.
Jedem Projekt muss stets ein Projektleiter zugewiesen sein. Für alle beteiligten
Mitarbeiter muss außerdem das Ressort angegeben sein, in dem sie arbeiten.
Daten
 Für jedes Projekt sollen die Projektbezeichnung, eine Kurzbeschreibung, das
Start- und das Abschlussdatum, der Projektleiter sowie alle weiteren
Projektmitarbeiter verfügbar sein.
 Für jeden Mitarbeiter sollen Personalnummer, Vor- und Nachname sowie das
Ressort, in dem er arbeitet, verfügbar sein.
 Für jedes Ressort soll dessen Bezeichnung gespeichert werden können.
 In der Datenbank sollen alle Ressorts der Stadt verfügbar sein, auch wenn ein
Ressort bisher noch keinen Mitarbeiter für ein solches Projekt abgestellt hat.
a) Erstellen Sie ein ER-Modell. (14 Punkte)
b) Überführen Sie das ER-Modell in ein Relationenmodell. (4 Punkte)
c) Formulieren Sie die SQL-Anweisungen zum Erstellen der Tabellen. (12 Punkte)
 */
 
-- a) Auf Remarkable
-- b) 
-- Projekt(ID, Bezeichnung, Kurzbeschreibung, Leiter, Startdatum, Enddatum)
-- Mitarbeiter (Personalnummer, Vorname, Nachname, Ressort)
-- Ressort (ID, Beschreibung)
-- Mitarbeiter_arbeitet_in_Projekt (Projekt.ID, Mitarbeiter.ID)

-- c)
DROP DATABASE IF EXISTS ProjektDB;

START TRANSACTION;

CREATE DATABASE IF NOT EXISTS ProjektDB;

USE ProjektDB;

SAVEPOINT DB_Initialisiert;

CREATE TABLE IF NOT EXISTS Ressort (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Beschreibung VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Mitarbeiter(
  Personalnummer INTEGER PRIMARY KEY,
  Vorname VARCHAR(10),
  Nachname VARCHAR(10),
  Ressort INTEGER,
  FOREIGN KEY Mitarbeiter(Ressort) REFERENCES Ressort(ID)
);

CREATE TABLE IF NOT EXISTS Projekt (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(15),
    Kurzbeschreibung VARCHAR(50),
    Leiter INTEGER,
    FOREIGN KEY Projekt(Leiter) REFERENCES Mitarbeiter(Personalnummer)
);

CREATE TABLE IF NOT EXISTS MitarbeiterArbeitetInProjekt (
    Projekt INTEGER REFERENCES Projekt(ID),
    Mitarbeiter INTEGER REFERENCES Mitarbeiter(Personalnummer),
    PRIMARY KEY (Projekt, Mitarbeiter),
    FOREIGN KEY (Projekt) REFERENCES Projekt(ID),
    FOREIGN KEY (Mitarbeiter) REFERENCES Mitarbeiter(Personalnummer)
);

SELECT * FROM ProjektDB.MitarbeiterArbeitetInProjekt;

SAVEPOINT Tabellen_Erzeugt;

COMMIT;




-- ALTER TABLE MitarbeiterArbeitetInProjekt ADD CONSTRAINT FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter(Personalnummer);
