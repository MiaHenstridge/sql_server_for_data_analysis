-- exercise 1
-- Select all people from the “Person.Person” table with a first name of “Laura” 
-- and a last name of “Norman”. 
-- Include only the following columns in your output:
-- PersonType
-- Title
-- FirstName
-- LastName

SELECT
	PersonType,
	Title,
	FirstName,
	LastName
FROM AdventureWorks2019.Person.Person
WHERE FirstName = 'Laura' AND LastName = 'Norman';


-- exercise 2
-- Modify your query from Exercise 1 as follows: 
-- Change your criteria to only look for records where the person type 
-- is either “SP”, “EM”, or “VC”.

SELECT
	PersonType,
	Title,
	FirstName,
	LastName
FROM AdventureWorks2019.Person.Person
WHERE PersonType IN ('SP', 'EM', 'VC');