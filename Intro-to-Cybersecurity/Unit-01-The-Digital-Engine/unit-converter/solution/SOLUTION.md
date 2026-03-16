# Solution — Unit Converter

## Flag

```
cyber{2048}
```

## Steps

1. Convert each file size to Bytes:

   | Alert | Given Size | Conversion | Bytes |
   |-------|-----------|------------|-------|
   | #1 | 4,096 bits | 4,096 ÷ 8 | **512 Bytes** |
   | #2 | 2 KiB | 2 × 1,024 | **2,048 Bytes** |
   | #3 | 12,288 bits | 12,288 ÷ 8 | **1,536 Bytes** |

2. Compare the three values: 512, 2048, 1536.
3. The largest is Alert #2 at **2,048 Bytes**.
4. Submit: `cyber{2048}`

## Key Concept

- **1 Byte = 8 bits** — divide bits by 8 to get Bytes.
- **1 KiB (kibibyte) = 1,024 Bytes** — the binary prefix, commonly used in computing.
- Capital **B** = Bytes, lowercase **b** = bits. This distinction matters in real security work — a 100 Mbps network is 100 mega*bits* per second, not megabytes.
