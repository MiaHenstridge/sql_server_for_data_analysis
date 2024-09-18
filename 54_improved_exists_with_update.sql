/*
Exercise


Re-write the query in the "An Improved EXISTS With UPDATE - Exercise Starter Code.sql" file (you can find the file in the Resources for this section), using temp tables and UPDATEs instead of EXISTS.

In addition to the three columns in the original query, you should also include a fourth column called "RejectedQty", which has one value for rejected quantity from the Purchasing.PurchaseOrderDetail table.
*/

-- unoptimized version
--SELECT
--       A.PurchaseOrderID,
--	   A.OrderDate,
--	   A.TotalDue

--FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader A

--WHERE EXISTS (
--	SELECT
--	1
--	FROM AdventureWorks2019.Purchasing.PurchaseOrderDetail B
--	WHERE A.PurchaseOrderID = B.PurchaseOrderID
--		AND B.RejectedQty > 5
--)

--ORDER BY 1

-- optimized version
DROP TABLE IF EXISTS #rejected
-- create table
CREATE TABLE #rejected
(
	PurchaseOrderID INT,
	OrderDate DATE,
	TotalDue MONEY,
	RejectedQty INT
)

-- insert purchasing data into temp table
INSERT INTO #rejected
(
	PurchaseOrderID,
	OrderDate,
	TotalDue
)
	SELECT
		PurchaseOrderID,
		OrderDate,
		TotalDue
	FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader


-- Update RejectedQty field
UPDATE #rejected
SET 
	RejectedQty = B.RejectedQty
		FROM #rejected A
			LEFT JOIN AdventureWorks2019.Purchasing.PurchaseOrderDetail B
				ON A.PurchaseOrderID = B.PurchaseOrderID
		WHERE B.RejectedQty > 5

SELECT
	PurchaseOrderID,
	OrderDate,
	TotalDue,
	RejectedQty
FROM #rejected
WHERE RejectedQty IS NOT NULL
ORDER BY PurchaseOrderID