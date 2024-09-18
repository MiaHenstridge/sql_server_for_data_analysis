/*
Exercise 1

Create a query with the following columns:

SalesOrderID, OrderDate, and TotalDue from the "Sales.SalesOrderHeader" table

A derived column called "Percent of Sales YTD", calculated as follows:
The value in the "TotalDue" column from Sales.SalesOrderHeader, 
divided by the value in the "SalesYTD" field from the Sales.SalesPerson table,
then multiplied by 100.

**You can connect the two tables by their 
"SalesPersonID" and "BusinessEntityID" fields, respectively.

Return all rows from Sales.SalesOrderHeader 
that have a total due amount greater than $2,000, 
regardless of whether there is a sales person associated with the sale. 
Sort the output by sales order ID, ascending.
*/

SELECT
	A.SalesOrderID,
	A.OrderDate,
	A.TotalDue,
	A.TotalDue / B.SalesYTD * 100 AS [Percent of Sales YTD]
FROM AdventureWorks2019.Sales.SalesOrderHeader A
	LEFT JOIN AdventureWorks2019.Sales.SalesPerson B
		ON A.SalesPersonID = B.BusinessEntityID
WHERE A.TotalDue > 2000
ORDER BY A.SalesOrderID;


/*
Exercise 2

Modify your query from  Exercise 1 such that only records from Sales.SalesOrderHeader 
where the Sales YTD value is less than $2,000,000 are included. 
The overall number of records returned by your query should not change.
*/

SELECT
	A.SalesOrderID,
	A.OrderDate,
	A.TotalDue,
	A.TotalDue / B.SalesYTD * 100 AS [Percent of Sales YTD]
FROM AdventureWorks2019.Sales.SalesOrderHeader A
	LEFT JOIN AdventureWorks2019.Sales.SalesPerson B
		ON A.SalesPersonID = B.BusinessEntityID
		AND B.SalesYTD < 2000000
WHERE A.[TotalDue] > 2000
ORDER BY A.SalesOrderID;


/*
Exercise 3

Add the "SalesOrderDetailID" and "LineTotal" columns 
from the "Sales.SalesOrderDetail" table to your Exercise 2 query. 
Only include records in your output where a match is found in this query.

I'll leave it to you to figure out which field to join on (it's pretty intuitive).

NOTE - you are likely to find that the record count of your query increases 
substantially. 
This is because there is a one to many relationship between 
Sales.SalesOrderHeader and Sales.SalesOrderDetail, 
with each sales order being composed of potentially many individual items.
*/

SELECT
	A.SalesOrderID,
	A.OrderDate,
	A.TotalDue,
	A.TotalDue / B.SalesYTD * 100 AS [Percent of Sales YTD],
	C.SalesOrderDetailID,
	C.LineTotal
FROM AdventureWorks2019.Sales.SalesOrderHeader A
	LEFT JOIN AdventureWorks2019.Sales.SalesPerson B
		ON A.SalesPersonID = B.BusinessEntityID
		AND B.SalesYTD < 2000000
	JOIN AdventureWorks2019.Sales.SalesOrderDetail C
		ON A.SalesOrderID = C.SalesOrderID
WHERE A.[TotalDue] > 2000
ORDER BY A.SalesOrderID;
