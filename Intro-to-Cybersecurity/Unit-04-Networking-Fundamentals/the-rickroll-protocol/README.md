# The Rickroll Protocol

**Category:** Intro to Cybersecurity  
**Difficulty:** Hard  
**Points:** 300

## Description

⚠️ INCIDENT REPORT — MURKYWATER HIGH SCHOOL ⚠️

Someone has rickrolled the entire school.

Every single website — Google, YouTube, Canvas, even the lunch menu — now redirects to Rick Astley's "Never Gonna Give You Up." Teachers are furious. The IT club is in shambles. The principal has declared a "Code Astley."

The school's sysadmin panicked, dumped the DNS server config, and handed it to you — the only student in the cybersecurity class who didn't laugh.

You have one file:

- `dns_records.txt` — the DNS server's zone file with all the current records

Your mission:

1. **Who did it?** The prankster left their calling card as a TXT record in the zone file. Find the **handle** (username) they left behind.
2. **Decode the secret.** Several A records are pointing to IPs that don't make sense. The last octet of each suspicious IP (the ones pointing to `10.13.37.X`) spells something when converted from decimal to ASCII. What's the **hidden word**?
3. **Find the port.** There's one SRV record that doesn't belong — it's pointing to a secret service the prankster set up. What **port number** is it running on?

**Flag format:** `cyber{handle_word_port}`  
Example: if the handle is `lulzking`, the word is `hack`, and the port is `1337` → `cyber{lulzking_hack_1337}`
