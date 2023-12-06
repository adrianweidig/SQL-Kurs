CREATE DATABASE IF NOT EXISTS ForeignPrimaryDatenbank;
USE ForeignPrimaryDatenbank;

CREATE TABLE IF NOT EXISTS Kundenverzeichnis
(
    KundenID INTEGER PRIMARY KEY,
    Name     VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Rechnungen
(
    RechnungsNummer INTEGER,
    KundenID        INTEGER,

    -- Referenziert auf die KundenID der Tabelle Kundenverzeichnis und ergänzt die sogenannten
    -- Constraints beim Verhalten, wenn dieser Eintrag gelöscht oder geupdatet wird.
    -- SYNTAX: FOREIGN KEY NAMEDESFOREIGNKEYS(SPALTENNAME) REFERENCES TABELLENNAME(SPALTENNAME) ...

    -- NO ACTION   - Kein zulassen von Änderungen bzw. Löschen solange referenzierte Einträge vorhanden sind
    -- CASCADE     - Änderung bzw. Löschung auf referenzierte Zellen ebenfalls durchführen
    -- SET NULL    - Änderung bzw. Löschung sorgt dafür, dass referenzierte Zellen auf NULL gesetzt werden
    -- SET DEFAULT - Änderung bzw. Löschung setzt den Wert der Zelle auf einen DEFAULT Wert, wobei dieser
    --               dafür auch existent und gültig sein muss.
    FOREIGN KEY Kunden_FK (KundenID) REFERENCES Kundenverzeichnis (KundenID) ON DELETE CASCADE ON UPDATE CASCADE,

    -- ACHTUNG ACHTUNG ACHTUNG --
    -- Dies sorgt dafür, dass auch die KundenID nur einmalig vorkommen darf.
    -- Somit wäre auch nur eine Rechnung für einen Kunden zulässig.
    -- Ein Eintrag mit zweimal der gleichen KundenID wäre in Rechnungen nicht zulässig

    --
    -- PRIMARY KEY (RechnungsNummer, KundenID)
    --

    -- Dies wäre stattdessen funktionabel mit eindeutigen Rechnungsnummern aber mehreren KundenIDs,
    -- da PRIMARY KEY für die jeweiligen Einträge dafür sorgt, dass diese UNIQUE und NOT NULL sein müssen
    PRIMARY KEY (RechnungsNummer)
);

DROP DATABASE IF EXISTS ForeignPrimaryDatenbank;
