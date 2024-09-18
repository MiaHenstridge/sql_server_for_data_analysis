/*
CTEs - Exercise
For this exercise, assume the CEO of our fictional company decided that the top 10 orders per month are actually outliers that need to be clipped out of our data before doing meaningful analysis.

Further, she would like the sum of sales AND purchases (minus these "outliers") listed side by side, by month.

We've got a query that already does this (see the file "CTEs - Exercise Starter Code.sql" in the resources for this section), but it's messy and hard to read. Re-write it using a CTE so other analysts can read and understand the code.
*/

WITH sales_raw AS
(
	SELECT
		DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
		TotalDue,
		ROW_NUMBER() OVER(
			PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
			ORDER BY TotalDue DESC
		) AS OrderRank
	FROM AdventureWorks2019.Sales.SalesOrderHeader
),
sales_sum AS
(
	SELECT
		OrderMonth,
		SUM(TotalDue) AS TotalSales
	FROM sales_raw
	WHERE OrderRank > 10
	GROUP BY OrderMonth
),
purchase_raw AS
(
	SELECT
		DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
		TotalDue,
		ROW_NUMBER() OVER(
			PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
			ORDER BY TotalDue DESC
		) AS OrderRank
	FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
),
purchase_sum AS
(
	SELECT
		OrderMonth,
		SUM(TotalDue) AS TotalPurchase
	FROM purchase_raw
	WHERE OrderRank > 10
	GROUP BY OrderMonth
)
SELECT
	FORMAT(sales_sum.OrderMonth, 'yyyy-MM') AS OrderMonth,
	TotalSales,
	TotalPurchase
FROM sales_sum 
	LEFT JOIN purchase_sum
		ON sales_sum.OrderMonth = purchase_sum.OrderMonth
ORDER BY OrderMonth