/*
Exercise


Modify your "dbo.OrdersAboveThreshold" stored procedure once again, such that if a user supplies a value of 3 to the @OrderType parameter, the proc should return all sales AND purchase orders above the specified threshold, with order dates between the specified years.

In this scenario, include an "OrderType" column to the procedure output. This column should have a value of "Sales" for records from the SalesOrderHeader table, and "Purchase" for records from the PurchaseOrderHeader table.



Hints:

Convert your ELSE block to an IF block, so that you now have 3 independent IF blocks.

Make sure that your IF criteria are all mutually exclusive.

Use UNION ALL to "stack" the sales and purchase data.

Alias SalesOrderId/PurchaseOrderID as "OrderID" in their respective UNION-ed queries.
*/

ALTER PROCEDURE dbo.OrdersAboveThreshold(@Threshold MONEY, @StartYear INT, @EndYear INT, @OrderType INT)
AS
BEGIN
	IF @OrderType = 1
		BEGIN
			SELECT
				OrderID = SalesOrderID,
				OrderDate,
				TotalDue
			FROM AdventureWorks2019.Sales.SalesOrderHeader
			WHERE TotalDue > @Threshold
			AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear
		END
	
	IF @OrderType = 2 
		BEGIN
			SELECT
				OrderID = PurchaseOrderID,
				OrderDate,
				TotalDue
			FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
			WHERE TotalDue > @Threshold
			AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear
		END

	IF @OrderType = 3
		BEGIN
			SELECT
				OrderID = SalesOrderID,
				OrderDate,
				TotalDue
			FROM AdventureWorks2019.Sales.SalesOrderHeader
			WHERE TotalDue > @Threshold
			AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear

			UNION ALL

			SELECT
				OrderID = PurchaseOrderID,
				OrderDate,
				TotalDue
			FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
			WHERE TotalDue > @Threshold
			AND YEAR(OrderDate) BETWEEN @StartYear AND @EndYear

		END
END;


EXEC dbo.OrdersAboveThreshold 10000, 2011, 2013, 3