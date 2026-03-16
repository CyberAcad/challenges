# The Analyst's Inbox

**Category:** Intro to Cybersecurity  
**Difficulty:** Medium  
**Points:** 150

## Description

You're a junior SOC analyst. An email has been quarantined by the gateway. Review the metadata log and answer two questions:

1. **Convert** the file size from hexadecimal to decimal.
2. **Identify** the actual file type from the magic bytes.

The filename claims to be a PDF, but the magic bytes tell a different story.

**Flag format:** `cyber{decimal_filetype}` — example: if it were 99999 bytes and a PNG → `cyber{99999_png}`
