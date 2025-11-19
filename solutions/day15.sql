/* Day 14 Challenge Question: Create a comprehensive service analysis report 
for week 20 showing: service name, total patients admitted that week, total 
patients refused, average patient satisfaction, count of staff assigned to 
service, and count of staff present that week. Order by patients admitted descending. */


select sw.service, 
    sw.patients_admitted as patients_admitted, 
    sw.patients_refused as patients_refused, 
    round(avg(sw.patient_satisfaction),2) as avg_satisfaction,  
    COUNT(DISTINCT s.staff_id) AS assigned_staff, 
    SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) as staff_present
from services_weekly sw
join staff s on s.service=sw.service
left join staff_schedule ss on (ss.staff_id=s.staff_id AND sw.week=ss.week)
where sw.week = 20
group by sw.service, sw.patients_admitted, sw.patients_refused
order by patients_admitted desc

-- Result table in ./`result tables`/day15.png