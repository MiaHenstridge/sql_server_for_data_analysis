/*
Exercise


Making use of temp tables and UPDATE statements, re-write an optimized version of the query in the "Optimizing With UPDATE - Exercise Starter Code.sql" file, which you'll find in the resources for this section.
*/

-- unoptimized query
SELECT 
	   A.BusinessEntityID
      ,A.Title
      ,A.FirstName
      ,A.MiddleName
      ,A.LastName
	  ,B.PhoneNumber
	  ,PhoneNumberType = C.Name
	  ,D.EmailAddress

FROM AdventureWorks2019.Person.Person A
	LEFT JOIN AdventureWorks2019.Person.PersonPhone B
		ON A.BusinessEntityID = B.BusinessEntityID
	LEFT JOIN AdventureWorks2019.Person.PhoneNumberType C
		ON B.PhoneNumberTypeID = C.PhoneNumberTypeID
	LEFT JOIN AdventureWorks2019.Person.EmailAddress D
		ON A.BusinessEntityID = D.BusinessEntityID


-- optimized query
DROP TABLE IF EXISTS #Person

CREATE TABLE #Person
(
	BusinessEntityID INT,
	Title NVARCHAR(8),
	FirstName NVARCHAR(50),
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50),
	PhoneNumber NVARCHAR(25),
	PhoneNumberTypeID INT,
	PhoneNumberType NVARCHAR(25),
	EmailAddress NVARCHAR(50)
)

INSERT INTO #Person
(
	BusinessEntityID,
	Title,
	FirstName,
	MiddleName,
	LastName
)
	SELECT
		BusinessEntityID,
		Title,
		FirstName,
		MiddleName,
		LastName
	FROM AdventureWorks2019.Person.Person

-- PhoneNumber, PhoneNumberTypeID
UPDATE #Person
SET 
	PhoneNumber = B.PhoneNumber,
	PhoneNumberTypeID = B.PhoneNumberTypeID
		FROM #Person A
			LEFT JOIN AdventureWorks2019.Person.PersonPhone B
				ON A.BusinessEntityID = B.BusinessEntityID


-- PhoneNumberType
UPDATE #Person
SET
	PhoneNumberType = B.Name
		FROM #Person A
			LEFT JOIN AdventureWorks2019.Person.PhoneNumberType B
				ON A.PhoneNumberTypeID = B.PhoneNumberTypeID

-- EmailAddress
UPDATE #Person
SET
	EmailAddress = B.EmailAddress
		FROM #Person A
			LEFT JOIN AdventureWorks2019.Person.EmailAddress B
				ON A.BusinessEntityID = B.BusinessEntityID


SELECT 
	BusinessEntityID,
	Title,
	FirstName,
	MiddleName,
	LastName,
	PhoneNumber,
	PhoneNumberType,
	EmailAddress
FROM #Person


--DROP TABLE #Person