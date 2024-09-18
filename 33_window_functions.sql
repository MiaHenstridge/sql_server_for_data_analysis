SELECT
	A.FirstName,
	A.LastName,
	B.JobTitle,
	C.Rate,
	AVG(C.Rate) OVER() AS AverageRate,
	MAX(C.Rate) OVER() AS MaximumRate,
	C.Rate - AVG(C.Rate) OVER() AS DiffFromAvgRate,
	C.Rate / MAX(C.Rate) OVER() * 100 AS PercentofMaxRate
FROM AdventureWorks2019.Person.Person A
	JOIN AdventureWorks2019.HumanResources.Employee B
		ON A.BusinessEntityID = B.BusinessEntityID
	JOIN AdventureWorks2019.HumanResources.EmployeePayHistory C
		ON A.BusinessEntityID = C.BusinessEntityID