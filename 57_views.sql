/*
Exercise 1


Create a view named vw_Top10MonthOverMonth in your AdventureWorks database, based on the query below. Assign the view to the Sales schema.

HINT: You will need to make a slight tweak to the query code before it can be successfully converted to a view.
*/

CREATE VIEW Sales.vw_Top10MonthOverMonth AS

	WITH Sales AS
	(
		SELECT
			OrderDate,
			DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS OrderMonth,
			TotalDue,
			ROW_NUMBER() OVER (
				PARTITION BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
				ORDER BY TotalDue DESC
			) AS OrderRank
		FROM AdventureWorks2019.Sales.SalesOrderHeader
	),

	Top10Sales AS
	(
		SELECT
			OrderMonth,
			SUM(TotalDue) AS Top10Total
		FROM Sales
		WHERE OrderRank <= 10
		GROUP BY OrderMonth
	)

	SELECT
		A.OrderMonth,
		A.Top10Total,
		B.Top10Total AS PrevTop10Total
	FROM Top10Sales A
		LEFT JOIN Top10Sales B
			ON A.OrderMonth = DATEADD(MONTH, 1, B.OrderMonth)
	--ORDER BY OrderMonth

SELECT TOP(100)
 *
FROM Sales.vw_Top10MonthOverMonth

/*
--Exercise 2:

/*

As you probably found out, If you try to use a temporary table in a view definition, you'll
receive an error.

In SQL Server, you cannot include temporary tables (either local or global) as part of a
view definition. Temporary tables have a limited scope and lifespan; they exist only for the
duration of a user session or the scope of the routine they were created in. Because of this
transient nature, they cannot be used as part of a view, which should have a more permanent
and consistent structure.

*/
*/