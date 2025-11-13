/* Day 10 Challenge Question: Create a service performance report 
showing service name, total patients admitted, and a performance 
category based on the following: 'Excellent' if avg 
satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 
'Needs Improvement'. Order by average satisfaction descending. */

use hospital;
select service, SUM(patients_admitted),
CASE
	WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
    WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
    WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
    ELSE 'Needs Improvement'
END as avg_sat_category
from services_weekly
group by service
order by AVG(patient_satisfaction) DESC

/* Though process: 

1. Since 1 row = multiple patients and Q asks the total patients admitted, need to use SUM(patients_admitted)
2. regarding the GROUP BY, 

*/

-- Result table in ./`result tables`/day10.png