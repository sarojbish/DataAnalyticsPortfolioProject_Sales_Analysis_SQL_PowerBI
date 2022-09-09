/****** Script for SelectTopNRows command from SSMS  ******/
--cleaning date table
SELECT [DateKey]
      ,[FullDateAlternateKey]
      --,--[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek] as week
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      --,[DayNumberOfMonth]
      --,[DayNumberOfYear]
      --,[WeekNumberOfYear]
      --,[EnglishMonthName] as month,
	  ,left([EnglishMonthName],3) as month
     -- ,[FrenchMonthName]
       ,[MonthNumberOfYear] as [month number]
      ,[CalendarQuarter] as Quarter
      ,[CalendarYear] as  year
      --,[CalendarSemester]
      ,[FiscalQuarter] as [fiscal Quarter]
      ,[FiscalYear] as [fiscal year]
      --,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]