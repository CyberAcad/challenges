# Social Engineering Autopsy

**Category:** Intro to Cybersecurity  
**Difficulty:** Hard  
**Points:** 300

## Description

Last week, an employee fell for a phishing attack and the attacker gained access to internal systems. The incident response team has collected four artifacts from the investigation. Your job is to reconstruct the attack chain.

You have:

- `phishing_email.txt` — the full email including headers and body
- `whois_data.txt` — a WHOIS lookup on the phishing domain
- `access_log.txt` — the web server access log from the phishing site (recovered from the attacker's seized infrastructure)

Analyze all three files and answer:

1. **What is the real sender's domain?** The email "From:" header looks legitimate, but the actual originating server is different. Check the email headers to find the **real sending domain** behind the spoof.
2. **When was the phishing domain registered?** Check the WHOIS data for the **creation date** — it will show this attack was premeditated.
3. **What credential did the victim submit?** The access log contains the POST request from the victim — find the **email address** they entered on the fake login page.

**Flag format:** `cyber{realdomain_MM/DD/YY_victim@email}`  
Example: if the real sender is `hacker.xyz`, the domain was registered `01/15/26`, and the victim entered `user@work.com` → `cyber{hacker.xyz_01/15/26_user@work.com}`
