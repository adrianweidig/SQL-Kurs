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
    UnnoetigeSpalte VARCHAR(100),

    FOREIGN KEY (KundenID) REFERENCES Kundenverzeichnis(ID) ON UPDATE NO ACTION ON DELETE CASCADE
);

-- -----------------------



-- -----------------------

DROP DATABASE IF EXISTS TypenDatenbank;