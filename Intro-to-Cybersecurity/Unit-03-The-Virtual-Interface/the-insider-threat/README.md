# The Insider Threat

**Category:** Intro to Cybersecurity  
**Difficulty:** Hard  
**Points:** 300

## Description

You're on the incident response team. At 6 AM Monday, the SIEM flagged abnormal activity on a production Linux server over the weekend. Your manager hands you three files pulled from the compromised machine:

- `auth.log` — authentication log excerpt from the weekend
- `crontab_dump.txt` — a dump of all user crontabs on the system
- `processes.txt` — a snapshot of running processes taken at the time of detection

Your mission:

1. **Which user account was compromised?** (Look for the brute-force pattern in `auth.log` — find the account that was eventually accessed after repeated failures.)
2. **How did the attacker maintain persistence?** (Check `crontab_dump.txt` for a suspicious scheduled job — what file does it execute?)
3. **What sensitive file was targeted for exfiltration?** (The cron job runs a script. Inside `processes.txt`, find the process that reveals what the script is doing — the command includes the name of the targeted file.)

Assemble your three findings into the flag.

**Flag format:** `cyber{username_cronscript_targetfile}`  
Example: if user `bob` was compromised, the cron runs `backdoor.sh`, and it targets `shadow` → `cyber{bob_backdoor.sh_shadow}`
