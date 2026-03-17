# Solution — Ghost in the Machine

## Flag

```
cyber{danielle_boo!_8888}
```

## Steps

### Part 1: Find the Prankster's Name (Acrostic)

1. Open `totally_not_a_virus.txt`.
2. It reads like random rambling, but the challenge says to read the **first letter of every line**.
3. Extract the first letter of each content line (ignoring the header/footer decorations):

   | Line | Text starts with... | First letter |
   |------|---------------------|:----------:|
   | 1 | "**D**ude if you're reading this..." | D |
   | 2 | "**A**ctually no wait forget I said that" | A |
   | 3 | "**N**ice weather we're having today isn't it" | N |
   | 4 | "**I**n no way shape or form did anyone..." | I |
   | 5 | "**E**lephants are the largest land mammals..." | E |
   | 6 | "**L**lamas however are underrated..." | L |
   | 7 | "**L**ots of people don't know that llamas..." | L |
   | 8 | "**E**veryone should own at least one llama..." | E |
   | — | *(blank line)* | — |
   | 9 | "**W**hy are you still reading this..." | W |
   | 10 | "**A**lso did you know that the mitoch..." | A |
   | 11 | "**S**eriously tho close this file..." | S |
   | 12 | "**H**onestly I don't know why this file..." | H |
   | 13 | "**E**very file on your computer is totally..." | E |
   | 14 | "**R**elax everything is under control..." | R |
   | 15 | "**E**verything is exactly where you left it..." | E |
   | — | *(blank line)* | — |
   | 16 | "**J**ust kidding lol check your startup folder" | J |
   | 17 | "**K**ing me in checkers sometime" | K |
   | 18 | "**!**!! this message will self destruct..." | ! |

4. Reading the first letters: **DANIELLE WASHERE JK!**
   - "DANIELLE WAS HERE JK!" — the prankster is **`danielle`**.

### Part 2: Decode the Hex Message

1. Open `startup_script.bat` and find the "TRANSMISSION" section.
2. The script echoes four hex values:
   ```
   62
   6f
   6f
   21
   ```
3. Convert hex to ASCII:

   | Hex | Decimal | ASCII |
   |-----|---------|:-----:|
   | 62  | 98      | b     |
   | 6f  | 111     | o     |
   | 6f  | 111     | o     |
   | 21  | 33      | !     |

4. The secret message is **`boo!`** 👻

### Part 3: Find the Homepage Port

1. Still in `startup_script.bat`, find the line that changes the browser homepage:
   ```
   REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page"
     /t REG_SZ /d "http://localhost:8888/you-have-been-pranked" /f
   ```
2. The URL is `http://localhost:8888/you-have-been-pranked`.
3. The port number is **`8888`**.

### Assembled Flag

- Prankster's name: `danielle`
- Decoded hex message: `boo!`
- Homepage port: `8888`
- Flag: `cyber{danielle_boo!_8888}`

## Bonus: What Else Does the Script Do?

For students who want to understand the full prank:

1. **Changes wallpaper** to `wizard_cat.jpg` via a registry edit (`HKCU\Control Panel\Desktop`).
2. **Changes homepage** to `http://localhost:8888/you-have-been-pranked`.
3. **Echoes hex** that decodes to "boo!".
4. **Opens 5 calculator windows** (`start calc.exe` × 5) — harmless but annoying.
5. **Pops up a message box** (`msg *`) revealing it's Danielle.
6. **Has a commented-out cleanup** — Danielle was going to delete the desktop file but "felt bad."

## What This Teaches

- **Acrostic steganography** — hiding messages in the first letters of lines is one of the oldest forms of steganography, dating back centuries.
- **Hex encoding** — a fundamental skill for cybersecurity. Being able to convert between hex, decimal, and ASCII is used constantly in malware analysis, CTFs, and forensics.
- **Windows persistence mechanisms** — the Startup folder runs scripts automatically. Real malware uses this (along with registry Run keys and scheduled tasks) to survive reboots.
- **Registry manipulation** — attackers (and pranksters) can change system settings via the Windows Registry. Understanding registry keys is essential for Windows forensics.
- **Reading code you didn't write** — the core skill here is analyzing an unfamiliar script and understanding what it does, line by line. This is exactly what malware analysts do.
