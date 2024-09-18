/*
Exercise 1

Select the "FirstName" and "LastName" columns from the "Person.Person" table (all rows). 
Now add a derived column called "Nickname", which is created by 
combining the first character of the the first name, a hyphen (-), 
and the first three characters of the last name.

*/

SELECT
	FirstName,
	LastName,
	[Nickname] = CONCAT_WS('-', LEFT(FirstName, 1), LEFT(LastName, 3))
FROM AdventureWorks2019.Person.Person;


/*
Exercise 2

Select the following columns (all rows) from the "Production.ProductReview" table:

ReviewerName

Comments

Cleaned Comments - a derived column in which all commas AND periods from the "Comments" field 
have been replaced with empty strings. 
HINT - you will have to nest multiple REPLACE functions.
*/

SELECT
	ReviewerName,
	Comments,
	[Cleaned Comments] = REPLACE(REPLACE(Comments, ',', ''), '.', '')
FROM AdventureWorks2019.Production.ProductReview;


/*
Exercise 3

There are a LOT of text functions in SQL. 
More than you could possibly scrunch into a single course or book 
without it turning into an encyclopedia. 
As such, you will frequently find yourself using Google or Bing to look up functions 
that accomplish specific tasks. Let's practice that here.

Select the "FirstName" column from the "Person.Person" table (all rows). 
Now add the following derived columns:

FirstNameUpper, which features the first name entirely capitalized

FirstNameLower, which consists of the first name transformed entirely to lowercase

HINT - try searching for what you're trying to do (say, convert text to uppercase)
in conjunction with the word "SQL".
*/

SELECT
	FirstName,
	[FirstNameUpper] = UPPER(FirstName),
	[FirstNameLower] = LOWER(FirstName)
FROM AdventureWorks2019.Person.Person