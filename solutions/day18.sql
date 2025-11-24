/* Day 18 Challenge Question: Create a comprehensive personnel and patient list 
showing: identifier (patient_id or staff_id), full name, type 
('Patient' or 'Staff'), and associated service. Include only those in 
'surgery' or 'emergency' services. Order by type, then service, then name. */

select patient_id, name as full_name, 'Patient' as type, service
from patients
where service = 'surgery' or service = 'emergency'
union all
select staff_id, staff_name as full_name, 'Staff' as type, service 
from staff
where service = 'surgery' or service = 'emergency'
order by type, service, full_name

/* Though process: 

1. Can have union all since there is no duplicates present
2. filter by the two requiered services for both tables

*/

-- Result table in ./`result tables`/day18.csv