/*
Exercise


Leverage TRUNCATE to re-use temp tables in your solution to "CREATE and INSERT" exercise.

Your output should look something like this:
*/

-- drop tables if already exists
DROP TABLE IF EXISTS #raw
DROP TABLE IF EXISTS #total

-- create #raw table
CREATE TABLE #raw
(
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)

-- insert sales data into #raw
INSERT INTO #raw
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

-- create #total table
CREATE TABLE #total
(
	OrderMonth DATE,
	OrderType VARCHAR(32),
	Total MONEY
)

-- insert sales total into #total
INSERT INTO #total
(
	OrderMonth,
	OrderType,
	Total
)
	SELECT
		OrderMonth,
		OrderType = 'Sales',
		SUM(TotalDue) AS Total
	FROM #raw
	WHERE OrderRank > 10
	GROUP BY OrderMonth


-- truncate #raw table
TRUNCATE TABLE #raw

-- insert purchases data into #raw
INSERT INTO #raw
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


-- insert purchases total into #total
INSERT INTO #total
(
	OrderMonth,
	OrderType,
	Total
)
	SELECT
		OrderMonth,
		OrderType = 'Purchases',
		SUM(TotalDue) AS Total
	FROM #raw
	WHERE OrderRank > 10
	GROUP BY OrderMonth


-- final query
SELECT
	A.OrderMonth,
	A.Total AS TotalSales,
	B.Total AS TotalPurchases
--FROM (
--	SELECT
--		OrderMonth,
--		Total AS TotalSales
--	FROM #total
--	WHERE OrderType = 'Sales'
--) A
--LEFT JOIN (
--	SELECT 
--		OrderMonth,
--		Total AS TotalPurchases
--	FROM #total
--	WHERE OrderType = 'Purchases'
--) B
--	ON A.OrderMonth = B.OrderMonth

FROM #total A
	JOIN #total B
		ON A.OrderMonth = B.OrderMonth
			AND B.OrderType = 'Purchases'
WHERE A.OrderType = 'Sales'
ORDER BY OrderMonth

DROP TABLE #raw
DROP TABLE #total