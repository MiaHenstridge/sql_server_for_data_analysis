/*
Exercise 1


Update your calendar lookup table with a few holidays of your choice that always fall on the same day of the year - for example, New Year's.
*/

DROP TABLE IF EXISTS AdventureWorks2019.dbo.Calendar

CREATE TABLE AdventureWorks2019.dbo.Calendar
(
	DateValue DATE,
	DayOfWeekNumber INT,
	DayOfWeekName VARCHAR(32),
	DayOfMonthNumber INT,
	MonthNumber INT,
	YearNumber INT,
	WeekendFlag TINYINT,
	HolidayFlag TINYINT
)

--TRUNCATE TABLE AdventureWorks2019.dbo.Calendar

-- recursion to create dates
WITH Dates AS
(
	SELECT
		CAST('2011-01-01' AS DATE) AS MyDate
	UNION ALL
	SELECT
		DATEADD(DAY, 1, MyDate)
	FROM Dates
	WHERE MyDate < CAST('2030-12-31' AS DATE)
)
INSERT INTO AdventureWorks2019.dbo.Calendar
(
	DateValue
)
SELECT
	MyDate
FROM Dates
OPTION (MAXRECURSION 10000)


-- Update 
UPDATE AdventureWorks2019.dbo.Calendar
SET
	DayOfWeekNumber = DATEPART(WEEKDAY, DateValue),
	DayOfWeekName = FORMAT(DateValue, 'dddd'),
	DayOfMonthNumber = DAY(DateValue),
	MonthNumber = MONTH(DateValue),
	YearNumber = YEAR(DateValue)


UPDATE AdventureWorks2019.dbo.Calendar
SET 
	WeekendFlag = 
		CASE
			WHEN DayOfWeekNumber IN (1, 7) THEN 1
			ELSE 0
		END


UPDATE AdventureWorks2019.dbo.Calendar
SET 
	HolidayFlag = 
		CASE
			WHEN 
				(DayOfMonthNumber = 1 AND MonthNumber = 1) OR
				(DayOfMonthNumber = 24 AND MonthNumber = 12) OR
				(DayOfMonthNumber = 22 AND MonthNumber = 10) 
				THEN 1
			ELSE 0
		END

/*
Exercise 2


Using your updated calendar table, pull all purchasing orders that were made on a holiday. It's fine to simply select all columns via SELECT *.
*/

SELECT
	A.*
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
	JOIN AdventureWorks2019.dbo.Calendar B
		ON A.OrderDate = B.DateValue
WHERE B.HolidayFlag = 1


/*
Exercise 3


Again using your updated calendar table, now pull all purchasing orders that were made on a holiday that also fell on a weekend.
*/

SELECT
	A.*
FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A
	JOIN AdventureWorks2019.dbo.Calendar B
		ON A.OrderDate = B.DateValue
WHERE B.HolidayFlag = 1 AND B.WeekendFlag = 1