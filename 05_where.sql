-- exercise 1
-- Select any rows from the “Person.Person” table where the value in the “FirstName” column is “Pilar”. 
-- Include all columns EXCEPT “BusinessEntityID”, “rowguid”, and “ModifiedDate” in your output.

SELECT 
    [PersonType]
    ,[NameStyle]
    ,[Title]
    ,[FirstName]
    ,[MiddleName]
    ,[LastName]
    ,[Suffix]
    ,[EmailPromotion]
    ,[AdditionalContactInfo]
    ,[Demographics]
FROM [AdventureWorks2019].[Person].[Person]
WHERE [FirstName] = 'Pilar';


 -- exercise 2
 -- Select any rows from the “Purchasing.Vendor” table where the value in the “Name” column is “Northwind Traders”. 
 -- Include all columns EXCEPT “BusinessEntityID” and “ModifiedDate” in your output.

 SELECT 
      [AccountNumber]
      ,[Name]
      ,[CreditRating]
      ,[PreferredVendorStatus]
      ,[ActiveFlag]
      ,[PurchasingWebServiceURL]
  FROM [AdventureWorks2019].[Purchasing].[Vendor]
  WHERE [Name] = 'Northwind Traders';


-- exercise 3
-- Modify your query from Exercise 2 by commenting out the WHERE statement, 
-- and then adding a new criterion that filters for preferred vendors only 
-- – that is to say, where the value in the “PreferredVendorStatus” column is 1.

 SELECT 
      [AccountNumber]
      ,[Name]
      ,[CreditRating]
      ,[PreferredVendorStatus]
      ,[ActiveFlag]
      ,[PurchasingWebServiceURL]
  FROM [AdventureWorks2019].[Purchasing].[Vendor]
--  WHERE [Name] = 'Northwind Traders';
WHERE [PreferredVendorStatus] = 1;