
with confirmed_count_by_country_yesterday as (

	select * from {{ ref('confirmed_count_by_country_yesterday') }}
)

select 
	confirmed_count_by_country_yesterday.country_name as country_name,
	confirmed_count_by_country_yesterday.confirmed_count as confirmed_count,
	midyearpop.midyear_population as population,
	round((nullif( confirmed_count_by_country_yesterday.confirmed_count,0 ) / midyearpop.midyear_population)*100,3) as confirmed_percentage_of_pop,
  
from confirmed_count_by_country_yesterday

inner join proven-now-275605.dbt_mahangu.midyearpop on confirmed_count_by_country_yesterday.country_name = midyearpop.country_name

where midyearpop.year = 2019

order by confirmed_percentage_of_pop desc