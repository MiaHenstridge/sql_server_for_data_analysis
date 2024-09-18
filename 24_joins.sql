/*
Exercise  1

Write a query that combines the "FirstName" and "LastName" columns 
from the "Person.Person" table, 
with the "EmailAddress" column from the "Person.EmailAddress" table. 
HINT - these tables have the "BusinessEntityID" field in common.
*/

SELECT
	A.FirstName,
	A.LastName,
	B.EmailAddress
FROM AdventureWorks2019.Person.Person A
JOIN AdventureWorks2019.Person.EmailAddress B
ON A.BusinessEntityID = B.BusinessEntityID;


/*
Exercise 2

Write a query that combines the "Name" and "ListPrice" columns 
from the "Production.Product" table, 
with the "ReviewerName" and "Comments" columns from the "Production.ProductReview" table. 
HINT - these tables have the "ProductID" field in common.
*/

SELECT
	A.Name,
	A.ListPrice,
	B.ReviewerName,
	B.Comments
FROM AdventureWorks2019.Production.Product A
JOIN AdventureWorks2019.Production.ProductReview B
ON A.ProductID = B.ProductID;