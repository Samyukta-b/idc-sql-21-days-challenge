/* Day 5 Challenge Question: Calculate the total number of 
patients admitted, total patients refused, 
and the average patient satisfaction across all services and weeks. 
Round the average satisfaction to 2 decimal places. */

use hospital;
SELECT 
    sum(patients_admitted), 
    sum(patients_refused), 
    round(avg(patient_satisfaction), 2)
from services_weekly

/* Thought process:

1. Total number of something means SUM() aggregate and average is AVG()
2. Since it says across all services and weeks we need to group by these factors
3. We get the result for the requiered values for every week-service combination

*/

-- Result table in ./`result tables`/day5.png