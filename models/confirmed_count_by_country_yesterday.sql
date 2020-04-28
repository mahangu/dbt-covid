select 
		summary.country_region as country_name,
		sum(summary.confirmed) as confirmed_count
	
	from proven-now-275605.dbt_mahangu.summary
  
	where summary.date = '2020-04-25'
	  
	group by country_name