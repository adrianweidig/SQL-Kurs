/*
+-----+---------------------------+--------------------------------------------+
| Abk. | Eigenschaft              | Beschreibung                               |
+-----+---------------------------+--------------------------------------------+
| A   | Atomicity (Atomarität)    | Eine Transaktion wird als eine einzige     |
|     |                           | logische Einheit betrachtet, die entweder  |
|     |                           | vollständig ausgeführt oder vollständig    |
|     |                           | rückgängig gemacht wird.                   |
+-----+---------------------------+--------------------------------------------+
| C   | Consistency (Konsistenz)  | Vor und nach einer Transaktion müssen      |
|     |                           | Datenbank und Integritätsbedingungen       |
|     |                           | konsistent bleiben.                        |
+-----+---------------------------+--------------------------------------------+
| I   | Isolation (Isolation)     | Transaktionen sollten unabhängig vonein-   |
|     |                           | ander ausgeführt werden. Änderungen in     |
|     |                           | einer Transaktion dürfen nicht von anderen |
|     |                           | Transaktionen beeinflusst werden.          |
+-----+---------------------------+--------------------------------------------+
| D   | Durability (Dauerhaftig-  | Nachdem eine Transaktion erfolgreich       |
|     | keit)                     | bestätigt wurde, bleiben ihre Änderungen   |
|     |                           | dauerhaft in der Datenbank gespeichert,    |
|     |                           | auch wenn es zu einem Systemfehler kommt.  |
+-----+---------------------------+--------------------------------------------+
*/

-- TRANSACTION bieten eine einfache Möglichkeit ACID zu gewährleisten
-- BEACHTE: In manchen SQL Dialekten ist es BEGIN TRANSACTION
START TRANSACTION;

-- Erzeugt einen expliziten Speicherpunkt zu dem ROLLBACK zurückgeht,
-- falls ein Fehler auftritt
SAVEPOINT vor_allem;

CREATE TEMPORARY TABLE temp_db
SELECT *
FROM mitarbeiter;

-- s.o.
SAVEPOINT temp_db_erzeugt;
-- Entfernt den vorherigen Savepoint
RELEASE SAVEPOINT vor_allem;

ALTER TABLE temp_db
    DROP COLUMN Ort, Lebensalter, Beruf, Telefonnummer;

SELECT *
FROM temp_db;

-- Wenn in diesem Bereich bereits ein Fehler auftaucht wird ROLLBACK implizit
-- ausgeführt, was dafür sorgt, dass alle bisher ausgeführten Anfragen rückgängig
-- gemacht werden um ACID zu wahren.

-- COMMIT übernimmt die Änderungen in die Umgebung und gewährleistet die Beständigkeit
-- auch bei Systemausfall
COMMIT;

-- Explizites ROLLBACK führt ROLLBACK aus auch wenn kein Fehler aufgetreten ist.
ROLLBACK;

-- Explizites Rollback zu einem speziellen Savepoint
ROLLBACK TO temp_db_erzeugt;



