/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [EmployeeKey]
      --,[ParentEmployeeKey]
      --,[EmployeeNationalIDAlternateKey]
      --,[ParentEmployeeNationalIDAlternateKey]
      ,[SalesTerritoryKey]
      ,[FirstName]
      ,[LastName]
	  , FirstName +' ' + LastName as [Sales person name]
      --,[MiddleName]
      --,[NameStyle]
      ,[Title] as [Position]
      ,[HireDate]
      ,[BirthDate]
	  ,(year(getdate())-left([BirthDate],4)) as [Age]  -- get employee age
      --,[LoginID]
      --,[EmailAddress]
      --,[Phone]
      , case [MaritalStatus] when 'M' then  'married' when 'S' then 'single' end as [MaritalStatus]
      --,[EmergencyContactName]
      --,[EmergencyContactPhone]
      --,[SalariedFlag]
      ,case [Gender] when 'M' then 'Male' when 'F' then 'Female' end as [Gender]
      --,[PayFrequency]
      ,[BaseRate]
      --,[VacationHours]
      ,[SickLeaveHours]
      --,[CurrentFlag]
      --,[SalesPersonFlag]
      ,[DepartmentName]
      ,[StartDate]
      ,[EndDate]
     -- ,[Status]
      --,[EmployeePhoto]
	  
  FROM [AdventureWorksDW2019].[dbo].[DimEmployee]