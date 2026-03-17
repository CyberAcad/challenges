# Packet Surgeon

**Category:** Intro to Cybersecurity  
**Difficulty:** Hard  
**Points:** 300

## Description

The network security team captured suspicious traffic on the corporate network last night. They've decoded the raw packet capture into a human-readable log for you to analyze.

The log contains 30+ entries spanning DNS queries, HTTP requests, and TCP connection attempts. Three things went wrong on this network — find all of them:

1. **The Port Scan:** An external host probed the network. Identify the **attacker's IP** by finding sequential TCP SYN packets targeting consecutive ports from a single source.

2. **The Credential Leak:** A user submitted credentials over unencrypted HTTP. Find the **destination port** the POST request was sent to.

3. **The DNS Exfiltration:** An internal host is smuggling data out through DNS queries. Look at the subdomain patterns — one domain has encoded chunks being queried in sequence. Identify the **exfiltration domain** (the parent domain, not the encoded subdomains).

**Flag format:** `cyber{attacker_ip_port_exfildomain}`  
Example: if the attacker is `1.2.3.4`, the port is `8080`, and exfil goes to `bad.com` → `cyber{1.2.3.4_8080_bad.com}`
