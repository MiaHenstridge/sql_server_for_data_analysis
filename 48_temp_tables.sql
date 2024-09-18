/*
Exercise


Refactor your solution to the exercise from the section on CTEs (average sales/purchases minus top 10) using temp tables in place of CTEs.
*/

SELECT
	DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
	TotalDue,
	ROW_NUMBER() OVER(
		PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
		ORDER BY TotalDue DESC
	) AS OrderRank
INTO #sales_raw
FROM AdventureWorks2019.Sales.SalesOrderHeader

SELECT
	OrderMonth,
	SUM(TotalDue) AS TotalSales
INTO #sales_sum
FROM #sales_raw
WHERE OrderRank > 10
GROUP BY OrderMonth

SELECT
	DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
	TotalDue,
	ROW_NUMBER() OVER(
		PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
		ORDER BY TotalDue DESC
	) AS OrderRank
INTO #purchase_raw
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader

SELECT
	OrderMonth,
	SUM(TotalDue) AS TotalPurchase
INTO #purchase_sum
FROM #purchase_raw
WHERE OrderRank > 10
GROUP BY OrderMonth


SELECT
	FORMAT(#sales_sum.OrderMonth, 'yyyy-MM') AS OrderMonth,
	TotalSales,
	TotalPurchase
FROM #sales_sum 
	LEFT JOIN #purchase_sum
		ON #sales_sum.OrderMonth = #purchase_sum.OrderMonth
ORDER BY OrderMonth


DROP TABLE #sales_raw
DROP TABLE #sales_sum
DROP TABLE #purchase_raw
DROP TABLE #purchase_sum
