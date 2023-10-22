select *
from coviddeath
order by 3,4;

select *
from covidvacination
order by 3,4;

select location,date, total_deaths, new_cases, population
from coviddeath
order by 1,2;

-- looking at  total deaths vs new cases 

select location,date, total_deaths, new_cases, (total_deaths/new_cases)*100 as deathpercentage 
from coviddeath
where location like '%africa%' 
order by 1,2;

-- looking at total case vs population 

select location,date, total_deaths, population, (total_deaths/population)*100 as populationpercentage 
from coviddeath
where location like '%africa%' 
order by 1,2;

-- looking at countries with higest infection rate compared to population

select location, population,max(total_deaths)as highestinfectioncount, max((total_deaths/population))*100 as populationpercentageinfected 
from coviddeath 
group by location, population  
order by populationpercentageinfected desc;

-- showing countries with higest death count per population

select location, max(total_deaths)as totaldeathcount 
from coviddeath 
where location like '%africa%' 
group by location 
order by totaldeathcount desc;

-- showing continet with the higest death count per population 

select location, max(total_deaths) as totaldeathcount
FROM coviddeath 
where continent IS NOT NULL
GROUP BY location 
ORDER BY totaldeathcount DESC;

-- global numbers of new cases and new cases and new deaths per day  

select date, sum(new_cases) as total_cases, sum(new_deaths) as total_death, sum(new_deaths) /sum(new_cases)*100 as deathpercentage 
from coviddeath
where location like '%africa%' 
order by 1,2; 

-- looking at population vs vassinations (as they are in two different tables)

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over (partition by dea.location)
from coviddeath dea
join covidvacination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3





 










 





