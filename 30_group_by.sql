/*
Exercise 1

Display the count of products in the Production.Product table, 
broken out by color.
*/
SELECT
	Color,
	COUNT(ProductID) AS ProductCount
FROM AdventureWorks2019.Production.Product
GROUP BY Color;


/*
Exercise 2

Modify your code from Exercise 1 by breaking out the product count 
by color AND style.

Then add a new column with the sum of the list prices for each group.
*/

SELECT
	Color,
	Style,
	COUNT(ProductID) AS ProductCount,
	SUM(ListPrice) AS SumListPrice
FROM AdventureWorks2019.Production.Product
GROUP BY Color, Style;


/*Exercise 3

You are not limited to only grouping by individual fields in your data; you can actually group by derived fields as well! You just have to make sure that you include the same derived field in both your SELECT and GROUP BY.

With that in mind, "prettify" your output from Exercise 2 by displaying "No color" in the "Color" column in place of NULL values, and "NA" in the "Style" column in place of NULL values.

HINT: The ISNULL function could be handy here.*/

SELECT
	ISNULL(Color, 'No color') AS Color,
	ISNULL(Style, 'NA') AS Style,
	COUNT(ProductID) AS ProductCount,
	SUM(ListPrice) AS SumListPrice
FROM AdventureWorks2019.Production.Product
GROUP BY ISNULL(Color, 'No color'), 
		ISNULL(Style, 'NA');