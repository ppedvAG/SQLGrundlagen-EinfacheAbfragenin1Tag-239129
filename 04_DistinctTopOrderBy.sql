USE Northwind;

--Order By: Ergebnis Sortieren
SELECT * FROM Orders
ORDER BY Freight; --Standard: Aufsteigend

SELECT * FROM Orders
ORDER BY Freight DESC; --Absteigend Sortieren

SELECT * FROM Orders
ORDER BY EmployeeID, Freight; --Mehrere Sortierungen mit Komma getrennt

SELECT * FROM Orders
ORDER BY EmployeeID ASC, Freight DESC;

SELECT * FROM Orders
ORDER BY 2; --Nach Spaltenindizes sortieren

SELECT * FROM Orders
ORDER BY 2, 4;

SELECT * FROM Orders
ORDER BY 2, 4 DESC;

SELECT Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS VolleAdresse
FROM Customers
ORDER BY VolleAdresse; --Nach Spaltenaliases sortieren

SELECT *, Quantity * UnitPrice * (1 - Discount) AS CostSum
FROM [Order Details]
ORDER BY CostSum DESC;

--Distinct: Duplikate filtern

--Aufgabenstellung: In welchen Ländern haben wir Kunden?
SELECT Country
FROM Customers
ORDER BY 1;

SELECT DISTINCT Country
FROM Customers
ORDER BY 1; --Jedes Country nurnoch einmal

SELECT DISTINCT Country, City
FROM Customers
ORDER BY 1; --Jede Stadt/Land Kombination gefiltert

--Top: Nur die obersten X Datensätze zurückgeben

--Aufgabenstellung: Die 5 teuersten Bestellungen finden

SELECT TOP 5 *
FROM Orders
ORDER BY Freight DESC; --Top ist gut für Performance -> Wenn 5 DS gefunden, wird die Suche beendet

--Top kann auch mit Prozenten arbeiten

--Aufgabenstellung: Die obersten 2% der teuersten Bestellungen finden

SELECT TOP 2 PERCENT *
FROM Orders
ORDER BY Freight DESC;

SELECT * FROM Orders WHERE Freight >
(SELECT TOP 1 Freight * 0.8
FROM Orders
ORDER BY Freight DESC);

SELECT TOP 2 PERCENT *
FROM [Order Details]
ORDER BY Quantity; --Ohne Unentschieden: 44 DS

SELECT TOP 2 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY Quantity; --Mit Unentschieden: 69 DS