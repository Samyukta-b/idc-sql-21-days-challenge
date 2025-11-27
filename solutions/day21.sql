/* Day 21 Challenge Question: Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). Then combine all three CTEs to create a final report showing service name, all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending.*/

WITH service_metric AS (
    SELECT 
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
),
staff_metric AS (
    SELECT 
        service,
        COUNT(staff_id) AS total_staff,
        ROUND(AVG(week), 2) AS avg_present
    FROM staff_schedule
    GROUP BY service
),
patient_metric AS (
    SELECT
        service,
        ROUND(AVG(age), 2) AS avg_age,
        COUNT(patient_id) AS total_patients
    FROM patients
    GROUP BY service
)

SELECT 
    se_m.service,
    se_m.total_admitted,
    se_m.total_refused,
    se_m.avg_satisfaction,
    st_m.total_staff,
    st_m.avg_present,
    pa_m.avg_age,
    pa_m.total_patients,
	ROUND(0.5*(100*(se_m.total_admitted/(se_m.total_admitted + se_m.total_refused))) 
    + 0.5*se_m.avg_satisfaction,2) as performance
FROM service_metric se_m
JOIN staff_metric st_m ON se_m.service = st_m.service
JOIN patient_metric pa_m ON se_m.service = pa_m.service
order by performance desc;

-- Result table in ./`result tables`/day21.csv