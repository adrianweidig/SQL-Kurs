-- Übersicht der Rechte:
/*
+-----------------+---------------------------------------------------------+
|    RechtName    |                        Beschreibung                     |
+-----------------+---------------------------------------------------------+
|     SELECT      | Erlaubt das Auswählen von Daten                         |
|     INSERT      | Erlaubt das Einfügen von Daten                          |
|     UPDATE      | Erlaubt das Aktualisieren von Daten                     |
|     DELETE      | Erlaubt das Löschen von Daten                           |
|    EXECUTE      | Erlaubt das Ausführen von gespeicherten                 |
|                 | Prozeduren/Funktionen                                   |
| REFERENCES      | Erlaubt das Setzen von FOREIGN KEYS                     |
|                 | auf PRIMARY KEYS anderer Tabellen                       |
|     USAGE       | Erlaubt die Nutzung einer spezifizierten Domäne,        |
|                 | Zeichenmenge, Zeichenordnung und Zeichenübersetzung     |
| ALL PRIVILEGES  | Gewährt alle oben genannten Rechte und mehr             |
+-----------------+---------------------------------------------------------+
 */

-- Bedingung zur Vergabe der Rechte ist es selbst die Rechte zu besitzen diese zu vergeben
-- Das sind in der Regel der DBA (Database-Admin) und der DBO (Database-Owner)

-- SYNTAX: GRANT "RECHT" ON "Tabellenname" TO "Benutzer oder ALL";
-- Recht zum Lesen von Daten in der Tabelle Mitarbeiter an ALLE
GRANT SELECT ON Mitarbeiter TO ALL;

-- Rechte an mehrere Personen vergeben
GRANT REFERENCES ON Mitarbeiteraufgaben TO hugo, boss;

-- Recht wegnehmen
REVOKE REFERENCES ON Mitarbeiteraufgaben FROM boss;

-- Recht - Rechte zu vergeben
-- In diesem Fall kann hugo nun die Rechte SELECT an andere weitergebens
GRANT SELECT ON Mitarbeiter TO hugo WITH GRANT OPTION;
-- HINWEIS: Die Rechte-Weitergabe mit Beibehaltung der Rechte kann nur erreicht
-- werden, wenn die Rechte komplett weggenommen und neue ohne GRANT OPTION vergeben
-- werden.
