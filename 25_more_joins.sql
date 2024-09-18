/*
Exercise 1

Write a query that combines the "FirstName" and "LastName" columns 
from the "Person.Person" table, 
with the "EmailAddress" column from the "Person.EmailAddress" table, 
AND the "PhoneNumber" field from the "Person.PersonPhone" table.

HINT - these tables all have the "BusinessEntityID" field in common.
*/

SELECT
	A.FirstName,
	A.LastName,
	B.EmailAddress,
	C.PhoneNumber
FROM AdventureWorks2019.Person.Person A
JOIN AdventureWorks2019.Person.EmailAddress B
	ON A.BusinessEntityID = B.BusinessEntityID
JOIN AdventureWorks2019.Person.PersonPhone C
	ON A.BusinessEntityID = C.BusinessEntityID;


/*
Exercise 2

Modify your query from Exercise 1 such that you now only 
pull in phone numbers with a Seattle area code - 
that is to say, phone numbers that start with "206".

HINT - PhoneNumber is a text field, so you will need a text function 
to accomplish this. 
Either LEFT or a wildcard used in conjunction with LIKE should work.
*/
SELECT
	A.FirstName,
	A.LastName,
	B.EmailAddress,
	C.PhoneNumber
FROM AdventureWorks2019.Person.Person A
JOIN AdventureWorks2019.Person.EmailAddress B
	ON A.BusinessEntityID = B.BusinessEntityID
JOIN AdventureWorks2019.Person.PersonPhone C
	ON A.BusinessEntityID = C.BusinessEntityID
WHERE LEFT(C.PhoneNumber, 3) = '206';
--WHERE C.PhoneNumber LIKE '206%';


/*
Exercise 3

Modify your query from Exercise 2 to pull in each person's city 
from the "Person.Address" table.

Note that this table has no fields in common with any of the tables 
already in our join. 
This means we will need to join in another table that we can use as a "bridge" 
between our Person.Address table and our Person.Person table - 
a table that should have fields we can use to connect it to either table.

The table we need is "Person.BusinessEntityAddress"; 
note that it has both "BusinessEntityID" AND "AddressID" fields. 
You will need to join this table to Person.Person, 
and then join Person.Address to this table in order to get your query to work.
*/

SELECT
	A.FirstName,
	A.LastName,
	B.EmailAddress,
	C.PhoneNumber,
	E.City
FROM AdventureWorks2019.Person.Person A
JOIN AdventureWorks2019.Person.EmailAddress B
	ON A.BusinessEntityID = B.BusinessEntityID
JOIN AdventureWorks2019.Person.PersonPhone C
	ON A.BusinessEntityID = C.BusinessEntityID
JOIN AdventureWorks2019.Person.BusinessEntityAddress D
	ON A.BusinessEntityID = D.BusinessEntityID
JOIN AdventureWorks2019.Person.Address E
	ON D.AddressID = E.AddressID
WHERE LEFT(C.PhoneNumber, 3) = '206';