/* Day 3 Challenge Question: Retrieve the top 5 weeks with 
the highest patient refusals across all services, 
showing week, service, patients_refused, 
and patients_request. Sort by patients_refused in descending order. */

use hospital;
SELECT week, service, SUM(patients_refused) AS patients_refused, SUM(patients_request)
FROM services_weekly
GROUP BY week, service
ORDER BY patients_refused DESC
LIMIT 5;

/* Thought Process:

1. Need to find the total number of patients_refused within a given week and service 
2. So SUM() aggregrate for patients_refused and GROUP BY based on week because thats what is asked and GROUP BY services also because we want the refusal for the particular service for that week as well
3. Sort them by descending order and get the top 5 rows
4. Every non-aggregated column in SELECT must be in GROUP BY

*/

-- Result table in ./`result tables`/day3.png