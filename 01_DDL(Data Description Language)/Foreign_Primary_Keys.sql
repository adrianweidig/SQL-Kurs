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
    KundenID INTEGER,

    -- Referenziert auf die KundenID der Tabelle Kundenverzeichnis und ergänzt die sogenannten
    -- Constraints beim Verhalten, wenn dieser Eintrag gelöscht oder geupdatet wird.

    -- NO ACTION - Kein zulassen von Änderungen bzw. Löschen solange referenzierte Einträge vorhanden sind
    -- CASCADE   - Änderung bzw. Löschung auf referenzierte Zellen ebenfalls durchführen
    -- SET NULL  - Änderung bzw. Löschung sorgt dafür, dass referenzierte Zellen auf NULL gesetzt werden
    FOREIGN KEY (KundenID) REFERENCES Kundenverzeichnis(KundenID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP DATABASE IF EXISTS ForeignPrimaryDatenbank;
