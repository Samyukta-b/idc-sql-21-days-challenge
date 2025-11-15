/* Day 12 Challenge Question: Analyze the event impact by 
comparing weeks with events vs weeks without events. Show:
event status ('With Event' or 'No Event'), count of weeks, 
average patient satisfaction, and average staff morale. 
Order by average patient satisfaction descending. */

select count(week), avg(patient_satisfaction), avg(staff_morale),
CASE
	WHEN (event != "none") THEN 'With Event'
	ELSE 'No Event'
END as event_status
from services_weekly
group by event_status
order by avg(patient_satisfaction) desc


/* Though process: 

1. Comparing weeks with and without any events basically should mean two rows

*/

-- Result table in ./`result tables`/day12.png