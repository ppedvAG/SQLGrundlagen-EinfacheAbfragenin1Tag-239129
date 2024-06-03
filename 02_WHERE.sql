--WHERE
--Filtern von Daten mithilfe von Operatoren

--Booleschen Operatoren
--Bedingungen erzeugen
-- =, !=, <> (gleich, ungleich, ungleich)
-- <, >, <=, >=
-- BETWEEN, IN, LIKE

--Logische Operatoren
--Mehrere Bedingungen verbinden
--AND, OR
--NOT

SELECT * FROM Orders WHERE Freight > 50; --Bestellungen mit Freight > 50

SELECT * FROM Orders WHERE Freight < 50; --Bestellungen mit Freight < 50

SELECT * FROM Orders WHERE EmployeeID = 1; --Alle Bestellungen von Employee #1

--AND, OR

SELECT * FROM Orders WHERE EmployeeID = 1 OR EmployeeID = 2; --Alle Bestellungen von Employee #1 oder #2

--BETWEEN
--Zwischen (inkludiert Ober-/Untergrenze)

SELECT * FROM Orders
WHERE EmployeeID BETWEEN 1 AND 3;

SELECT *
FROM Orders
WHERE Freight BETWEEN 10 AND 100
ORDER BY Freight;

--Aufgabenstellung: Alle Bestellungen zw. 01-01-97 und 01-06-97 finden
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '19970101' AND '19970601'; --Funktioniert immer

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-06-01'; --Funktioniert nicht

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '01.01.1997' AND '01.06.1997'; --Fehleranfällig

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '01/01/1997' AND '01/06/1997'; --Fehleranfällig

SELECT *
FROM Orders
WHERE OrderDate >= '01/01/1997' AND OrderDate <= '01/06/1997';

--BETWEEN mit Texten
SELECT * FROM Orders
WHERE CustomerID BETWEEN 'AAAAA' AND 'MMMMM'

--IN
--Suche in einer gegebenenen Liste nach passenden Treffern

--Aufgabenstellung: Finde alle Bestellungen, die nach UK, USA oder Spain geliefert wurden
SELECT * FROM Orders
WHERE ShipCountry = 'UK' OR ShipCountry = 'USA' OR ShipCountry = 'Spain'

SELECT * FROM Orders
WHERE ShipCountry IN ('UK', 'USA', 'Spain')

--NOT
--Bedingung invertieren
SELECT * FROM Orders
WHERE ShipCountry NOT IN ('UK', 'USA', 'Spain')

SELECT *
FROM Orders
WHERE OrderDate NOT BETWEEN '19970101' AND '19970601';

--NULL Werte finden
--IS NULL/IS NOT NULL

--Aufgabenstellung: Alle Customer finden, welche kein Fax-Gerät haben
SELECT * FROM Customers WHERE Fax = NULL; --NULL kann nicht mit =/!= gesucht werden

SELECT * FROM Customers WHERE Fax IS NULL;

SELECT * FROM Customers WHERE Fax IS NOT NULL;