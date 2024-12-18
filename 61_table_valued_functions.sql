/*
Exercise


Create a table-valued function called ufn_ProductsByPriceRange, assigned to the Production schema. Your solution should meet the following requirements:



The function should return a result set consisting of all products from the Production.Product table with a “ListPrice” between a user-specified minimum and a user-specified maximum.

(This of course means your function will need to take two parameters; one for the minimum list price, and one for the maximum list price.)

The result set returned by the function should include the “ProductID”, “Name”, and “ListPrice” columns.
*/

CREATE FUNCTION Production.ufn_ProductsByPriceRange(@MinPrice MONEY, @MaxPrice MONEY)

RETURNS TABLE

AS

RETURN
(
	SELECT
		ProductID,
		Name,
		ListPrice
	FROM AdventureWorks2019.Production.Product
	WHERE ListPrice BETWEEN @MinPrice AND @MaxPrice
)


SELECT *
FROM Production.ufn_ProductsByPriceRange(1000, 2000)
