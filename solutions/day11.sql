/* Day 11 Challenge Question: Find all unique combinations of 
service and event type from the services_weekly table where events 
are not null or none, along with the count of occurrences for each 
combination. Order by count descending. */


use hospital;
select distinct service, event, count(event) as event_count
from services_weekly
where event IS NOT NULL and event != 'none' 
group by service, event
order by event_count DESC

/* Though process: 

1. Unique combinations of service-event so GROUP BY both service and event
2. filter out event's that are null or contain 'none' using WHERE clause

*/

-- Result table in ./`result tables`/day11.png