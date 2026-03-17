# Solution — Operation Packet Snatcher

## Flag

```
cyber{n1c3_r0ut3}
```

## Steps

The intercepted message at Node C is: `3gh0e_3p1a`

### Step 1: Undo Node C → Reverse the string

Node C reversed the entire string. To undo it, reverse it again:

```
3gh0e_3p1a  →  a1p3_e0hg3
```

### Step 2: Undo Node B → Apply ROT13

Node B applied ROT13 to every letter. ROT13 is its own inverse (applying it twice returns the original), so we just ROT13 again:

```
a → n
1 → 1 (not a letter, unchanged)
p → c
3 → 3 (unchanged)
_ → _ (unchanged)
e → r
0 → 0 (unchanged)
h → u
g → t
3 → 3 (unchanged)
```

Result: **`n1c3_r0ut3`** — "nice route" 🕵️

### Flag: `cyber{n1c3_r0ut3}`

## What This Teaches

- **Data transforms through network hops** — as messages travel across networks, each node can modify, encrypt, or encapsulate the data. Understanding this is fundamental to how protocols like TLS, VPNs, and onion routing (Tor) work.
- **ROT13** — a classic substitution cipher. It's trivially breakable but teaches the concept of letter substitution, which underpins more serious ciphers.
- **Reverse engineering** — the core skill is working *backwards* through a process. This is exactly what analysts do when analyzing malware, tracing attacks, or debugging network issues.
- **Order of operations matters** — you must undo transforms in reverse order (LIFO). This mirrors how network protocol stacks process packets (encapsulation/decapsulation).
