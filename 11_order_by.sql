/*
Exercise 1

Select all rows and the following columns from the HumanResources.Employee table:

OrganizationLevel (alias as "Organization Level")

JobTitle (alias as "Job Title")

VacationHours (alias as "Vacation Hours")

SickLeaveHours (alias as "Sick Leave Hours")

Sort your output first by OrganizationLevel in ascending order, 
then VacationHours in descending order.
*/

SELECT
	OrganizationLevel AS [Organizational Level],
	JobTitle AS [Job Title],
	VacationHours AS [Vacation Hours],
	SickLeaveHours AS [Sick Leave Hours]
FROM AdventureWorks2019.HumanResources.Employee
ORDER BY OrganizationLevel, VacationHours DESC;


/*
Exercise 2

Modify your query from Exercise 1 to use your column aliases, 
rather than the actual column names in the database table, in the ORDER BY.
*/

SELECT
	OrganizationLevel AS [Organizational Level],
	JobTitle AS [Job Title],
	VacationHours AS [Vacation Hours],
	SickLeaveHours AS [Sick Leave Hours]
FROM AdventureWorks2019.HumanResources.Employee
ORDER BY [Organizational Level], [Vacation Hours] DESC;


/*
Exercise 3

Modify your query from Exercise 2 
to use the position of the columns in the query output 
(for example, 1 for the first column) in the ORDER BY 
as opposed to the column aliases.
*/

SELECT
	OrganizationLevel AS [Organizational Level],
	JobTitle AS [Job Title],
	VacationHours AS [Vacation Hours],
	SickLeaveHours AS [Sick Leave Hours]
FROM AdventureWorks2019.HumanResources.Employee
ORDER BY 1, 3 DESC;

