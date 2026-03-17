# Solution — Packet Surgeon

## Flag

```
cyber{10.0.0.99_3389_exfil.evil.com}
```

## Steps

### Part 1: Identify the Port Scan

1. Scan the log for repeated TCP SYN packets from the same source IP.
2. Entries **#08 through #21** show `10.0.0.99` sending SYN packets to consecutive destination ports on `10.10.1.1`:
   - Port 21 (FTP) → RST-ACK (closed)
   - Port 22 (SSH) → SYN-ACK (open!)
   - Port 23 (Telnet) → RST-ACK (closed)
   - Port 25 (SMTP) → SYN-ACK (open!)
   - Port 80 (HTTP) → RST-ACK (closed)
   - Port 443 (HTTPS) → RST-ACK (closed)
3. This is a classic **sequential port scan** — rapid SYN packets to well-known ports to discover which services are running.
4. The attacker's IP is **`10.0.0.99`**.

### Part 2: Find the Credential Leak

1. Search for HTTP POST requests (credentials are commonly submitted via POST).
2. Entry **#33** shows an unencrypted HTTP POST to `10.10.1.5:3389`:
   ```
   Body: username=t.nguyen&password=Welcome2026!
   ```
3. The credentials were sent in **plaintext** over HTTP (not HTTPS) to port **`3389`**.
4. Note: Port 3389 is typically RDP (Remote Desktop Protocol). Running an HTTP login form on this port is itself suspicious and misconfigured.

### Part 3: Identify DNS Exfiltration

1. Look at the DNS queries in entries **#24 through #28**.
2. All five queries come from `10.10.1.77` and query subdomains of **`exfil.evil.com`**:
   ```
   dGhlIHBhc3N3b3Jk.exfil.evil.com
   aXMgaGlkZGVuIGlu.exfil.evil.com
   dGhlIGRucyBxdWVy.exfil.evil.com
   aWVzIGdvb2QgbHVj.exfil.evil.com
   ayBmaW5kaW5nIGl0.exfil.evil.com
   ```
3. The subdomains are **base64-encoded** data chunks. Decoding them reveals:
   - `dGhlIHBhc3N3b3Jk` → `the password`
   - `aXMgaGlkZGVuIGlu` → `is hidden in`
   - `dGhlIGRucyBxdWVy` → `the dns quer`
   - `aWVzIGdvb2QgbHVj` → `ies good luc`
   - `ayBmaW5kaW5nIGl0` → `k finding it`
4. The attacker is smuggling data out through DNS queries — the **exfiltration domain** is **`exfil.evil.com`**.
5. (Students do NOT need to decode the base64 to answer — the question asks for the parent domain, which is directly visible.)

### Assembled Flag

- Attacker IP: `10.0.0.99`
- Credential leak port: `3389`
- Exfiltration domain: `exfil.evil.com`
- Flag: `cyber{10.0.0.99_3389_exfil.evil.com}`

## Key Concept

- **Port scanning** is an attacker's first step — systematic probes to find open services. Sequential SYN packets from one IP to consecutive ports is a dead giveaway.
- **Credential exposure** over HTTP is a critical vulnerability. Even internal traffic should use TLS/HTTPS — anyone on the network can sniff plaintext credentials.
- **DNS exfiltration** abuses the fact that DNS queries are almost never blocked. Attackers encode stolen data as subdomains and query a DNS server they control. The data flows out disguised as normal DNS traffic.
- Defenders monitor for unusual DNS query patterns (many queries to one domain, long/random subdomains) and enforce HTTPS everywhere.
