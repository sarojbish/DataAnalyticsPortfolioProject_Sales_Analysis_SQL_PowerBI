/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  p.[ProductKey]
      ,p.[ProductAlternateKey] as [Product item code]
      ,ps.[EnglishProductSubcategoryName] as [Product Subcategory]
	  ,pc.[EnglishProductCategoryName] as [Product Category]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] as [Product Name]
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
     -- ,[FinishedGoodsFlag]
      ,p.[Color] as [Product color]
     -- ,[SafetyStockLevel]
     -- ,[ReorderPoint]
      ,[ListPrice]
      ,p.[Size] as [Product size]
      --,[SizeRange]
     -- ,[Weight]
     -- ,[DaysToManufacture]
     -- ,[ProductLine]
     -- ,[DealerPrice]
      --,[Class]
      --,[Style]
      ,p.[ModelName] as [Product Model]
      --,[LargePhoto]
      ,p.[EnglishDescription] as [Product Description]
    --  ,[FrenchDescription]
    --  ,[ChineseDescription]
     -- ,[ArabicDescription]
    --  ,[HebrewDescription]
      --,[ThaiDescription]
     -- ,[GermanDescription]
     -- ,[JapaneseDescription]
      --,[TurkishDescription]
     -- ,[StartDate]
     --,[EndDate]
	  
      ,isnull(p.[Status],'outdated') as [Product Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] p
  left join  [AdventureWorksDW2019].[dbo].[DimProductSubcategory] ps
  on p.ProductSubcategoryKey= ps.ProductSubcategoryKey
  left join [AdventureWorksDW2019].[dbo].[DimProductCategory] pc
  on  pc.ProductCategoryKey=ps.ProductCategoryKey