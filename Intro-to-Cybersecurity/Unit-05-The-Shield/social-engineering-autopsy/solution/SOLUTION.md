# Solution — Social Engineering Autopsy

## Flag

```
cyber{shadyhost.net_03/07/26_m.chen@corporate.local}
```

## Steps

### Part 1: Identify the Real Sender's Domain

1. Open `phishing_email.txt` and examine the email headers carefully.
2. The **From:** header says `security-alerts@corporate.local` — this looks like an internal IT email.
3. But the **Return-Path** reveals the truth:
   ```
   Return-Path: <bounce@mail-srv.shadyhost.net>
   ```
4. The **Received** headers confirm it:
   ```
   Received: from mail-srv.shadyhost.net (mail-srv.shadyhost.net [185.199.44.12])
   ```
5. The DKIM signature is also signed by `d=shadyhost.net`, not `corporate.local`.
6. The real sending domain is **`shadyhost.net`** — the From address was spoofed.

### Part 2: Find the Domain Registration Date

1. Open `whois_data.txt` and find the Creation Date field:
   ```
   Creation Date: 2026-03-07T18:20:11Z
   ```
2. The phishing domain `corporate-security-verify.com` was registered on **March 7, 2026**.
3. The phishing email was sent on March 9 — just **2 days later**. This proves the domain was registered specifically for this attack.
4. Additional red flags: WHOIS privacy enabled, minimum 1-year registration, and sketchy name servers (`shady-dns.net`).
5. The registration date in flag format is **`03/07/26`**.

### Part 3: Find the Victim's Submitted Credential

1. Open `access_log.txt` and look for POST requests.
2. On line 9, a POST to `/login` at `11:45:12` on `09/Mar/2026` — this matches the timing of someone clicking the email link.
3. The captured POST body shows:
   ```
   email=m.chen%40corporate.local&password=Tr0ub4dor%2199
   ```
4. URL-decode the values:
   - `%40` = `@` → email is `m.chen@corporate.local`
   - `%21` = `!` → password is `Tr0ub4dor!99`
5. The Referer header confirms this came from the phishing page: `https://corporate-security-verify.com/login?ref=m.chen`
6. The victim's submitted email is **`m.chen@corporate.local`**.

### Assembled Flag

- Real sender domain: `shadyhost.net`
- Domain registration date: `03/07/26`
- Victim's submitted email: `m.chen@corporate.local`
- Flag: `cyber{shadyhost.net_03/07/26_m.chen@corporate.local}`

## Key Concept

- **Email spoofing** is trivially easy — the "From:" header can say anything. Defenders check the `Return-Path`, `Received` headers, and DKIM/SPF/DMARC records to verify actual origin.
- **Spear phishing** targets specific individuals (here, `m.chen`) with personalized content. The urgency ("24 hours") and fear ("account compromised") are classic social engineering pressure tactics.
- **WHOIS analysis** reveals attack infrastructure. A brand-new domain with privacy protection, registered days before a phishing campaign, is a major indicator of compromise (IoC).
- **Access logs** tell the full story — you can see the attacker testing the site, the victim clicking and submitting credentials, and the attacker harvesting the results.
- In real incident response, these four data points (spoofed sender, infrastructure creation date, victim identity, compromised credentials) feed directly into the timeline, IoC database, and remediation plan.
