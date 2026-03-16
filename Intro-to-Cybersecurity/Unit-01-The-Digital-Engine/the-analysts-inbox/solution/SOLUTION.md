# Solution — The Analyst's Inbox

## Flag

```
cyber{128000_zip}
```

## Steps

### Part 1: Hex to Decimal Conversion

1. The file size is listed as `0x1F400`.
2. Convert hexadecimal to decimal:
   - `1 × 16⁴ = 65,536`
   - `F (15) × 16³ = 61,440`
   - `4 × 16² = 1,024`
   - `0 × 16¹ = 0`
   - `0 × 16⁰ = 0`
   - **Total: 65,536 + 61,440 + 1,024 = 128,000**
3. Or use CyberChef / Python: `int("1F400", 16)` → `128000`

### Part 2: Magic Bytes Identification

1. The magic bytes are `50 4B 03 04`.
2. `50 4B` in ASCII is `PK` — the initials of Phil Katz, creator of the ZIP format.
3. `50 4B 03 04` is the signature for a **ZIP** archive.
4. The file claims to be a PDF but is actually a ZIP — a classic malware delivery trick (ZIP archives can contain executables).

### Assembled Flag

- Decimal: `128000`
- File type: `zip`
- Flag: `cyber{128000_zip}`

## Key Concept

- This challenge combines **hex-to-decimal conversion** and **magic byte identification** — two core analyst skills.
- Attackers commonly disguise ZIP files (containing malware) as PDFs to trick users into opening them.
