# Solution — The Rickroll Protocol

## Flag

```
cyber{duckm4ster_rickroll_31337}
```

## Steps

### Part 1: Find the Prankster's Handle

1. Open `dns_records.txt` and look for anything personal or out of place.
2. Scroll to the TXT records section. There's a suspicious entry:
   ```
   pwned  IN  TXT  "you just got rick rolled by duckm4ster - class of 2026 baby"
   ```
3. The prankster signed their work. Their handle is **`duckm4ster`**.

### Part 2: Decode the Hidden Word

1. Find the "Mysterious A Records" section — eight entries labeled `node01` through `node08`.
2. All share the prefix `10.13.37.X` (a play on "1337" / leet). The last octet of each IP is:
   ```
   node01 → 114
   node02 → 105
   node03 → 99
   node04 → 107
   node05 → 114
   node06 → 111
   node07 → 108
   node08 → 108
   ```
3. Convert each number from decimal to ASCII:
   | Decimal | ASCII |
   |---------|-------|
   | 114     | r     |
   | 105     | i     |
   | 99      | c     |
   | 107     | k     |
   | 114     | r     |
   | 111     | o     |
   | 108     | l     |
   | 108     | l     |
4. The hidden word is **`rickroll`**.

### Part 3: Find the Secret Port

1. Look at the SRV records section. Two are normal (HTTP on 80, HTTPS on 443).
2. The third one is suspicious:
   ```
   _rickroll._tcp.secret  IN  SRV  0 5 31337  node01.murkywater.edu.
   ```
3. SRV record format is: `priority weight PORT target`.
4. The port is **`31337`** (leet-speak for "eleet" — a classic hacker culture reference).

### Assembled Flag

- Handle: `duckm4ster`
- Hidden word: `rickroll`
- Port: `31337`
- Flag: `cyber{duckm4ster_rickroll_31337}`

## What This Teaches

- **DNS poisoning** — The attacker changed A records and added CNAMEs to redirect all traffic to the rickroll site. This is exactly how real DNS cache poisoning / zone tampering works.
- **DNS record types** — Students learn what A, CNAME, TXT, SRV, MX, NS, and SOA records are by reading a real zone file.
- **ASCII encoding** — Data can be hidden in IP addresses by using the octets as character codes.
- **SRV records** — A lesser-known but important record type that specifies services, including the port they run on.
