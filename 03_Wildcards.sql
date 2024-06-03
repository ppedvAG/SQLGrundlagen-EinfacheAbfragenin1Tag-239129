--Wildcards
--Platzhalter für eine unbestimmte Anzahl an Zeichen in einer WHERE Bedingung

USE Northwind;

--%: Suche danach beliebig viele beliebige Zeichen

--Aufgabenstellung: Alle Kunden finden, welche in einem Land wohnen, welches mit einem A anfängt
SELECT * FROM Customers
WHERE Country LIKE 'A%'; --WICHTIG: Bei Wildcards immer den LIKE Operator verwenden

SELECT * FROM Customers
WHERE Country LIKE '%A%'; --Alle Kunden finden, bei denen das Land ein A enthält

SELECT * FROM Customers
WHERE Country NOT LIKE '%A%'; --LIKE invertieren

--_: Suche genau ein einziges beliebiges Zeichen

--Aufgabenstellung: Suche alle Postleitzahlen, welche genau vier Stellen haben
SELECT * FROM Customers
WHERE PostalCode LIKE '____';

SELECT * FROM Customers
WHERE LEN(PostalCode) = 4;

SELECT * FROM Customers
WHERE PostalCode LIKE '1___'; --Vierstellige Postleitzahlen die mit einer 1 anfangen

--[]: Suche genau ein beliebiges Zeichen, welches innerhalb der Klammer steht

--Aufgabenstellung: Suche alle Bestellungen, bei denen der Employee die ID 1, 3 oder 6 hat
SELECT * FROM Orders
WHERE EmployeeID LIKE '[136]'

--Beispiel: Bankkartenpin
SELECT * FROM Customers
WHERE PostalCode LIKE '[0-9][0-9][0-9][0-9]'; --Suche ein beliebiges Zeichen von 0 bis 9, 4 mal

--Sonderfälle: Hochkomma oder Prozent in der Spalte
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'; --Hochkomma suchen

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'; --Prozent suchen