/*
Exercise 1


Create a query with the following columns:



“OrderMonth”, a derived column (you’ll have to create this one yourself) featuring the month number corresponding with the Order Date in a given row

“OrderYear”, a derived column featuring the year corresponding with the Order Date in a given row

“SubTotal” from the Purchasing.PurchaseOrderHeader table



Your query should be an aggregate query – specifically, it should sum “SubTotal”, and group by the remaining fields.
*/
SELECT
	MONTH(OrderDate) AS OrderMonth,
	YEAR(OrderDate) AS OrderYear,
	SUM(SubTotal) AS SubTotal
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)


/*
Exercise 2


Modify your query from Exercise 1 by adding a derived column called "Rolling3MonthTotal", that displays  - for a given row - a running total of “SubTotal” for the prior three months (including the current row).

HINT: You will need to include multiple fields in your ORDER BY to get this to work!
*/
SELECT
	t1.OrderMonth,
	t1.OrderYear,
	t1.SubTotal,
	SUM(t1.SubTotal) OVER(ORDER BY t1.OrderYear, t1.OrderMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Rolling3MonthTotal 
FROM (
	SELECT
		MONTH(OrderDate) AS OrderMonth,
		YEAR(OrderDate) AS OrderYear,
		SUM(SubTotal) AS SubTotal
	FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
	GROUP BY YEAR(OrderDate), MONTH(OrderDate)
) t1


/*
Exercise 3


Modify your query from Exercise 3 by adding another derived column called "MovingAvg6Month", that calculates a rolling average of “SubTotal” for the previous 6 months, relative to the month in the “current” row. Note that this average should NOT include the current row.
*/

SELECT
	t1.OrderMonth,
	t1.OrderYear,
	t1.SubTotal,
	SUM(t1.SubTotal) OVER(
		ORDER BY t1.OrderYear, t1.OrderMonth 
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) AS Rolling3MonthTotal,
	AVG(t1.SubTotal) OVER(
		ORDER BY t1.OrderYear, t1.OrderMonth
		ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING
	) AS MovingAvg6Month
FROM (
	SELECT
		MONTH(OrderDate) AS OrderMonth,
		YEAR(OrderDate) AS OrderYear,
		SUM(SubTotal) AS SubTotal
	FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
	GROUP BY YEAR(OrderDate), MONTH(OrderDate)
) t1


/*
Exercise 4


Modify your query from Exercise 3 by adding (yet) another derived column called “MovingAvgNext2Months” , that calculates a rolling average of “SubTotal” for the month in the current row and the next two months after that. This moving average will provide a kind of "forecast" for Subtotal by month.
*/

SELECT
	t1.OrderMonth,
	t1.OrderYear,
	t1.SubTotal,
	SUM(t1.SubTotal) OVER(
		ORDER BY t1.OrderYear, t1.OrderMonth 
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) AS Rolling3MonthTotal,
	AVG(t1.SubTotal) OVER(
		ORDER BY t1.OrderYear, t1.OrderMonth
		ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING
	) AS MovingAvg6Month,
	AVG(t1.SubTotal) OVER(
		ORDER BY t1.OrderYear, t1.OrderMonth
		ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
	) AS MovingAvgNext2Months
FROM (
	SELECT
		MONTH(OrderDate) AS OrderMonth,
		YEAR(OrderDate) AS OrderYear,
		SUM(SubTotal) AS SubTotal
	FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader
	GROUP BY YEAR(OrderDate), MONTH(OrderDate)
) t1

