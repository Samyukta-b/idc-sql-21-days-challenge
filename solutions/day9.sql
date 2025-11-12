/* Day 9 Challenge Question: Calculate the average length of 
stay (in days) for each service, showing only services where 
the average stay is more than 7 days. Also show the count 
of patients and order by average stay descending. */

use hospital;
select 
	service, 
	count(*) as patient_count,
	ROUND(AVG(datediff(departure_date, arrival_date)), 2) as avg_stay
from patients
group by service
having avg_stay > 7
order by avg_stay DESC


/* Though process: 

1. DATEDIFF provides the difference or the number of days spaned between two given dates
2. We need the average of that per service so GROUP BY service

*/

-- Result table in ./`result tables`/day9.png