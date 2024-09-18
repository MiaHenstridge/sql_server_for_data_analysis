-- exercise 1
-- Using SELECT *, select all columns AND rows from the “Sales.Customer” table .

SELECT *
FROM AdventureWorks2019.Sales.Customer;


-- exercise 2
-- Select all columns and the top 100 rows from the “Production.Product” table, using SELECT *.

SELECT TOP (100) *
FROM AdventureWorks2019.Production.Product;