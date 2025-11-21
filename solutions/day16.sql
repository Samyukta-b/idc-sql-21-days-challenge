/* Day 16 Challenge Question: Find all patients who were admitted to services that had at least one week where patients were refused AND the average patient satisfaction for that service was below the overall hospital average satisfaction. Show patient_id, name, service, and their personal satisfaction score.*/

select p.patient_id, p.name, p.service, p.satisfaction
from patients p
where p.service IN (
 select sw.service
 from services_weekly sw
 group by sw.service
 having SUM(CASE WHEN sw.patients_refused > 0 THEN 1 ELSE 0 END) > 0
 and avg(sw.patient_satisfaction) < (
 select avg(patient_satisfaction) from services_weekly
 )
)
order by p.name asc

/* Thought process: 

1. Each service's average must be lesser than overall avg of all services
2. For a particular service, how many ever weeks it has, there must be at least one patient that was refused service

*/

-- Result table in ./`result tables`/day16.csv