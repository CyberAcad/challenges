# Solution — Ransomware Rescue

## Flag

```
cyber{itsaprank}
```

## Steps

The ransom note reveals the exact encryption process:
1. **Step 1:** ROT13 (shift every letter 13 places)
2. **Step 2:** Reverse the entire string

The encrypted flag is: `xanecnfgv`

To decode, undo the steps **in reverse order**:

### Step 1: Undo the Reverse

Flip `xanecnfgv` backwards:

```
xanecnfgv  →  vgfncenax
```

### Step 2: Undo the ROT13

Apply ROT13 to each letter (ROT13 is its own inverse):

```
v → i
g → t
f → s
n → a
c → p
e → r
n → a
a → n
x → k
```

Result: **`itsaprank`** 😎

### Flag: `cyber{itsaprank}`

## What This Teaches

- **Encoding is not encryption** — the "Homework Destroyers" used ROT13 and string reversal, which are obfuscation techniques, not real encryption. Real encryption uses keys and complex math. This teaches students the difference.
- **Reversing operations** — to decode, you undo transforms in reverse order (LIFO). This is the same principle used in network protocol decapsulation and forensic analysis.
- **ROT13** — a classic cipher that shifts letters by 13. Since the alphabet has 26 letters, applying ROT13 twice gives you back the original. It's widely used in CTFs and is a great intro to substitution ciphers.
- **Social engineering in ransom notes** — real ransomware uses fear and urgency. This note is funny, but real ones threaten data deletion with countdown timers. Recognizing the tactics matters even when the "encryption" is weak.
