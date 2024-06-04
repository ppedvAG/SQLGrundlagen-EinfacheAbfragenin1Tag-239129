USE Northwind;

SELECT * FROM Orders;

SELECT * FROM Employees;

--Orders enthält eine Spalte namens EmployeeID
--Diese gibt an, welcher Mitarbeiter die entsprechende Bestellung bearbeitet hat
--Mithilfe eines JOINs können wir die Daten der Mitarbeiter zu den Daten der Bestellungen hinzufügen (anhängen)

--Aufgabenstellung: Zu jeder Bestellung den Namen des Mitarbeiters ausgeben

SELECT * FROM Orders
INNER JOIN Employees --Verbinde die Tabelle im FROM mit der Employees Tabelle
ON Orders.EmployeeID = Employees.EmployeeID; --In der ON-Klausel wird festgelegt, über welche Spalte die Tabellen verbunden werden

--Reihenfolge von Tabellen in FROM und JOIN und Reihenfolge der Schlüssel in ON ist nicht relevant
SELECT * FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID;

--Sinnvolle Spalten auswählen
SELECT OrderID, OrderDate, CustomerID, FirstName, LastName
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID;

---------------------------------------------------------------------------------

--Schlüssel
--Primärschlüssel: Spalte, welche nur einzigartige Werte enthalten kann
--Verwendung: Datensätze eindeutig identifizieren

--Fremdschlüssel: Spalte, welche in einer anderen Tabellen ein Primärschlüssel ist
--Verwendung: Beziehungen zwischen Tabellen

--Mithilfe von JOINs können Beziehungen aufgelöst werden

--Aufgabenstellung: Zu jeder Bestellung den Mitarbeiter dazuholen
SELECT * FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

SELECT OrderID, CompanyName, ContactName, OrderDate, Freight FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

--Aufgabenstellung: Zu jeder Bestellung den Mitarbeiter und den Kunden finden
SELECT * FROM Orders
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID; --Zweiter JOIN einfach in die nächste Zeile

SELECT OrderID, OrderDate, Freight, FirstName, LastName, CompanyName, ContactName, Phone
FROM Orders
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID;

--Aufgabenstellung: Zu jeder Bestellung alle Produkte der jeweiligen Bestellung finden
SELECT * FROM Products;

SELECT * FROM [Order Details];

SELECT * FROM [Order Details]
INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID

SELECT Orders.OrderID, ProductName, [Order Details].UnitPrice, Quantity, [Order Details].UnitPrice * Quantity * (1 - Discount) AS CostSum, ShipName
FROM [Order Details]
INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID

--Vereinfachen mittels Aliases
SELECT o.OrderID, p.ProductName, od.UnitPrice, od.Quantity, od.UnitPrice * od.Quantity * (1 - od.Discount) AS CostSum, o.ShipName
FROM [Order Details] AS od
INNER JOIN Orders AS o ON o.OrderID = od.OrderID
INNER JOIN Products AS p ON p.ProductID = od.ProductID

---------------------------------------------------------------------------

--Outer Join
--Funktioniert wie INNER JOIN, fügt aber auch Datensätze hinzu welche kein Match auf der anderen Seite haben
--Drei Varianten: LEFT, RIGHT, FULL

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --830 Datensätze

--Es gibt auch Kunden die noch nie bei uns bestellt haben -> In der Abfrage nicht ersichtlich

SELECT * FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID; --832 Datensätze

--Die Kunden in den Zeilen 189 und 502 haben NULL-Spalten ergänzt bekommen bei den Order Spalten

--Beispiel: Auflisten, wieviele Bestellungen jeder Kunde getätigt hat
SELECT CustomerID, COUNT(*) AS Anzahl FROM Orders
GROUP BY CustomerID
ORDER BY Anzahl DESC; --Hier sind Kunden ohne Bestellungen nicht sichtbar

SELECT Customers.CustomerID, COUNT(*) AS Anzahl FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
ORDER BY Anzahl DESC; --Hier sind die fehlenden Kunden jetzt sichtbar

--Hier werden die Customers ergänzt, welche keine Bestellungen haben
SELECT * FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID;

--Hier werden die Orders ergänzt, welche keine Kunden haben
SELECT * FROM Orders o
LEFT JOIN Customers c
ON o.CustomerID = c.CustomerID;

SELECT * FROM Customers c --Wenn die Tabellen in FROM und JOIN vertauscht werden, muss auch der JOIN umgedreht werden
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID;

--Hier werden die Customers ergänzt, welche keine Bestellungen haben UND es werden die Orders ergänzt, welche keine Kunden haben
--LEFT und RIGHT gleichzeitig
SELECT * FROM Orders o
FULL JOIN Customers c
ON o.CustomerID = c.CustomerID;

---------------------------------------------------------------------------

--Cross Join
--Kombiniert alle Zeilen aus T1 mit allen Zeilen aus T2
SELECT * FROM Orders
CROSS JOIN Products;

--Self Join
--Join auf die gleiche Tabelle
--Hier in der Datenbank nur bei Employees zu finden
--Ganz normaler INNER JOIN

--Von jedem Mitarbeiter den Chef finden
SELECT * FROM Employees e
INNER JOIN Employees e2 ON e.EmployeeID = e2.ReportsTo