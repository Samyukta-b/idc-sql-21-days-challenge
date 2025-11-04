/* Day 2 Challenge Question: Find all patients admitted 
to 'Surgery' service with a satisfaction score below 70, 
showing their patient_id, name, age, and satisfaction score. */

Use hospital;
select patient_id, name, age, satisfaction
from patients
where satisfaction < 70 and service = 'Surgery'

/* Thought Process:

1. Select the requiered details of patients based on the conditions given
2. Filtering the data based on specific conditions can be done using the WHERE clause 
3. Combinting more than one condition is done by the 'and' keyword

*/

-- Result table in ./`result tables`/day2.csv