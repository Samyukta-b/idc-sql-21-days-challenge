/* Day 7 Challenge Question: Identify services that refused more 
than 100 patients in total and had an average patient satisfaction 
below 80. Show service name, total refused, and average satisfaction. */

use hospital;
select service, sum(patients_refused) as num_of_patients_refused, round(avg(patient_satisfaction),2) as average_satisfaction
from services_weekly
group by service
having num_of_patients_refused > 100 and average_satisfaction < 80

/* Though process: 

1. The total number of patients refused (SUM) in a given service where the total number of patients are more than 100 for that particular service (GROUP BY service)
2. second condition is that the satisfaction average of the patients in that particular service should be less than 80
3. Group by service and apply the HAVING clause on aggregated columns 
*/

-- Result table in ./`result tables`/day7.png