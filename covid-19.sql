select * 
from portifolioproject..CovidDeaths$
order by 1,2

select location, date, new_cases, total_cases, total_deaths, population
from portifolioproject..CovidDeaths$
order by 1,2

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from portifolioproject..CovidDeaths$
where location = 'united states'
order by 1,2


select sum(total_deaths)
from portifolioproject..CovidDeaths$
select max(total_cases/total_deaths) as deathpercentage, max(new_cases/population) as infectionpercentage
from portifolioproject..CovidDeaths$

select sum(cast(total_deaths as int)) 
from portifolioproject..coviddeaths$
where location = 'united states'

select location, population, max(cast(total_deaths as int)) as totaldeathsum, (max(cast(total_deaths as int))/population)*100 as deathpercentage, total_vaccinations
from CovidDeaths$
where continent is null and location <> 'European Union' and location <> 'International'
group by location, population
order by deathpercentage desc

select population 
from CovidDeaths$

select location, population, cast (total_vaccinations as int) as totalvacc, cast (people_vaccinated as int) as peoplevacc, cast (people_fully_vaccinated as int) as pfv
from portifolioproject..coviddeaths$
group by location, population, total_vaccinations, people_vaccinated, people_fully_vaccinated
order by total_vaccinations desc 

select location, population, total_vaccinations, people_vaccinated
from portifolioproject..coviddeaths$
group by location, population, total_vaccinations, people_vaccinated
order by total_vaccinations desc

select sum(cast (people_vaccinated as bigint)) as totalvacc
from portifolioproject..coviddeaths$
--group by location, population, total_vaccinations

select sum(cast (total_vaccinations as bigint)), sum(cast (total_cases as int))
from portifolioproject..coviddeaths$
where continent is not null
group by total_vaccinations, total_cases


select max(total_vaccinations)
from portifolioproject..coviddeaths$
where total_vaccinations is not null

select *
from portifolioproject..coviddeaths$ dea
join portifolioproject..CovidVaccinations$ vac
on dea.location = vac.location
and dea.date = vac.da


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths$
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths$
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths$
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths$
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc