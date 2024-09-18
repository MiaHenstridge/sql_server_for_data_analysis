/*
Exercise 1


Use a recursive CTE to generate a list of all odd numbers between 1 and 100.

Hint: You should be able to do this with just a couple slight tweaks to the code from our first example in the video.
*/

WITH odd_series AS
(
	SELECT 1 AS odd_number
	UNION ALL
	SELECT
		odd_number + 2
	FROM odd_series
	WHERE odd_number < 99
)
SELECT
	odd_number
FROM odd_series
OPTION(MAXRECURSION 1000)


/*
Exercise 2


Use a recursive CTE to generate a date series of all FIRST days of the month (1/1/2021, 2/1/2021, etc.)

from 1/1/2020 to 12/1/2029.

Hints:

Use the DATEADD function strategically in your recursive member.

You may also have to modify MAXRECURSION.
*/

WITH date_series AS
(
	SELECT
		CAST('2020-01-01' AS DATE) AS my_date
	UNION ALL
	SELECT
		DATEADD(MONTH, 1, my_date)
	FROM date_series
	WHERE my_date < CAST('2029-12-01' AS DATE)
)
SELECT
	my_date
FROM date_series
OPTION(MAXRECURSION 1000)
