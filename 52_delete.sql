CREATE TABLE #Sales
(
	OrderDate DATE,
	OrderMonth DATE,
	TotalDue MONEY,
	OrderRank INT
)


INSERT INTO #Sales
(
	OrderDate,
	OrderMonth,
	TotalDue,
	OrderRank
)
	SELECT
		OrderDate,
		OrderMonth = DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1),
		TotalDue,
		OrderRank = ROW_NUMBER() OVER(
			PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
			ORDER BY TotalDue DESC
		)
	FROM AdventureWorks2019.Sales.SalesOrderHeader


DELETE FROM #Sales
WHERE OrderRank > 10


SELECT *
FROM #Sales


DROP TABLE #Sales
