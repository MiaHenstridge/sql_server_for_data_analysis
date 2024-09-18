/*
Exercise 1

Select all rows from the "Production.Product" table 
where the weight is less than 10 pounds. 
Make sure to include NULL values in your output, and use ISNULL to accomplish this.

Include the following columns in your output:

Name

Color
*/

SELECT
	Name,
	Color
	--Weight
FROM AdventureWorks2019.Production.Product
WHERE ISNULL(Weight, 0) < 10;


/*
Exercise 2

Modify the "Color" field of your query from Exercise 1 
such that NULL values are replaced with the word "None".
*/

SELECT
	Name,
	ISNULL(Color, 'None') AS Color
	--Weight
FROM AdventureWorks2019.Production.Product
WHERE ISNULL(Weight, 0) < 10;