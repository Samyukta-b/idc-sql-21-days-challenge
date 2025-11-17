/* Day 13 Challenge Question: Create a comprehensive report 
showing patient_id, patient name, age, service, and the total 
number of staff members available in their service. Only 
include patients from services that have more than 5 staff 
members. Order by number of staff descending, then by patient name. */

select p.patient_id, p.name, p.age, p.service, count(s.staff_id) as staff_count
from patients p
inner join staff s on p.service = s.service
group by p.patient_id, p.name, p.age, p.service
having count(s.staff_id) > 5
order by staff_count desc, p.name

/* Though process: 

1. Join patients and staff on service since that's the common column

*/

-- Result table in ./`result tables`/day13.csv