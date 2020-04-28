with midyearpop_by_age_cohort as (

  select * from {{ ref('midyearpop_by_age_cohort') }}

),

older_percentage_by_country as (

  select 
    midyearpop_by_age_cohort.country_name as country_name,
    midyearpop_by_age_cohort.population as population,
    midyearpop_by_age_cohort.older_count / midyearpop_by_age_cohort.population as older_percentage

    from proven-now-275605.dbt_mahangu.midyearpop_by_age_cohort 
)

select 
  confirmed_percentage_of_pop.country_name as country_name,
  confirmed_percentage_of_pop.confirmed_count as confirmed_count,
  midyearpop_by_age_cohort.population as population,
  older_percentage_by_country.older_percentage as older_percentage,
  confirmed_percentage_of_pop.confirmed_percentage_of_pop as confirmed_percentage_of_pop
  
from proven-now-275605.dbt_mahangu.confirmed_percentage_of_pop

inner join midyearpop_by_age_cohort on confirmed_percentage_of_pop.country_name = midyearpop_by_age_cohort.country_name

inner join older_percentage_by_country on confirmed_percentage_of_pop.country_name = older_percentage_by_country.country_name

group by country_name, confirmed_count, population, older_percentage, confirmed_percentage_of_pop

order by confirmed_percentage_of_pop desc