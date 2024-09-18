/*
Exercise 1

Select all rows from the Person.Person table 
where the first name is abbreviated with a period/dot at the end - for example, "A.". 
Select all columns via the "SELECT *" shortcut.
*/

SELECT *
FROM AdventureWorks2019.Person.Person
WHERE FirstName LIKE '%.';


/*
Exercise 2

Select all people from the Person.Person table 
with the initials "TLC". 
HINT - you'll have to apply criteria to the FirstName, MiddleName, AND LastName columns.

You may select all columns via the "SELECT *" shortcut.
*/

SELECT *
FROM AdventureWorks2019.Person.Person
WHERE FirstName LIKE 'T%'
AND MiddleName LIKE 'L%'
AND LastName LIKE 'C%';


/*
Select all rows from the Person.Person table 
where the first name does not include a vowel (a, e, i, o, or u). 
HINT - you do NOT need to use OR to accomplish this; 
try using a wildcard with brackets ([ ]) instead.

You may select all columns via the "SELECT *" shortcut.
*/

SELECT *
FROM AdventureWorks2019.Person.Person
WHERE FirstName NOT LIKE '%[aeiou]%';
