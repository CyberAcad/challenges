# Magic Bytes

**Category:** Intro to Cybersecurity  
**Difficulty:** Easy  
**Points:** 50

## Description

Every file type has a **magic number** — the first few bytes that identify it regardless of the filename extension. Security analysts use these to detect files masquerading as something else.

You intercepted a suspicious file on a compromised server. The filename says `report.pdf`, but your hex editor shows different magic bytes than expected.

Examine the hex dump provided and identify **what file type the magic bytes actually indicate**.

**Flag format:** `cyber{filetype}` (lowercase, common name)
