/*
Exercise 1

Display the number of purchasing orders in the Purchasing.PurchaseOrderHeader table 
where the total amount due is greater than $20,000.
*/
SELECT
	COUNT(PurchaseOrderID)
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
WHERE TotalDue > 20000;


/*
Exercise 2

Display the sum of all total amounts due for purchasing orders 
in the Purchasing.PurchaseOrderHeader table.
*/

SELECT
	SUM(TotalDue)
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader

/*
Exercise 3

Display the largest single amount due for a purchasing order 
in the Purchasing.PurchaseOrderHeader table.
*/

SELECT
	MAX(TotalDue)
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader

/*
Exercise 4

Display the average of subtotal + freight for all purchasing orders 
in the Purchasing.PurchaseOrderHeader table.
*/
SELECT
	AVG(SubTotal + Freight)
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader