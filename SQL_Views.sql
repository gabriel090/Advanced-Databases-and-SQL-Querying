--They can be created by joining multiple tables
Create VIEW MyCustomUSView
AS
SELECT * FROM [AdventureWorks2012].[Sales].[SalesTerritory]
WHERE CountryRegionCode LIKE 'US'
SELECT * FROM MyCustomerUSView;

--How to Join Tables
Create VIEW NASalesd
AS
SELECT [Name],[Group], [SaleQuota]
FROM [AdventureWorks2012].[Sales].[SalesTerritory] A INNER JOIN [Sales].[SalesPerson] B
ON A TerritoryID = B.TerritoryID
WHERE [Group] LIKE 'US'

SELECT * FROM NASalesd;
