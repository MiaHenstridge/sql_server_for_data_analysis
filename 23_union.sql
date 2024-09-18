/*
Exercise 1

Write a query that selects all rows from the "Purchasing.PurchaseOrderDetail" table 
where the line total is greater than $10,000. 
Include the following columns in your output:

PurchaseOrderID

PurchaseOrderDetailID

OrderQty

LineTotal
*/

SELECT 
	PurchaseOrderID,
	PurchaseOrderDetailID,
	OrderQty,
	LineTotal
FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail
WHERE LineTotal > 10000;


/*
Exercise 2

Write a similar query that selects all rows from the "Sales.SalesOrderDetail" table 
where the line total is greater than $10,000. 
Include the following columns in your output:

SalesOrderID

SalesOrderDetailID

OrderQty

LineTotal
*/

SELECT
	SalesOrderID,
	SalesOrderDetailID,
	OrderQty,
	LineTotal
FROM AdventureWorks2019.Sales.SalesOrderDetail
WHERE LineTotal > 10000;


/*
Exercise 3

Combine the rows from your Exercise 1 and Exercise 2 queries by "stacking" them vertically. 
Make sure the similar fields from each table align. 
Alias the first two columns as "OrderID" and "OrderDetailID", respectively.
*/

SELECT 
	PurchaseOrderID AS OrderID,
	PurchaseOrderDetailID AS OrderDetailID,
	OrderQty,
	LineTotal
FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail
WHERE LineTotal > 10000

UNION

	SELECT
		SalesOrderID AS OrderID,
		SalesOrderDetailID OrderDetailID,
		OrderQty,
		LineTotal
	FROM AdventureWorks2019.Sales.SalesOrderDetail
	WHERE LineTotal > 10000;
	

/*
Exercise 4

Add the following derived fields to your query; 
remember , you'll need to add them to both components of your query. 
Sort the output of your query by line total in descending order.

"RunDate" - displays the current date

"OrderType" - this should display the string "Purchase" for purchase orders, 
and "Sale" for sales orders.
*/

SELECT 
	PurchaseOrderID AS OrderID,
	PurchaseOrderDetailID AS OrderDetailID,
	OrderQty,
	LineTotal,
	CAST(GETDATE() AS DATE) AS RunDate,
	'Purchase' AS OrderType
FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail
WHERE LineTotal > 10000

UNION

	SELECT
		SalesOrderID AS OrderID,
		SalesOrderDetailID OrderDetailID,
		OrderQty,
		LineTotal,
		CAST(GETDATE() AS DATE) AS RunDate,
		'Sale' AS OrderType
	FROM AdventureWorks2019.Sales.SalesOrderDetail
	WHERE LineTotal > 10000

ORDER BY LineTotal DESC;