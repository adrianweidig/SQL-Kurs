-- Zugehörige Datenbank erzeugen lassen
CREATE DATABASE IF NOT EXISTS Mitarbeiter_Datenbank;

-- Wählt für alle zukünftigen Befehle die unter USE
-- angegebene Datenbank aus.
USE Mitarbeiter_Datenbank;

-- Tabelle erzeugen
CREATE TABLE IF NOT EXISTS Mitarbeiter
(
    -- Spalte, welche Einträge mit 5 Chars zulässt
    -- Werden weniger als 5 Zeichen eingegeben werden diese mit Leerzeichen gefüllt
    -- Werden mehr als 5 Zeichen eingegeben werden die aktuellen abgeschnitten oder ein
    -- Fehler zurückgegeben

    -- PRIMARY KEY:
    -- Legt fest, dass keine Duplikate und keine NULL Werte erlaubt sind
    Mitarbeiternummer CHARACTER(5) PRIMARY KEY,

    -- Wie oben nur, dass keine NULL Werte erlaubt werden
    Name              CHARACTER(10) NOT NULL,

    -- Lediglich Beschränkung auf die Zeichenzahl
    Vorname           CHARACTER(10),

    -- Beschränkung der Zeichenzahl und zusätzlich ein Standartwert, falls keiner angegeben wurde
    Ort               CHARACTER(20) DEFAULT 'Kein Ort angegeben',

    -- Der Name der Spalte ist in Anführungszeichen, da ALTER ein reserviertes
    -- Wort für die Tabellen-Überarbeitung ist. Integer legt hier den Wert
    -- einer Zahl als Inhalt der Spalte fest.
    Lebensalter       INTEGER,

    -- Unique sorgt dafür, dass jeder Beruf nur einzigartig vorkommen darf
    -- NULL darf jedoch unendlich oft vorkommen
    Beruf             CHARACTER(15) UNIQUE,

    -- Ergänzt die vorhandenen Möglichkeiten um eine Bedingung, welche nach
    -- CHECK () in Klammern angegeben ist. Nur Werte, welche bei dieser Prüfung
    -- true zurückliefern werden akzeptiert.
    Telefonnummer     INTEGER CHECK (1000 < Telefonnummer < 9999)
);

-- Vollqualifiziertes Erzeugen einer Datenbank.
-- Dies ist nötig, falls via USE keine Datenbank angegeben ist
CREATE TABLE IF NOT EXISTS Mitarbeiter_Datenbank.Mitarbeiteraufgaben
(
    Aufgabennummer       CHARACTER(2),
    -- Fünfstellige Zeichenfolge und verweist auf die Mitarbeitertabelle
    -- und den dort enthaltenen Wert der Mitarbeiternummer und macht
    -- quasi das gleiche wie FOREIGN KEYS ... REFERENCES ...
    Mitarbeiternummer    CHARACTER(5) REFERENCES Mitarbeiter (Mitarbeiternummer),

    -- Legt den Wert als eine Zahl mit maximal drei Ziffern und maximal einer Dezimalstelle fest
    -- Prüft im Anschluss den Wertebereich zusätzlich mit OR zur Veranschaulichung
    Istverteilungsbetrag NUMERIC(3, 1) CHECK (0.0 < Istverteilungsbetrag OR Istverteilungsbetrag < 1.0),

    -- Erzeugt den Primary Key aus einer Kombination aus der Aufgaben- und Mitarbeiternummer,
    -- BEACHTE, dass beide Nummern somit auch als UNIQUE und NOT NULL definiert sind somit
    -- sowohl die Aufgaben- als auch die Mitarbeiternummer nur einmalig vorkommen darf.
    PRIMARY KEY (Aufgabennummer, Mitarbeiternummer)
);

-- Datenbank und Inhalte am Ende löschen
DROP DATABASE IF EXISTS Mitarbeiter_Datenbank;