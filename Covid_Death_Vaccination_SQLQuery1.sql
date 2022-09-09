
select *
from alex_project..CovidDeaths

--select particular columns

select location,population,(total_cases) as HighestInfectionCount,total_deaths ,round((total_deaths/total_cases),4) *100 as DeathRatio 
 from alex_project.. CovidDeaths            
 order by 1,2


  --maximum number of cases ,death,death_ration  by country

Select 
Location, Population,max(total_cases) as HighestInfectionCount,
max(cast(total_deaths as int)) as number_of_death ,
max(cast(total_deaths as int))as death,
round(max(total_deaths/total_cases),4) *100 as DeathRatio  
From alex_project..CovidDeaths
--Where location like '%states%'          
Group by Location, Population           
order by DeathRatio  desc

-- total number of cases, death by countries
Select Location, Population,sum(total_cases) as "total cases",
sum(cast(total_deaths as int)) as "Total Death" ,
round((sum(cast(total_deaths as int))/sum(total_cases)),4) *100 as DeathRatio  
 From alex_project..CovidDeaths
where continent is not null
Group by Location, Population           
order by  "total cases"  desc


 --maximum number of cases ,death,death_ration  by continent

Select 
continent, max(total_cases) as HighestInfectionCount,
max(cast(total_deaths as int)) as number_of_death ,
max(cast(total_deaths as int))as death,
round(max(total_deaths/total_cases),4) *100 as DeathRatio  
From alex_project..CovidDeaths
--Where location like '%states%'   
where continent is not null
Group by continent          
order by DeathRatio  desc


-- total number of cases, death by continent
Select continent,sum(total_cases) as "total cases",
sum(cast(total_deaths as int)) as "Total Death" ,
round((sum(cast(total_deaths as int))/sum(total_cases)),4) *100 as DeathRatio            -- Population,
 From alex_project..CovidDeaths
where continent is not null
Group by continent          
order by  "total cases"  desc


--population vs vaccination

select d.location,d.population,d.date,v.new_vaccinations,
sum(cast(v.new_vaccinations as int)) over (partition by d.location order by d.date) as "net vaccination"
  --(cast(v.new_vaccinations as int)/d.population),4)*100   over (partition by d.location order by d.date) as "vaccination ratio"
from  alex_project..CovidDeaths d
join alex_project..CovidVaccinations v
on d.location=v.location
and d.date=v.date
where d.continent is not null 
                --  and d.location= 'india'
order by 1,2


--with CTE

with popVSvac(location,population,date,new_vaccinations,"net vaccination") as 
(select d.location,d.population,d.date,v.new_vaccinations,
sum(cast(v.new_vaccinations as int)) over (partition by d.location order by d.date) as "net vaccination"

from  alex_project..CovidDeaths d
join alex_project..CovidVaccinations v
on d.location=v.location
and d.date=v.date
where d.continent is not null )
                --  and d.location= 'india'
--order by 1,2)

select *, round(("net vaccination"/population)*100,2) ratio_of_vaccinated_population
from popVSvac


--temp table

DROP Table if exists #pop
Create Table #covid
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
[net vaccination] numeric
)

Insert into #covid
Select d.continent, d.location, d.date, d.population, v.new_vaccinations
,sum(cast(v.new_vaccinations as int)) over (partition by d.location order by d.date) as [net vaccination]
From alex_project..CovidDeaths d
Join alex_project..CovidVaccinations v
	On d.location = v.location
	and d.date = v.date
--where dea.continent is not null 
--order by 2,3

create view saroj as
select *, [net vaccination]/population*100 as [Ratio of vaccinated population]
from covid


--cresting view

create view covid as
select d.location,d.population,d.date,v.new_vaccinations,
sum(cast(v.new_vaccinations as int)) over (partition by d.location order by d.date) as "net vaccination"
  --(cast(v.new_vaccinations as int)/d.population),4)*100   over (partition by d.location order by d.date) as "vaccination ratio"
from  alex_project..CovidDeaths d
join alex_project..CovidVaccinations v
on d.location=v.location
and d.date=v.date
where d.continent is not null 
               
select *
from covid