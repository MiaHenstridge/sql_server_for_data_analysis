/*
Exercise


Rewrite your solution from last video's exercise using CREATE and INSERT instead of SELECT INTO.
*/
-- drop tables if already exists
DROP TABLE IF EXISTS #sales_raw
DROP TABLE IF EXISTS #sales_sum
DROP TABLE IF EXISTS #purchase_raw
DROP TABLE IF EXISTS #purchase_sum

-- create and insert into #sales_raw
CREATE TABLE #sales_raw
(
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)


INSERT INTO #sales_raw
(
	OrderMonth,
	TotalDue,
	OrderRank
)
	SELECT
		DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
		TotalDue,
		ROW_NUMBER() OVER(
			PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
			ORDER BY TotalDue DESC
		) AS OrderRank
	FROM AdventureWorks2019.Sales.SalesOrderHeader


-- create and insert into #sales_sum
CREATE TABLE #sales_sum
(
	OrderMonth DATE,
	TotalSales MONEY
)

INSERT INTO #sales_sum
(
	OrderMonth,
	TotalSales
)
	SELECT
		OrderMonth,
		SUM(TotalDue) AS TotalSales
	FROM #sales_raw
	WHERE OrderRank > 10
	GROUP BY OrderMonth

-- create and insert into #purchase_raw
CREATE TABLE #purchase_raw
(
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)

INSERT INTO #purchase_raw
(
	OrderMonth,
	TotalDue,
	OrderRank
)
	SELECT
		DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
		TotalDue,
		ROW_NUMBER() OVER(
			PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
			ORDER BY TotalDue DESC
		) AS OrderRank
	FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader


-- create and insert into #purchase_sum
CREATE TABLE #purchase_sum
(
	OrderMonth DATE,
	TotalPurchase MONEY
)

INSERT INTO #purchase_sum
(
	OrderMonth,
	TotalPurchase
)
	SELECT
		OrderMonth,
		SUM(TotalDue) AS TotalPurchase
	FROM #purchase_raw
	WHERE OrderRank > 10
	GROUP BY OrderMonth


-- Final query
SELECT
	FORMAT(#sales_sum.OrderMonth, 'yyyy-MM') AS OrderMonth,
	TotalSales,
	TotalPurchase
FROM #sales_sum 
	LEFT JOIN #purchase_sum
		ON #sales_sum.OrderMonth = #purchase_sum.OrderMonth
ORDER BY OrderMonth

-- drop temp tables
DROP TABLE #sales_raw
DROP TABLE #sales_sum
DROP TABLE #purchase_raw
DROP TABLE #purchase_sum