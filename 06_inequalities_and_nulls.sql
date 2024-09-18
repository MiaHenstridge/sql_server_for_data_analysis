-- exercise 1
-- Select any records from the “Person.Person” where the person type is not equal to “IN”. 
-- Do not include the “BusinessEntityID” and “rowguid” fields in your output.

SELECT
	PersonType,
	NameStyle,
	Title,
	FirstName,
	MiddleName,
	LastName,
	Suffix,
	EmailPromotion,
	AdditionalContactInfo,
	Demographics,
	ModifiedDate
FROM AdventureWorks2019.Person.Person
WHERE PersonType IS NULL OR PersonType != 'IN';


-- exercise 2
-- Select all people from the “Person.Person” who have a “Title”. 
-- Do not include the “BusinessEntityID” and “rowguid” fields in your output.

SELECT
	PersonType,
	NameStyle,
	Title,
	FirstName,
	MiddleName,
	LastName,
	Suffix,
	EmailPromotion,
	AdditionalContactInfo,
	Demographics,
	ModifiedDate
FROM AdventureWorks2019.Person.Person
WHERE Title IS NOT NULL;

-- exercise 3
-- Select all people from the “Person.Person” who do NOT have a middle name listed. 
-- Do not include the “BusinessEntityID” and “rowguid” fields in your output.

SELECT
	PersonType,
	NameStyle,
	Title,
	FirstName,
	MiddleName,
	LastName,
	Suffix,
	EmailPromotion,
	AdditionalContactInfo,
	Demographics,
	ModifiedDate
FROM AdventureWorks2019.Person.Person
WHERE MiddleName IS NULL;

-- BONUS
-- Select all people from the “Person.Person” who do NOT have a title of “Mr.”. 
-- Make sure to include NULL values in your result.

SELECT
	PersonType,
	NameStyle,
	Title,
	FirstName,
	MiddleName,
	LastName,
	Suffix,
	EmailPromotion,
	AdditionalContactInfo,
	Demographics,
	ModifiedDate
FROM AdventureWorks2019.Person.Person
WHERE Title IS NULL OR Title != 'Mr.';