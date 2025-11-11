/* Day 8 Challenge Question: Create a patient summary that shows 
patient_id, full name in uppercase, service in lowercase, age 
category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', 
else 'Minor'), and name length. Only show patients whose name 
length is greater than 10 characters. */

use hospital;
select patient_id, UPPER(name), LOWER(service),
CASE 
	WHEN age >= 65 THEN 'Senior' 
	WHEN age >= 18 THEN 'Adult'
	ELSE 'Minor'
END as age_category, LENGTH(name) as names_length
from patients
where LENGTH(name) > 10;


/* Though process: 

1. For main conditions use CASE clause 
2. Interesting observation: Noticed that we're unable to use alias name in WHERE clause (names_length) since WHERE executes first before SELECT so when WHERE is executed, names_length hasn't been defined at that point yet

*/

-- Result table in ./`result tables`/day8.csv