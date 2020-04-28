select 
  summary.country_region as country,
  midyearpop.midyear_population as population,
  summary.confirmed as confirmed_count,
  round((nullif( summary.confirmed,0 ) / midyearpop.midyear_population)*100,3) as confirmed_percentage_of_pop,

from proven-now-275605.dbt_mahangu.summary

inner join proven-now-275605.dbt_mahangu.midyearpop on summary.country_region = midyearpop.country_name

where midyearpop.year = 2019 and summary.date = '2020-04-25'

order by confirmed_percentage_of_pop desc