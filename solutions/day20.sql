/* Day 20 Challenge Question: Create a trend analysis showing for each service and week: 
 week number, patients_admitted, running total of patients admitted (cumulative),
 3-week moving average of patient satisfaction (current week and 2 prior weeks), 
 and the difference between current week admissions and the service average. 
 Filter for weeks 10-20 only.*/
 
select service, week, patients_admitted, 
sum(patients_admitted) over(partition by service order by week) as cumulative_patients,
round(avg(patient_satisfaction) over (partition by service order by week
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3week,
round(abs(patients_admitted - avg(patients_admitted) over(partition by service)),0) as diff
from services_weekly
where week between 10 and 20

-- Result table in ./`result tables`/day20.csv