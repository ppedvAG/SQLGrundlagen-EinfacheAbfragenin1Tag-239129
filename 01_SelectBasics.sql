USE Northwind; --Datenbank auswählen
--Bei jedem Skript sollte am Anfang des Skripts ein USE-Statement stehen

SELECT 100; --SELECT: Daten holen

SELECT 10.5;

SELECT 'Hallo';

SELECT * FROM Customers; --SELECT mit FROM kombinieren um eine bestimmte Tabelle anzugreifen
--*: Alle Spalten

--Code markieren und Strg + E: Nur markierten Code ausführen
--Strg + R: Ergebnisansicht ein-/ausblenden

SELECT 'Hallo' AS Text; --AS: Spalte umbenennen

SELECT CompanyName FROM Customers; --Nur bestimmte Spalte(n) angreifen

SELECT CompanyName AS Firmenname, ContactName
FROM Customers;

--Aufgabenstellung: Adressdaten aus Customers zusammenbauen zu einer Spalte

SELECT Address + ' ' + City + ', ' + PostalCode + ' ' + Country FROM Customers;

SELECT Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS VolleAdresse FROM Customers;
SELECT Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse] FROM Customers;
SELECT Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS 'Volle Adresse' FROM Customers;
SELECT Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS "Volle Adresse" FROM Customers;

SELECT *, Quantity * UnitPrice * (1 - Discount) AS CostSum
FROM [Order Details]