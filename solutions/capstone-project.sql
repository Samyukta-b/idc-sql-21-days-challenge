-- Case Report - SQL Murder Mystery: “Who Killed the CEO?”

use idc_murder_mystery;

-- Identify where and when the crime happened

select 
	ev.evidence_id, ev.room, kl.employee_id, ev.description, ev.found_time, time(kl.entry_time) as entry_time, time(kl.exit_time) as exit_time
from evidence ev
join keycard_logs kl on ev.room = kl.room
where ev.room = "CEO Office"
order by ev.evidence_id

/* Since we know the CEO was murdered in his office, the above query shows us more detailed information. Based on a join from evidence and keycard_logs on the room, we can gain all suspicious information regarding the killer. The keycard logs show that an employee swiped their card from 20:50 to 21:00 into the CEO Office. 5 and 10 mintues from that respectively is when evidence has been found in the same room. 

THE CRIME HAPPENED IN THE CEO OFFICE BETWEEN 20:50 AND 21:00. */

-- Analyze who accessed critical areas at the time

select distinct kl.employee_id, em.name, em.department, em.role, ev.room, 
	time(kl.entry_time) as entry_time, 
    time(kl.exit_time) as exit_time, 
    timediff(time(kl.exit_time), time(kl.entry_time)) as diff_time
from evidence ev
join keycard_logs kl on ev.room = kl.room 
join employees em on em.employee_id = kl.employee_id
where time(kl.entry_time) between "20:50" and "21:00"

/* Seems like a DevOps Engineer, David Kumar, accessed the CEO Office around the critical time of 20:50 to 21:00, the time of murder. Suspicious indeed...

DAVID KUMAR ACCESSED THE CEO OFFICE AROUND THE TIME OF MURDER. */

-- Cross-check alibis with actual logs

select em.employee_id, em.name, em.role, kl.room as actual_location, 
	   a.claimed_location, time(a.claim_time) as claim_time, 
	   time(kl.entry_time) as entry_time, time(kl.exit_time) as exit_time
from alibis a
left join keycard_logs kl on a.employee_id = kl.employee_id
left join employees em on em.employee_id = kl.employee_id

/* Seems like David Kumar is lying about his whereabouts at the time of murder. Claims to be at the Server room but the keycard logs say a different story. An interesting observation is that he indeed had been at the Server room earlier in the day, coincidentally at 9AM instead of PM, but data never lies. Did he think he would be able to trick someone by swiping his keycard around a time 12 hours before the murder? Unfortunately for him, if that was the case, data has been recorded in 24-hours format. He was actully in the CEO Office from 20:50 to 21:00.

DAVID KUMAR IS LYING ABOUT HAVING BEEN AT THE SERVER ROOM DURING THE TIME OF MURDER.*/

-- Investigate suspicious calls made around the time

select c.call_id, c.caller_id,
	   c.receiver_id, 
	   em_c.name as caller_name, 
	   em_r.name as receiver_name, 
time(c.call_time) as call_time,
duration_sec
from calls c 
join employees em_r on c.receiver_id = em_r.employee_id 
join employees em_c on c.caller_id = em_c.employee_id
where time(call_time) between "20:40" and "21:10"

/* The above query gives us a detailed view on the calls made and which employee received said call during the critical window. David Kumar has made two calls close to the time of murder to Grace Tan and Alice Johnson. An interesting observation is that he made a call to Alice Johnson at 20:55, which suggests that he called her while he was inside the CEO Office. Hmm suspicious. Could she be an accomplice? 

DAVID KUMAR HAS MADE A SUSPICIOUS CALL AROUND THE TIME OF MURDER. */

-- Match evidence with movements and claims

select ev.evidence_id, em.employee_id, em.name, a.claimed_location, 
ev.room as actual_location,
time(a.claim_time) as claim_time,
time(kl.entry_time) as actual_entry_time,
time(ev.found_time) as evidence_found_time,
ev.description as evidence_description
from alibis a 
join employees em on em.employee_id = a.employee_id
join keycard_logs kl on kl.employee_id = em.employee_id
join evidence ev on ev.room = kl.room

/* Well, well, well. Here comes the incriminating evidence. The above query shows us the final combined data to help us analyze who is the killer. All evidence found points to David Kumar.

EVIDENCE FROM ROOMS AND FALSE ALIBI POINTS US TO THE KILLER. */

-- Combine all findings to identify the killer

select distinct em.name as killer
from alibis a 
join employees em on em.employee_id = a.employee_id
join keycard_logs kl on kl.employee_id = em.employee_id
join evidence ev on ev.room = kl.room

/* DAVID KUMAR IS THE KILLER.*/