# Solution — Magic Bytes

## Flag

```
cyber{jpeg}
```

## Steps

1. Open the hex dump file `suspicious_file.hex`.
2. Look at the first 3 bytes: `FF D8 FF`.
3. These are the magic bytes (file signature) for a **JPEG** image.
4. The ASCII column also shows `JFIF` at offset 0x06–0x09, which confirms it — JFIF is the JPEG File Interchange Format header.
5. The file was named `report.pdf`, but its actual content is a JPEG image — the extension was faked.

## Key Concept

- **Magic bytes** (file signatures) are the first few bytes of a file that identify its true type.
- Common signatures:
  - `FF D8 FF` → JPEG
  - `25 50 44 46` (`%PDF`) → PDF
  - `50 4B 03 04` (`PK`) → ZIP
  - `89 50 4E 47` → PNG
- Attackers rename malicious files to trick users and bypass basic filename-based filters.
