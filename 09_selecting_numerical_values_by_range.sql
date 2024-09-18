/*
Exercise 1

Select all rows from the "Purchasing.PurchaseOrderHeader" table 
where the total due amount is greater than $50,000 
and the freight amount is less than $1,000. 
Include the following columns in your output:

OrderDate

SubTotal

TaxAmt

Freight

TotalDue
*/

SELECT
	OrderDate,
	SubTotal,
	TaxAmt,
	Freight,
	TotalDue
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
WHERE TotalDue > 50000
AND Freight < 1000;

/*
exercise 2
Using the BETWEEN keyword, modify your query from Exercise 1 
such that you are now pulling in all rows 
where the subtotal amount is between $10,000 and $30,000.
*/

SELECT
	OrderDate,
	SubTotal,
	TaxAmt,
	Freight,
	TotalDue
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
WHERE SubTotal BETWEEN 10000 AND 30000;


/*
Exercise 3

Modify your query from Exercise 2 such that 
you are NOT including $10,000 and $30,000 in your range of subtotals, 
but still including all amounts between these numbers. 
In other words, the range should no longer be "inclusive".
*/
SELECT
	OrderDate,
	SubTotal,
	TaxAmt,
	Freight,
	TotalDue
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
WHERE SubTotal > 10000 AND SubTotal < 30000;
