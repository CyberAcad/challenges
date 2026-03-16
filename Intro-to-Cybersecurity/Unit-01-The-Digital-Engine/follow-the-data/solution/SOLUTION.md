# Solution — Follow the Data

## Flag

```
cyber{03/16/26 17:44:22}
```

## Steps

1. Open the trace log and identify each step of the Information Processing Cycle: **Input → Processing → Output → Storage**.
2. Find the log entry where the IPC step is labeled **Storage**.
3. Read the timestamp on that entry.
4. Submit the timestamp in the format `cyber{MM/DD/YY HH:MM:SS}`.

## Key Concept

- The **Information Processing Cycle** has four stages: Input, Processing, Output, Storage.
- In a login event: the user types credentials (Input), the system validates them (Processing), a response is sent (Output), and a session token is saved (Storage).
