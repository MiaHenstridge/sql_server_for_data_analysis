/*
Exercise 1

Use date math - in conjunction with GETDATE - 
to calculate what date is 100 days from now.
*/

SELECT DATEADD(DAY, 100, GETDATE());


/*
Exercise 2

Use DATEADD to calculate what date is 6 months from now.
*/

SELECT DATEADD(MONTH, 6, GETDATE())


/*
Exercise 3

Use DATEDIFF to select all rows from the "Sales.SalesOrderHeader" table 
where the order date is 7 or less days before 12/25/2013. 
Note that it is possible for DATEDIFF to output a negative number if the "end" date 
is prior to your "start" date, 
so you may want to use BETWEEN instead of <= in your criteria.

You may select all columns via the SELECT * shorthand.
*/

SELECT *
FROM AdventureWorks2019.Sales.SalesOrderHeader
--WHERE OrderDate BETWEEN DATEADD(DAY, -7, DATEFROMPARTS(2013,12,25)) AND DATEFROMPARTS(2013,12,25);
WHERE DATEDIFF(DAY, OrderDate, DATEFROMPARTS(2013,12,25)) BETWEEN 0 AND 7;

/*
Bonus

Modify your query from Exercise 3 to work for ANY year, not just 2013. 
HINT - instead of hardcoding the year in your DATEFROMPARTS function, 
you will probably want to calculate the year based on the order date.
*/
SELECT *
FROM AdventureWorks2019.Sales.SalesOrderHeader
--WHERE OrderDate BETWEEN DATEADD(DAY, -7, DATEFROMPARTS(YEAR(OrderDate),12,25)) AND DATEFROMPARTS(YEAR(OrderDate),12,25);
WHERE DATEDIFF(DAY, OrderDate, DATEFROMPARTS(YEAR(OrderDate),12,25)) BETWEEN 0 AND 7;