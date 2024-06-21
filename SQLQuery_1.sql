/*

Queries used for Tableau Project

*/

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where location like '%states%'
--Group By date
order by 1,2

--The second query statement checks for death percentage in the world minus the unnites states and other irrelevant columns


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as float))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where not location = '%states%, World, European Union, International' 
order by 1,2


-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

-- max cases of innnfections and percentage of population infected
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max(cast(total_cases as float) /population)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc


-- max cases of innnfections and percentage of population infected grouped by date
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max(cast(total_cases as float) /population)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc

