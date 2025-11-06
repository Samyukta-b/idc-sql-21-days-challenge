/* Day 4 Challenge Question: Find the 3rd to 7th highest 
patient satisfaction scores from the patients table, 
showing patient_id, name, service, 
and satisfaction. Display only these 5 records. */

use hospital;
SELECT patient_id, name, service, satisfaction
from patients
order by satisfaction desc
LIMIT 5 offset 2

/* Thought Process:

1. Order by the highest satisfaction so DESC 
2. From 3rd to 7th is 5 records skipping the first two so OFFSET 2

*/

-- Result table in ./`result tables`/day4.png