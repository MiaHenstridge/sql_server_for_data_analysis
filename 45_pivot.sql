/*
Exercise 1
Using PIVOT, write a query against the HumanResources.Employee table

that summarizes the average amount of vacation time for Sales Representatives, Buyers, and Janitors.
*/
SELECT *
FROM
	(
		SELECT
			JobTitle,
			VacationHours
		FROM AdventureWorks2019.HumanResources.Employee
	) t1
	PIVOT(
		AVG(VacationHours)
		FOR JobTitle IN([Sales Representative], [Buyer], [Janitor])
	) t2


/*
Exercise 2


Modify your query from Exercise 1 such that the results are broken out by Gender. Alias the Gender field as "Employee Gender" in your output.

Your output should look like the image below:


*/
SELECT 
	Gender AS [Employee Gender],
	[Sales Representative], 
	[Buyer], 
	[Janitor]
FROM
	(
		SELECT
			Gender,
			JobTitle,
			VacationHours
		FROM AdventureWorks2019.HumanResources.Employee
	) t1
	PIVOT(
		AVG(VacationHours)
		FOR JobTitle IN([Sales Representative], [Buyer], [Janitor])
	) t2