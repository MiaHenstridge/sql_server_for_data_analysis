/*
Exercise 1


Write a query that outputs all records from the Purchasing.PurchaseOrderHeader table. Include the following columns from the table:

PurchaseOrderID

VendorID

OrderDate

TotalDue

Add a derived column called NonRejectedItems which returns, for each purchase order ID in the query output, the number of line items from the Purchasing.PurchaseOrderDetail table which did not have any rejections (i.e., RejectedQty = 0). Use a correlated subquery to do this.
*/

SELECT
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TotalDue,
	(
		SELECT
			SUM(OrderQty)
		FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
		WHERE RejectedQty = 0 AND B.PurchaseOrderID = A.PurchaseOrderID
	) AS NonRejectedItems
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A;

/*
Exercise 2


Modify your query to include a second derived field called MostExpensiveItem.

This field should return, for each purchase order ID, the UnitPrice of the most expensive item for that order in the Purchasing.PurchaseOrderDetail table.

Use a correlated subquery to do this as well.
*/

SELECT
	PurchaseOrderID,
	VendorID,
	OrderDate,
	TotalDue,
	(
		SELECT
			SUM(B.OrderQty)
		FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
		WHERE RejectedQty = 0 AND B.PurchaseOrderID = A.PurchaseOrderID
	) AS NonRejectedItems,
	(
		SELECT
			MAX(B.UnitPrice)
		FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
		WHERE B.PurchaseOrderID = A.PurchaseOrderID
	) AS MostExpensiveItem
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A;