/* Day 1 Challenge Question: List all unique hospital services available in the hospital. */

USE hospital;
SELECT DISTINCT service
FROM services_weekly;

/* Thought Process:

1. Need all the unique non-repeating services available or provided in the hospital. 
2. The DISTINCT clause helps us filter out any duplicate entries.
3. Noticed that same answer can be achieved from any of the tables in this database.

*/

-- Result table in ./`result tables`/day1.png