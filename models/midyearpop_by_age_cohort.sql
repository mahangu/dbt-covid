select
  country_name as country_name, 
  sum(population) as population,
  sum (case when age between 0 and 20 then age else 0 end) as child_count,
  sum (case when age between 21 and 35 then age else 0 end) as youth_count,
  sum (case when age between 36 and 55 then age else 0 end) as middle_aged_count,
  sum (case when age > 55 then age else 0 end) as older_count
  
from `bigquery-public-data.census_bureau_international.midyear_population_agespecific`

group by country_name