/* Day 17 ChallengeQuestion: Create a report showing each service 
with: service name, total patients admitted, the difference between 
their total admissions and the average admissions across all services, 
and a rank indicator ('Above Average', 'Average', 'Below Average'). 
Order by total patients admitted descending.*/

select service, patients_admitted, patients_admitted -
(select round(avg(patients_admitted),2) from services_weekly) as difference_in_adm,
CASE 
	WHEN patients_admitted > (select round(avg(patients_admitted),2) from services_weekly) THEN 'Above average' 
	WHEN patients_admitted < (select round(avg(patients_admitted),2) from services_weekly) THEN 'Below Average'
	ELSE 'Average'
END as rank_indicator
from services_weekly
order by patients_admitted desc

/* Though process: 

1. one subquery for counting the average

*/

-- Result table in ./`result tables`/day17.csv