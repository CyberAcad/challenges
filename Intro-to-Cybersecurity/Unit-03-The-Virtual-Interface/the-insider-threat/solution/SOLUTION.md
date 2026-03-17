# Solution — The Insider Threat

## Flag

```
cyber{jsmith_.cleanup.sh_passwd}
```

## Steps

### Part 1: Identify the Compromised Account

1. Open `auth.log` and scan for patterns.
2. Starting at `22:14:07`, an external IP (`203.0.113.45`) begins rapid-fire login attempts — classic brute-force behavior:
   - `admin` → Failed (invalid user)
   - `administrator` → Failed (invalid user)
   - `root` → Failed (invalid user)
   - `test` → Failed (invalid user)
   - `guest` → Failed (invalid user)
   - `jsmith` → Failed 3 times, then **Accepted** at `22:14:51`
3. The attacker successfully brute-forced into the **`jsmith`** account.
4. After login, `jsmith` immediately ran `sudo crontab -e` and `sudo chmod +x /tmp/.cleanup.sh` — privilege escalation and persistence setup.

### Part 2: Find the Persistence Mechanism

1. Open `crontab_dump.txt` and examine each user's crontab.
2. In root's crontab, notice the entry added on `03/15`:
   ```
   0 */4 * * * /tmp/.cleanup.sh
   ```
3. This runs **`/tmp/.cleanup.sh`** every 4 hours as root.
4. The file is hidden (dot-prefix) and placed in `/tmp` — both red flags.
5. The cron script is **`.cleanup.sh`**.

### Part 3: Identify the Exfiltration Target

1. Open `processes.txt` and find the child processes of the cron job (PIDs 5520–5523).
2. PID 5522 reveals the command:
   ```
   /usr/bin/base64 /etc/passwd
   ```
3. The script is encoding **`/etc/passwd`** in base64.
4. PID 5523 confirms exfiltration — the encoded data is sent via `curl` to the attacker's IP (`203.0.113.45:8080`).

### Assembled Flag

- Compromised user: `jsmith`
- Persistence script: `.cleanup.sh`
- Targeted file: `passwd`
- Flag: `cyber{jsmith_.cleanup.sh_passwd}`

## Key Concept

- **Brute-force attacks** cycle through common usernames and passwords. The `auth.log` pattern (same source IP, rapid sequential failures, then success) is a textbook indicator.
- **Persistence** means the attacker doesn't need to break in again — a scheduled cron job re-executes their payload automatically.
- **Data exfiltration** doesn't have to be flashy. Base64-encoding a file and `curl`-ing it to a remote server is simple but effective.
- Defenders use log analysis (`auth.log`), crontab audits, and process monitoring to detect exactly this kind of attack chain.
