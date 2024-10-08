/*
Exercise 1


Using your solution query to Exercise 4 from the ROW_NUMBER exercises as a staring point, add a derived column called �Category Price Rank With Rank� that uses the RANK function to rank all products by ListPrice � within each category - in descending order. Observe the differences between the �Category Price Rank� and �Category Price Rank With Rank� fields.
*/

SELECT
	A.Name AS ProductName,
	A.ListPrice,
	B.Name AS ProductSubcategory,
	C.Name AS ProductCategory,
	ROW_NUMBER() OVER (ORDER BY A.ListPrice DESC) AS [Price Rank],
	ROW_NUMBER() OVER (PARTITION BY C.Name ORDER BY A.ListPrice DESC) AS [Category Price Rank],
	CASE
		WHEN ROW_NUMBER() OVER (PARTITION BY C.Name ORDER BY A.ListPrice DESC) <= 5 THEN 'Yes'
		ELSE 'No'
	END AS [Top 5 Price In Category],
	RANK() OVER(PARTITION BY C.Name ORDER BY A.ListPrice DESC) AS [Category Price Rank With Rank]
FROM AdventureWorks2019.Production.Product A
	JOIN AdventureWorks2019.Production.ProductSubcategory B
		ON A.ProductSubcategoryID = B.ProductSubcategoryID
	JOIN AdventureWorks2019.Production.ProductCategory C
		ON B.ProductCategoryID = C.ProductCategoryID


/*
Exercise 2


Modify your query from Exercise 2 by adding a derived column called "Category Price Rank With Dense Rank" that that uses the DENSE_RANK function to rank all products by ListPrice � within each category - in descending order. Observe the differences among the �Category Price Rank�, �Category Price Rank With Rank�, and �Category Price Rank With Dense Rank� fields.
*/

SELECT
	A.Name AS ProductName,
	A.ListPrice,
	B.Name AS ProductSubcategory,
	C.Name AS ProductCategory,
	ROW_NUMBER() OVER (
		ORDER BY A.ListPrice DESC
	) AS [Price Rank],
	ROW_NUMBER() OVER (
		PARTITION BY C.Name 
		ORDER BY A.ListPrice DESC
	) AS [Category Price Rank],
	CASE
		WHEN ROW_NUMBER() OVER (
			PARTITION BY C.Name 
			ORDER BY A.ListPrice DESC
		) <= 5 THEN 'Yes'
		ELSE 'No'
	END AS [Top 5 Price In Category],
	RANK() OVER(
		PARTITION BY C.Name 
		ORDER BY A.ListPrice DESC
	) AS [Category Price Rank With Rank],
	DENSE_RANK() OVER(
		PARTITION BY C.Name 
		ORDER BY A.ListPrice DESC
	) AS [Category Price Rank With Dense Rank]
FROM AdventureWorks2019.Production.Product A
	JOIN AdventureWorks2019.Production.ProductSubcategory B
		ON A.ProductSubcategoryID = B.ProductSubcategoryID
	JOIN AdventureWorks2019.Production.ProductCategory C
		ON B.ProductCategoryID = C.ProductCategoryID


/*
Exercise 3


Examine the code you wrote to define the �Top 5 Price In Category� field back in the ROW_NUMBER exercises. Now that you understand the differences among ROW_NUMBER, RANK, and DENSE_RANK, consider which of these functions would be most appropriate to return a true top 5 products by price, assuming we want to see the top 5 distinct prices AND we want �ties� (by price) to all share the same rank.
*/

SELECT
	A.Name AS ProductName,
	A.ListPrice,
	B.Name AS ProductSubcategory,
	C.Name AS ProductCategory,
	ROW_NUMBER() OVER (
		ORDER BY A.ListPrice DESC
	) AS [Price Rank],
	ROW_NUMBER() OVER (
		PARTITION BY C.Name 
		ORDER BY A.ListPrice DESC
	) AS [Category Price Rank],
	CASE
		WHEN DENSE_RANK() OVER (
			PARTITION BY C.Name 
			ORDER BY A.ListPrice DESC
		) <= 5 THEN 'Yes'
		ELSE 'No'
	END AS [Top 5 Price In Category],
	RANK() OVER(
		PARTITION BY C.Name 
		ORDER BY A.ListPrice DESC
	) AS [Category Price Rank With Rank],
	DENSE_RANK() OVER(
		PARTITION BY C.Name 
		ORDER BY A.ListPrice DESC
	) AS [Category Price Rank With Dense Rank]
FROM AdventureWorks2019.Production.Product A
	JOIN AdventureWorks2019.Production.ProductSubcategory B
		ON A.ProductSubcategoryID = B.ProductSubcategoryID
	JOIN AdventureWorks2019.Production.ProductCategory C
		ON B.ProductCategoryID = C.ProductCategoryID