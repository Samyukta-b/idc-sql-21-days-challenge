/* Day 6 Challenge Question: For each hospital service, calculate the total 
number of patients admitted, total patients refused, and 
the admission rate (percentage of requests that were admitted). 
Order by admission rate descending. */

use hospital;
SELECT 
    service,
    SUM(patients_admitted), 
    SUM(patients_refused), 
    ROUND(((SUM(patients_admitted)/SUM(patients_request))*100),2) as admission_rate
from services_weekly
group by service
order by admission_rate desc

/* Though process: 

1. Admission rate is (patients_admitted/patients_request)*100 for all the patients under a particular service

*/

-- Result table in ./`result tables`/day6.png