-- exercise 1
-- Select the first 3,000 rows from the Person.Person table. 
-- Display only the Title, LastName, and FirstName columns, in that order.

SELECT TOP (3000)
	Title,
	LastName,
	FirstName
FROM AdventureWorks2019.Person.Person;


-- exercise 2
-- Select the first 500 rows from the Sales.SalesOrderHeader table. 
-- Display only the OrderDate, DueDate, ShipDate, and TotalDue columns, in that order.

SELECT TOP (500)
	OrderDate,
	DueDate,
	ShipDate,
	TotalDue
FROM AdventureWorks2019.Sales.SalesOrderHeader;

-- exercise 3
-- Select the first 100 rows from the Sales.SalesPerson table. 
-- Display only the SalesLastYear and SalesYTD columns, in that order.

SELECT TOP (100)
	SalesLastYear,
	SalesYTD
FROM AdventureWorks2019.Sales.SalesPerson;