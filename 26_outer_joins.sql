/*
Exercise 1

Write a query that combines the 
"BusinessEntityID", "SalesQuota", and "SalesYTD" columns 
from the "Sales.SalesPerson" table, 
with the "Name" column from the "Sales.SalesTerritory" table. 
Alias the "Name" column as "TerritoryName".

Make sure to include all rows from the "Sales.SalesPerson" table 
regardless of whether a match is found in the "Sales.SalesTerritory" table. 
I'll leave it to you to determine which field to use to link the two tables together.
*/
SELECT
	A.BusinessEntityID,
	A.SalesQuota,
	A.SalesYTD,
	B.Name AS TerritoryName
FROM AdventureWorks2019.Sales.SalesPerson A
LEFT JOIN AdventureWorks2019.Sales.SalesTerritory B
	ON A.TerritoryID = B.TerritoryID;


/*
Exercise 2

Modify your query from Exercise 1 to only include rows 
where the YTD sales are less than $2,000,000.
*/
SELECT
	A.BusinessEntityID,
	A.SalesQuota,
	A.SalesYTD,
	B.Name AS TerritoryName
FROM AdventureWorks2019.Sales.SalesPerson A
LEFT JOIN AdventureWorks2019.Sales.SalesTerritory B
	ON A.TerritoryID = B.TerritoryID
WHERE A.SalesYTD < 2000000;


/*
Exercise 3

Change the join in your query from Exercise 2 from an outer join 
to an inner join, and take note of the effect on the query output. 
Are the rows with NULL values in the "TerritoryName" column 
still being included?
*/

SELECT
	A.BusinessEntityID,
	A.SalesQuota,
	A.SalesYTD,
	B.Name AS TerritoryName
FROM AdventureWorks2019.Sales.SalesPerson A
JOIN AdventureWorks2019.Sales.SalesTerritory B
	ON A.TerritoryID = B.TerritoryID
WHERE A.SalesYTD < 2000000;