/****** Script for SelectTopNRows command from SSMS  ******/
--cleaning customer table
SELECT  c.[CustomerKey] as [CustomerKey]
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      ,c.[FirstName] as [FirstName]
     -- ,[MiddleName]
      ,c.[LastName] as  [LastName]
	 ,FirstName+' '+LastName as [Customer Name]
      --,[NameStyle]
      ,[BirthDate] as [Date of birth]
	  ,(year(getdate())-left(c.[BirthDate],4)) as [Age]  -- get customer age
      ,case c.[MaritalStatus] when 'M' then 'married' when 'S' then 'single' end as [Marital status]
     -- ,[Suffix]
      ,case c.[Gender] when 'M' then 'male' when 'F' then 'female' end  as [Gender]
     -- ,[EmailAddress]
     -- ,[YearlyIncome]
     -- ,[TotalChildren]
     -- ,[NumberChildrenAtHome]
      --,[EnglishEducation]
     -- ,[SpanishEducation]
     -- ,[FrenchEducation]
      --,[EnglishOccupation]
     -- ,[SpanishOccupation]
     -- ,[FrenchOccupation]
     -- ,[HouseOwnerFlag]
     -- ,[NumberCarsOwned]
      --,[AddressLine1]
     -- ,[AddressLine2]
     --- ,[Phone]
      ,c.[DateFirstPurchase] as [date of 1st purches]
      ,c.[CommuteDistance] as [CommuteDistance]
	  ,g.[city]  as City
	   ,g.[StateProvinceName] as [State]
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] c
  left join [AdventureWorksDW2019].[dbo].[DimGeography] g      --join with geography table to get city of cutomers
  on c.[GeographyKey]= g.[GeographyKey]
  order by c.CustomerKey