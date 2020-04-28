select 
		summary.country_region as country_name,
		sum(summary.confirmed) as confirmed_count,
		summary.date as date
	
	from proven-now-275605.dbt_mahangu.summary
 
	where summary.date = cast ( {{ dbt_utils.dateadd(datepart='day', interval=-1, from_date_or_timestamp=dbt_utils.current_timestamp() ) }} as date)
	  
	group by country_name, date