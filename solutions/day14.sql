/* Day 14 Challenge Question: Create a staff utilisation 
report showing all staff members (staff_id, staff_name, 
role, service) and the count of weeks they were present 
(from staff_schedule). Include staff members even if 
they have no schedule records. Order by weeks present descending. */

use hospital; 
select s.staff_id, s.staff_name, s.role, s.service, 
	sum(coalesce(ss.present,0)) as count_of_weeks 
from staff s 
left join staff_schedule ss on s.staff_id = ss.staff_id 
where ss.present = 1
group by s.staff_id, s.staff_name, s.role, s.service 
order by count_of_weeks desc


-- Result table in ./`result tables`/day14.csv