# Ghost in the Machine

**Category:** Intro to Cybersecurity  
**Difficulty:** Hard  
**Points:** 300

## Description

🖥️ HELP DESK TICKET #4078 — PRIORITY: PARANORMAL 🖥️

> **From:** Jamal Washington (Student, Period 3 — Computer Science)  
> **Subject:** my computer is literally haunted  
>  
> Mr. Henderson,  
>  
> I swear I'm not making this up. I left my laptop open during lunch  
> and when I came back:  
>  
> 1. There's a file on my desktop called `totally_not_a_virus.txt` that I did NOT put there  
> 2. My wallpaper changed to a picture of a cat in a wizard hat??  
> 3. My browser homepage is now some weird page I've never seen  
> 4. I found a script in my startup folder that I definitely didn't write  
>  
> I think someone pranked me but I don't know what any of this stuff means.  
> Can you guys figure out who did this and what they did?  
>  
> — Jamal (please help this is due 5th period)

The IT department recovered two files from Jamal's laptop. Your job is to reverse-engineer the prank:

**Files:**
- `totally_not_a_virus.txt` — the mystery file dropped on the desktop
- `startup_script.bat` — the script found in the Windows startup folder

Answer these three questions:

1. **Who did it?** The prankster left a signature hidden in `totally_not_a_virus.txt`. The file looks like random nonsense, but read the **first letter of every line** — it spells something. What's the **prankster's name**?
2. **What's the secret message?** The `.bat` script contains several `echo` commands that output hex values. **Decode the hex string** to reveal the message.
3. **What port does the "haunted" homepage run on?** The script sets the browser homepage to a URL. What **port number** is in that URL?

**Flag format:** `cyber{name_message_port}`  
Example: if the name is `alex`, the decoded message is `gotcha`, and the port is `8080` → `cyber{alex_gotcha_8080}`
