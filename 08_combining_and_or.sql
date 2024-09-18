-- exercise 1
-- Select all rows from the "HumanResources.Employee" table 
-- where gender = "F", 
-- AND the job title is either "Network Manager" or "Application Specialist". 
-- Select all columns using the "SELECT *" shortcut.

SELECT *
FROM AdventureWorks2019.HumanResources.Employee
WHERE Gender = 'F'
AND (JobTitle = 'Network Manager' OR JobTitle = 'Application Specialist');


-- exercise 2
-- Streamline your query from Exercise 1 by using an IN statement to replace the OR. 
-- Try running the modified query without parentheses to see if it still works.

SELECT *
FROM AdventureWorks2019.HumanResources.Employee
WHERE Gender = 'F'
AND JobTitle IN ('Network Manager', 'Application Specialist');


-- exercise 3
-- Select all rows from the "Person.Person" table 
-- where person type = "EM", 
-- AND there is a NULL value in either the "Title" or "MiddleName" fields. 
-- Include the following fields in your query:
-- PersonType (aliased as "Person Type")
-- Title
-- FirstName (aliased as "First Name")
-- MiddleName (aliased as "Middle Name")
-- LastName (aliased as "Last Name")
-- Suffix

SELECT
	PersonType AS [Person Type],
	Title,
	FirstName AS [First Name],
	MiddleName AS [Middle Name],
	LastName AS [Last Name],
	Suffix
FROM AdventureWorks2019.Person.Person
WHERE PersonType = 'EM'
AND (Title IS NULL OR MiddleName IS NULL);


-- BONUS
-- Modify your query from Exercise 3 such that you are now selecting all rows 
-- where person type is either "EM" or "SP" 
-- AND there is a NULL value in either the "Title", "MiddleName", or "Suffix" fields.

SELECT
	PersonType AS [Person Type],
	Title,
	FirstName AS [First Name],
	MiddleName AS [Middle Name],
	LastName AS [Last Name],
	Suffix
FROM AdventureWorks2019.Person.Person
WHERE PersonType IN ('EM', 'SP')
AND (Title IS NULL OR MiddleName IS NULL OR Suffix IS NULL);