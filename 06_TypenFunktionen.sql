USE Northwind;

--Datentypen

--Ganzzahlige Typen
--tinyint, smallint, int, bigint
--1B, 2B, 4B, 8B
--bit: Boolean (1B)

--Kommazahlen
--float, decimal, smallmoney, money
--Abhängig von Inhalt, Definition von Vor-/Nachkommastellen, 4B, 8B

--Texttypen
--char, varchar, text
--char: fixe Länge (1B pro Zeichen)
--varchar: variable Länge (1B pro Zeichen)
--text: gleich wie varchar(max) (obsolet)
--n vor Texttypen: Unicode, benötigt 2B pro Zeichen

--Datumstypen
--datetime, smalldatetime (veraltet)
--datetime2, date, time
--datetimeoffset: Datum mit Zeitzonen

--------------------------------------------------------------------------------

--Funktionen

--Datumsfunktionen

--Jetztiges Datum zurückgeben
SELECT GETDATE();
SELECT SYSDATETIME();

--Welche Bestellungen sollen in der Zukunft geliefert werden?
SELECT * FROM Orders WHERE RequiredDate > GETDATE();

--Datum zerlegen
SELECT YEAR(GETDATE());
SELECT MONTH(GETDATE());
SELECT DAY(GETDATE());

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT DATEPART(HH, GETDATE()); --Stunde von jetzt
SELECT DATEPART(QQ, GETDATE()); --Quartal von jetzt

SELECT *, DATEPART(QQ, OrderDate) FROM Orders; --In welchem Quartal wurden unsere Bestellungen aufgegeben?
SELECT * FROM Orders WHERE YEAR(OrderDate) = 1997;

--DATEDIFF
--Unterschied zw. zwei Datumswerten
SELECT DATEDIFF(DD, '19980718', GETDATE()) / 365.25;

--Wie lange haben alle Bestellungen benötigt um anzukommen?
SELECT *, DATEDIFF(DD, OrderDate, ShippedDate) FROM Orders;

--DATEADD
--Zwei Datumswerte addieren
SELECT DATEADD(YY, 10, GETDATE());
SELECT DATEADD(DD, 1460, GETDATE()); --Schaltjahre sind hier auch inkludiert

--DATENAME
--Gibt den Namen einer Datumskomponente zurück
SELECT DATENAME(MM, GETDATE()); --Juni
SELECT DATENAME(DW, GETDATE()); --Dienstag

--------------------------------------------------------------------------------

--Stringfunktionen

--LEN
--Gibt die Länge von einem Text zurück
SELECT LEN('Hallo')

--Welche Kunden haben mehr als 20 Buchstaben im Firmennamen?
SELECT * FROM Customers WHERE LEN(CompanyName) > 20

SELECT LOWER('Hallo');
SELECT UPPER('Hallo');

SELECT TRIM(' Hallo ')
SELECT LTRIM(' Hallo ')
SELECT RTRIM(' Hallo ')

SELECT REPLICATE('x', 10)

SELECT CONCAT('Hallo', 'Welt');
SELECT CONCAT_WS(' ', 'Hallo', 'Welt', 'mein', 'Name', 'ist', 'Lukas'); --Concat with Separator
SELECT CONCAT_WS(' ', Address, City, PostalCode, Country) FROM Customers;

--------------------------------------------------------------------------------

--Aggregatsfunktionen
--AVG, MIN, MAX, SUM, COUNT

--Was sind die durchschnittlichen Frachtkosten von Bestellungen?
SELECT AVG(Freight) FROM Orders;
SELECT AVG(Freight) FROM Orders WHERE CustomerID = 'ALFKI';

--Wieviele DS gibt es in der Tabelle?
SELECT COUNT(*) FROM Orders;
SELECT COUNT(*) FROM Orders WHERE CustomerID = 'ALFKI';

--------------------------------------------------------------------------------

--Formatfunktionen

--FORMAT
--Werte formatieren (vorallem nützlich bei Datumswerten)

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy')

SELECT FORMAT(GETDATE(), 'dddd.MMMM.yy')

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy');

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy, HH:mm:ss');

--An welchem Tag wurden die Mitarbeiter geboren?
SELECT FirstName, LastName, FORMAT(BirthDate, 'dddd, dd. MMMM yyyy') FROM Employees;

SELECT FORMAT(GETDATE(), 'd')
SELECT FORMAT(GETDATE(), 'D')