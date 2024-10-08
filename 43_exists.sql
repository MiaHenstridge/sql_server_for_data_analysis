/*
Exercise 1


Select all records from the Purchasing.PurchaseOrderHeader table such that there is at least one item in the order with an order quantity greater than 500. The individual items tied to an order can be found in the Purchasing.PurchaseOrderDetail table.

Select the following columns:

PurchaseOrderID

OrderDate

SubTotal

TaxAmt

Sort by purchase order ID.
*/

SELECT
	t1.PurchaseOrderID,
	t1.OrderDate,
	t1.SubTotal,
	t1.TaxAmt
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader t1
WHERE EXISTS (
	SELECT 1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail t2
	WHERE t2.OrderQty > 500 AND t2.PurchaseOrderID = t1.PurchaseOrderID
)
ORDER BY PurchaseOrderID;


/*
Exercise 2


Modify your query from Exercise 1 as follows:



Select all records from the Purchasing.PurchaseOrderHeader table such that there is at least one item in the order with an order quantity greater than 500, AND a unit price greater than $50.00.

Select ALL columns from the Purchasing.PurchaseOrderHeader table for display in your output.

Even if you have aliased this table to enable the use of a JOIN or EXISTS, you can still use the SELECT * shortcut to do this. Assuming you have aliased your table "A", simply use "SELECT A.*" to select all columns from that table.
*/

SELECT
	t1.*
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader t1
WHERE EXISTS (
	SELECT 1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail t2
	WHERE t2.OrderQty > 500 
		AND t2.UnitPrice > 50
		AND t2.PurchaseOrderID = t1.PurchaseOrderID
)
ORDER BY PurchaseOrderID;


/*
Exercise 3


Select all records from the Purchasing.PurchaseOrderHeader table such that NONE of the items within the order have a rejected quantity greater than 0.

Select ALL columns from the Purchasing.PurchaseOrderHeader table using the "SELECT *" shortcut.
*/

SELECT
	t1.*
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader t1
WHERE NOT EXISTS (
	SELECT 1
	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail t2
	WHERE t2.RejectedQty > 0
		AND t2.PurchaseOrderID = t1.PurchaseOrderID
)
ORDER BY t1.PurchaseOrderID

--SELECT
--	PurchaseOrderDetailID,
--	RejectedQty
--FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail
--WHERE PurchaseOrderID = 74