-- exercise 1
-- Modify the query in the “Aliasing Columns – Example Code.sql” file 
-- such that all column names in the query output have spaces between the words.

SELECT
	OrganizationLevel AS [Organizational Level],
	JobTitle AS [Job Title],
	HireDate AS [Hire Date],
	VacationHours AS [Vacation Hours]
FROM AdventureWorks2019.HumanResources.Employee;


-- exercise 2
-- Write a query that outputs the “Name” and “ListPrice” fields from the “Production.Product” table. 
-- These column names in the query output should read “Product Name” and “List Price $$”, respectively.

SELECT
	Name AS [Product Name],
	ListPrice AS [List Price $$]
FROM AdventureWorks2019.Production.Product;


-- exercise 3
-- Write a query that outputs the “PurchaseOrderID”, “OrderQty”, and “LineTotal” fields from the “Purchasing.PurchaseOrderDetail” table. 
-- “PurchaseOrderID” should be renamed to “OrderID”, and “OrderQty” to “OrderQuantity”. “LineTotal” can remain unchanged.

SELECT
	PurchaseOrderID AS OrderID,
	OrderQty AS OrderQuantity,
	LineTotal
FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail;