# Solution — Magic Bytes

## Flag

```
cyber{jpeg}
```

## Steps

1. Download `report.pdf` from the challenge.
2. Try opening it — it fails because it's not actually a PDF.
3. Go to [hexed.it](https://hexed.it) and upload the file.
4. Look at the very first bytes: `FF D8 FF E0`.
5. These are the magic bytes for a **JPEG** image.
6. The ASCII column also shows `JFIF` starting at offset 0x06, confirming it's a JPEG (JFIF = JPEG File Interchange Format).

## Key Concept

- **Magic bytes** (file signatures) are the first few bytes of a file that identify its true type, regardless of the file extension.
- Common signatures:
  - `FF D8 FF` → JPEG
  - `25 50 44 46` (`%PDF`) → PDF
  - `50 4B 03 04` (`PK`) → ZIP
  - `89 50 4E 47` → PNG
- Attackers rename malicious files to trick users and bypass basic filename-based filters. A hex editor reveals the truth.
