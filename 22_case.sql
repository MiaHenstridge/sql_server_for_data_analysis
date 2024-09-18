/*
Exercise 1

Select a derived column called "Price Category" from the "Production.Product" table 
such that:

If the list price is greater than $1,000, return "Premium".

If the list price is greater than $100 and less than $1,000, return "Mid-Range".

If the list price is less than $100, return "Value". This should be the default case.

Also include Name and ListPrice as columns in your output.
*/

SELECT
	Name,
	ListPrice,
	CASE
		WHEN ListPrice > 1000 THEN 'Premium'
		WHEN ListPrice BETWEEN 100 AND 1000 THEN 'Mid-Range'
		ELSE 'Value'
	END AS [Price Category]
FROM AdventureWorks2019.Production.Product;


/*
Exercise 2

Select a derived column called "Employee Tenure" from the "HumanResources.Employee" table such that:

If an employee is salaried, and has been with the company 10 or more years 
(calculated as the DATEDIFF in YEARs between the "HireDate" value and the current date), 
return "Non-Exempt - 10+ Years".

If an employee is salaried, and has been with the company less than 10 years, 
return "Non-Exempt - < 10 Years".

If an employee is NOT salaried, and has been with the company 10 or more years 
(calculated as the DATEDIFF in YEARs between the "HireDate" value and the current date), 
return "Exempt - 10+ Years".

If an employee is NOT salaried, and has been with the company less than 10 years, 
return "Exempt - < 10 Years". This should be the default case.

Also include BusinessEntityID, HireDate, and SalariedFlag as columns in your output.
*/

SELECT
	BusinessEntityID,
	HireDate,
	SalariedFlag,
	[Employee Tenure] =
		CASE
			WHEN SalariedFlag = 1 THEN 
				CASE
					WHEN DATEDIFF(YEAR, HireDate, GETDATE()) >= 10 THEN 'Non-Exempt - 10+ Years'
					ELSE 'Non-Exempt - < 10 Years'
				END
			ELSE 
				CASE
					WHEN DATEDIFF(YEAR, HireDate, GETDATE()) >= 10 THEN 'Exempt - 10+ Years'
					ELSE 'Exempt - 10+ Years'
				END 
		END
FROM AdventureWorks2019.HumanResources.Employee;